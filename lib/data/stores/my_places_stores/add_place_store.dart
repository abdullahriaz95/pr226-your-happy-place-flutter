import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';

import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/models/happy_place.dart';
import 'package:happy_place/ui/add_new_happy_place/add_new_happy_place.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'add_place_store.g.dart';

@injectable
class AddPlaceStore = _AddPlaceStore with _$AddPlaceStore;

abstract class _AddPlaceStore with Store {
  final ApiProvider apiProvider;

  final ImagePicker _picker = ImagePicker();

  _AddPlaceStore({
    required this.apiProvider,
  }) {
    getMoods();
  }

  TextEditingController locationController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Entry? postEntry; // used in editing mode

  @observable
  bool editingMode = false;

  @observable
  List<HappyPlace> placesAutoCompleteList = [];

  @observable
  HappyPlace? finalPlaceSelected;

  @observable
  List<Mood> moods = [];

  @observable
  bool privacyPrivate = true;

  @observable
  bool privacypublic = false;

  @observable
  bool privacyFamily = false;

  @observable
  bool privacyFriends = false;

  @observable
  Mood? selectedMood;

  @observable
  bool loadingPlaces = false;

  @observable
  bool showPlacesLayout = false;

  @observable
  int selectedTab = 0;

  @observable
  bool isLoading = false;

  @observable
  bool isUploadCompleted = false;

  @observable
  bool moodsLoading = false;

  @observable
  bool placeAdded = false;

  @observable
  bool uploading = false;

  @observable
  int moreThan5ImagesPicked = 0;

  @observable
  TextEditingController controller = TextEditingController();

  @observable
  List<String> images = [];

  @action
  setPostDetials(Entry post) {
    postEntry = post;
    finalPlaceSelected = HappyPlace(
      description: post.location!,
      latitude: double.parse(post.latitude!),
      longitude: double.parse(post.longitude!),
    );
    locationController.text = post.location!;
    titleController.text = post.title!;

    DateTime dt = DateFormat('y-M-d').parse(post.postDate!);
    dateController.text = DateFormat.yMMMMd('en_US').format(dt);

    noteController.text = post.note ?? '';
    if (post.privacyLevel == '1') {
      privacyPrivate = true;
      privacypublic = false;
      privacyFriends = false;
      privacyFamily = false;
    } else if (post.privacyLevel == '2') {
      privacyPrivate = false;
      privacypublic = true;
      privacyFriends = false;
      privacyFamily = false;
    } else if (post.privacyLevel == '3') {
      privacyPrivate = false;
      privacypublic = false;
      privacyFriends = true;
      privacyFamily = false;
    } else {
      privacyPrivate = false;
      privacypublic = false;
      privacyFriends = false;
      privacyFamily = true;
    }

    for (var m in moods) {
      if (m.id == post.moodId) {
        selectedMood = m;
      }
    }
    if (post.images != null) {
      for (var v in post.images!) {
        images.add(v.imagePath!);
      }
      images = images;
    }
  }

  @action
  choosePhoto() async {
    List<XFile?>? _pickedFiles = await _picker.pickMultiImage(
      imageQuality: 70,
    );

    if (_pickedFiles != null) {
      for (var file in _pickedFiles) {
        if (file?.path != null) {
          if (images.length >= 5) {
            // moreThan5ImagesPicked++;
          } else {
            images.add(file!.path);
          }
        }
      }
      images = images;
      // if (_pickedFiles.length > 5) {
      //   print('more than 5 images picked');
      //   moreThan5ImagesPicked++;
      // } else {
      //   for (var file in _pickedFiles) {
      //     if (file?.path != null) {
      //       if (images.length >= 5) {
      //         moreThan5ImagesPicked++;
      //       } else {
      //         images.add(file!.path);
      //       }
      //     }
      //   }
      //   images = images;
      // }
    }
  }

  @action
  uploadPlace() async {
    try {
      isLoading = true;
      // upload images first
      List<String> files = [];
      if (images.isNotEmpty) {
        for (var element in images) {
          var s = await updatePicture(element);
          if (s != null) {
            files.add(s);
          }
        }
      }
      // carry on the rest of stuff
      int privacyLevel = 1;
      if (privacyPrivate) {
        privacyLevel = 1;
      } else if (privacypublic) {
        privacyLevel = 2;
      } else if (privacyFriends) {
        privacyLevel = 3;
      } else if (privacyFamily) {
        privacyLevel = 4;
      }
      DateTime dt = DateFormat.yMMMMd('en_US').parse(dateController.text);
      Response<EntriesStoreResponse> response =
          await apiProvider.apiClient.entiresPost(
        location: finalPlaceSelected?.description,
        latitude: finalPlaceSelected?.latitude.toString(),
        longitude: finalPlaceSelected?.longitude.toString(),
        privacyLevel: privacyLevel,
        title: titleController.text,
        postDate: DateFormat('y-M-d').format(dt),
        moodId: selectedMood!.id,
        note: noteController.text,
        imagePaths: jsonEncode(files),
      );
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        // saved. go back;
        if (isLoading) isLoading = false;

        placeAdded = true;
      } else {
        if (isLoading) isLoading = false;
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      if (isLoading) isLoading = false;
      rethrow;
    }
  }

  @action
  getMoods() async {
    try {
      moodsLoading = true;
      Response<MoodsListResponse> response =
          await apiProvider.apiClient.moodsGet();

      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        moods = ApiSuccessParser.payloadOrThrow(response);
        selectedMood = moods.first;
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }

      if (editingMode) {
        // setting moods now
        for (var m in moods) {
          if (m.id == postEntry!.moodId) {
            selectedMood = m;
          }
        }
      }

      moodsLoading = false;
    } catch (e) {
      moodsLoading = false;
      rethrow;
    }
  }

  @action
  searchAddressWithAutoComplete(String value) async {
    placesAutoCompleteList.clear();
    showPlacesLayout = true;
    loadingPlaces = true;
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesAutocompleteResponse placesAutoCompleteResponse =
        await _places.autocomplete(value);

    if (placesAutoCompleteResponse.status == 'OK') {
      if (placesAutoCompleteResponse.predictions.isNotEmpty) {
        await Future.forEach(placesAutoCompleteResponse.predictions,
            (Prediction prediction) async {
          if (prediction.description != null) {
            double? latitude, longitude;
            PlacesDetailsResponse placeDetails =
                await _places.getDetailsByPlaceId(prediction.placeId!);
            latitude = placeDetails.result.geometry?.location.lat;
            longitude = placeDetails.result.geometry?.location.lng;
            placesAutoCompleteList.add(
              HappyPlace(
                  description: prediction.description!,
                  latitude: latitude!,
                  longitude: longitude!),
            );
          }
        });
        placesAutoCompleteList = placesAutoCompleteList;
        loadingPlaces = false;
      }
    }
  }

  @action
  Future<String?> updatePicture(String path) async {
    if (path.contains('http')) {
      return path;
    }

    var request = http.MultipartRequest(
        'POST', Uri.parse(apiProvider.apiClient.client.baseUrl + '/image'));
    request.files.add(await http.MultipartFile.fromPath('image', path));
    request.headers['x-access-token'] =
        apiProvider.userProvider.user!.accessToken!;
    request.headers['x-api-key'] = apiProvider.apiSettings.apiKey;
    var response = await apiProvider.apiClient.client.httpClient.send(request);
    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();
      final Map<String, dynamic> bodyJson = json.decode(body);

      bodyJson['message'] ?? '';
      var url = bodyJson['payload']['url'];

      return url;
    } else {
      final body = await response.stream.bytesToString();
      final Map<String, dynamic> bodyJson = json.decode(body);
      bodyJson['message'] ?? '';
      return null;
    }
  }

  @action
  updatePost() async {
    try {
      isLoading = true;
      // upload images first
      List<String> files = [];
      if (images.isNotEmpty) {
        for (var element in images) {
          var s = await updatePicture(element);
          if (s != null) {
            files.add(s);
          }
        }
      }
      // carry on the rest of stuff
      int privacyLevel = 1;
      if (privacyPrivate) {
        privacyLevel = 1;
      } else if (privacypublic) {
        privacyLevel = 2;
      } else if (privacyFriends) {
        privacyLevel = 3;
      } else if (privacyFamily) {
        privacyLevel = 4;
      }

      Response<EntriesUpdateResponse> response =
          await apiProvider.apiClient.entriesIdPut(
        id: postEntry!.id,
        location: finalPlaceSelected?.description,
        latitude: finalPlaceSelected?.latitude.toString(),
        longitude: finalPlaceSelected?.longitude.toString(),
        privacyLevel: privacyLevel,
        title: titleController.text,
        postDate: dateController.text,
        moodId: selectedMood!.id,
        note: noteController.text,
        imagePaths: jsonEncode(files),
      );
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        // saved. go back;
        if (isLoading) isLoading = false;

        placeAdded = true;
      } else {
        if (isLoading) isLoading = false;
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      if (isLoading) isLoading = false;
      rethrow;
    }
  }
}
