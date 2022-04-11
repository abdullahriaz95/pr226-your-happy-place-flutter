import 'package:chopper/chopper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/models/activity_selectable.dart';
import 'package:happy_place/models/mood_selectable.dart';
import 'package:happy_place/models/place_selectable.dart';
import 'package:happy_place/ui/widgets/explore_map_marker.dart';
import 'package:injectable/injectable.dart';

import 'package:mobx/mobx.dart';

part 'explore_store.g.dart';

@injectable
class ExploreStore = _ExploreStore with _$ExploreStore;

abstract class _ExploreStore with Store {
  final ApiProvider apiProvider;

  _ExploreStore({
    required this.apiProvider,
  }) {
    init();
  }

  init() async {
    await getPosts();
  }

  String? errorMessage;
  bool alreadyFocused = false;

  Position? locationData;

  @observable
  bool isLoading = false;

  @observable
  int currentTab = 0;

  @observable
  int focusMyCurrentPosition = 0;

  @observable
  int markersUpdated = 0;

  @observable
  List<Entry> places = [];

  @observable
  List<ExploreMapMarker> markers = [];

  @observable
  Set<Marker> customMarkers = {};

  @action
  getPosts() async {
    try {
      Response<EntriesIndexEntriesExplorerResponse> response;

      // await getLocationPermission();

      /* 
        Setting up the explore by field.
      */
      String exploreBy = 'all';
      if (searchAll || (searchMyEntries && searchFamilyAndFriends)) {
        exploreBy = 'all';
      } else if (searchMyEntries) {
        exploreBy = 'my';
      } else {
        exploreBy = 'others';
      }

      /* 
        Setting up the moods field. This will contain all the ids for moods, activities and places.
      */
      List<int> ids = [];
      for (var element in moodsSelectable) {
        if (element.isSelected) {
          ids.add(element.mood.id!);
        }
      }
      for (var element in activitySelectable) {
        if (element.isSelected) {
          ids.add(int.parse(element.activity.id!));
        }
      }

      for (var element in placesSelectable) {
        if (element.isSelected) {
          ids.add(element.place.id!);
        }
      }

      if (locationData != null && ids.isNotEmpty) {
        String s = ids.join(',');
        response = await apiProvider.apiClient.entiresGet(
          // lat: locationData!.latitude.toString(),
          // long: locationData!.longitude.toString(),
          perPage: 100,
          // radius: '200',
          exploreBy: exploreBy,
          moods: s,
        );
      } else if (locationData != null) {
        // there are no moods, activities and places selected.
        response = await apiProvider.apiClient.entiresGet(
          // lat: locationData!.latitude.toString(),
          // long: locationData!.longitude.toString(),
          perPage: 100,
          // radius: '200',
          exploreBy: exploreBy,
        );
      } else if (ids.isNotEmpty) {
        // there is no location selected.
        String s = ids.join(',');
        response = await apiProvider.apiClient.entiresGet(
          perPage: 100,
          exploreBy: exploreBy,
          moods: s,
        );
      } else {
        // ids are null here.
        response = await apiProvider.apiClient.entiresGet();
      }

      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        places = ApiSuccessParser.payloadOrThrow(response);
        markers.clear();
        for (var p in places) {
          //     final icon = await BitmapDescriptor.fromAssetImage(
          // ImageConfiguration(size: Size(24, 24)), 'assets/my_icon.png');
          markers.add(ExploreMapMarker(p));
          // markers.add(
          //   Marker(
          //     markerId: MarkerId(p.id!),
          //     position: LatLng(
          //       double.parse(p.latitude!),
          //       double.parse(p.longitude!),
          //     ),
          //     // icon : icon
          //   ),
          // );
        }

        markers = markers;
        markersUpdated++;
      } else {
        if (isLoading) isLoading = false;
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getLocationPermission() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      locationData = await Geolocator.getCurrentPosition();

      // Location location = Location();

      // bool _serviceEnabled;
      // PermissionStatus _permissionGranted;

      // _serviceEnabled = await location.serviceEnabled();
      // if (!_serviceEnabled) {
      //   _serviceEnabled = await location.requestService();
      //   if (!_serviceEnabled) {
      //     return;
      //   }
      // }

      // _permissionGranted = await location.hasPermission();
      // if (_permissionGranted == PermissionStatus.denied) {
      //   _permissionGranted = await location.requestPermission();
      //   if (_permissionGranted != PermissionStatus.granted) {
      //     return;
      //   }
      // }
      // print('got location');

      // locationData = await location.getLocation();
      // print('got location: ${locationData?.latitude}');

      if (!alreadyFocused) {
        alreadyFocused = true;
        focusMyCurrentPosition++;
      }
    } catch (e) {
      rethrow;
    }
  }

  /* 
  For filters page
  */

  @observable
  bool loadingFilterOptions = false;

  @observable
  bool searchAll = false;

  @observable
  bool searchMyEntries = false;

  @observable
  bool searchFamilyAndFriends = false;

  @observable
  ObservableList<ActivitySelectable> activitySelectable = ObservableList.of([]);

  @observable
  ObservableList<PlaceSelectable> placesSelectable = ObservableList.of([]);

  @observable
  ObservableList<MoodSelectable> moodsSelectable = ObservableList.of([]);

  @action
  loadFilters() async {
    loadingFilterOptions = true;
    await getMoods();
    await getPlaces();
    await getActivities();
    loadingFilterOptions = false;
  }

  @action
  getMoods() async {
    try {
      Response<MoodsListResponse> response =
          await apiProvider.apiClient.moodsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        moodsSelectable.clear();
        List<Mood>? moods = ApiSuccessParser.payloadOrThrow(response);
        if (moods != null) {
          for (var m in moods) {
            moodsSelectable.add(MoodSelectable(mood: m, isSelected: false));
          }
        }
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getPlaces() async {
    try {
      Response<PlacesListResponse> response =
          await apiProvider.apiClient.placesGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        placesSelectable.clear();
        List<Place>? places = ApiSuccessParser.payloadOrThrow(response);
        if (places != null) {
          for (var m in places) {
            placesSelectable.add(PlaceSelectable(place: m, isSelected: false));
          }
        }
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getActivities() async {
    try {
      Response<ActivitiesListResponse> response =
          await apiProvider.apiClient.activitiesGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        activitySelectable.clear();
        List<Activity>? activities = ApiSuccessParser.payloadOrThrow(response);
        if (activities != null) {
          for (var m in activities) {
            activitySelectable
                .add(ActivitySelectable(activity: m, isSelected: false));
          }
        }
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  refreshList() {
    moodsSelectable = moodsSelectable;
    placesSelectable = placesSelectable;
    activitySelectable = activitySelectable;
  }
}
