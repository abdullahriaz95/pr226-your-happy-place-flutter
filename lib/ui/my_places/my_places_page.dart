import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy_place/data/stores/my_places_stores/my_places_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/marker_generator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../injection.dart';
import 'add_place_page.dart';
import 'view_posts_page.dart';

class MyPlacesParams {
  const MyPlacesParams(this.key);
  final Key key;
}

@injectable
class MyPlacesServices {
  MyPlacesStore store;

  MyPlacesServices({
    required this.store,
  });
}

@injectable
class MyPlacesPage extends StatefulWidget {
  final MyPlacesServices services;
  final MyPlacesParams? params;
  MyPlacesPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<MyPlacesPage> createState() => _MyPlacesPageState();
}

class _MyPlacesPageState extends State<MyPlacesPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 7,
  );

  late List<ReactionDisposer> _disposers;
  late GoogleMapController googleMapController;

  mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    widget.services.store.customMarkers.clear();
    bitmaps.asMap().forEach((i, bmp) {
      widget.services.store.customMarkers.add(
        Marker(
            markerId: MarkerId("$i"),
            position: LatLng(
              double.parse(widget.services.store.myPosts[i].latitude!),
              double.parse(widget.services.store.myPosts[i].longitude!),
            ),
            icon: BitmapDescriptor.fromBytes(bmp),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => getIt<ViewPostsPage>(),
                ),
              );
              widget.services.store.init();
            }),
      );
    });
    widget.services.store.customMarkers = widget.services.store.customMarkers;
  }

  @override
  void initState() {
    _disposers = [
      reaction(
        (_) => widget.services.store.focusMyCurrentPosition,
        (int result) async {
          googleMapController = await _controller.future;
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(widget.services.store.locationData!.latitude,
                      widget.services.store.locationData!.longitude),
                  zoom: 16),
            ),
          );
        },
      ),
      reaction(
        (_) => widget.services.store.markersUpdated,
        (int markers) async {
          await Future.forEach(widget.services.store.myPosts,
              (Entry post) async {
            if (post.images != null) {
              if (post.images!.isNotEmpty) {
                await precacheImage(
                    NetworkImage(post.images!.first.imagePath!), context);
              }
            }
            return null;
          });

          MarkerGenerator(widget.services.store.markers.toList(), (bitmaps) {
            mapBitmapsToMarkers(bitmaps);
          }).generate(context);
        },
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    for (final d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).my_posts,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => getIt<AddPlacePage>(),
                  ),
                );
                widget.services.store.init();
              },
              child: Center(
                child: Text(
                  'Add',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Observer(builder: (context) {
            return GoogleMap(
              mapType: MapType.normal,
              markers: widget.services.store.customMarkers,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                widget.services.store.getLocationPermission();
              },
            );
          }),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: AppButton(
              title: S.of(context).view_all_posts,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => getIt<ViewPostsPage>(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
