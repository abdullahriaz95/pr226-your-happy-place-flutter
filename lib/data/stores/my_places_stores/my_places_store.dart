import 'package:chopper/chopper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/map_marker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'my_places_store.g.dart';

@injectable
class MyPlacesStore = _MyPlacesStore with _$MyPlacesStore;

abstract class _MyPlacesStore with Store {
  final ApiProvider apiProvider;

  _MyPlacesStore({
    required this.apiProvider,
  }) {
    init();
  }

  init() async {
    // await getLocationPermission();
    getPosts();
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
  List<Entry> myPosts = [];

  @observable
  List<MapMarker> markers = [];

  @observable
  Set<Marker> customMarkers = {};

  @action
  getPosts() async {
    try {
      Response<EntriesListResponse> response;
      if (locationData != null) {
        response = await apiProvider.apiClient.entriesGet(
          filter: 'my',
        ); // if needed, then we can do with lat lng

        // response = await apiProvider.apiClient.entriesGet(
        //   filter: 'my',
        //   longitude: locationData!.longitude.toString(),
        //   latitude: locationData!.latitude.toString(),
        // );
      } else {
        response = await apiProvider.apiClient.entriesGet(filter: 'my');
      }

      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        myPosts = ApiSuccessParser.payloadOrThrow(response);
        markers.clear();
        for (var p in myPosts) {
          //     final icon = await BitmapDescriptor.fromAssetImage(
          // ImageConfiguration(size: Size(24, 24)), 'assets/my_icon.png');

          markers.add(MapMarker(p));
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

      if (!alreadyFocused) {
        alreadyFocused = true;
        focusMyCurrentPosition++;
      }

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
      // print(
      //     'starting getLocationPermission : permission received: ${_permissionGranted.name}');
      // if (_permissionGranted == PermissionStatus.denied) {
      //   _permissionGranted = await location.requestPermission();
      //   if (_permissionGranted != PermissionStatus.granted) {
      //     return;
      //   }
      // }

      // locationData = await location.getLocation();
      // print(
      //     'starting getLocationPermission : location received: ${locationData?.latitude}');

    } catch (e) {
      rethrow;
    }
  }
}
