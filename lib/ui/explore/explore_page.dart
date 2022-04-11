import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy_place/data/stores/explore/explore_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/my_places/filters_page.dart';
import 'package:happy_place/ui/settings/information_page.dart';
import 'package:happy_place/ui/widgets/marker_generator.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../injection.dart';

class ExplorePageParams {
  const ExplorePageParams(this.key);
  final Key key;
}

@injectable
class ExploreServices {
  ExploreStore store;

  ExploreServices({
    required this.store,
  });
}

@injectable
class ExplorePage extends StatefulWidget {
  final ExploreServices services;
  final ExplorePageParams? params;
  ExplorePage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
              double.parse(widget.services.store.places[i].latitude!),
              double.parse(widget.services.store.places[i].longitude!),
            ),
            icon: BitmapDescriptor.fromBytes(bmp),
            onTap: () async {
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => getIt<ViewPostsPage>(),
              //   ),
              // );
              // widget.services.store.init();
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
          await Future.forEach(widget.services.store.places,
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
          S.of(context).explore,
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
                    builder: (context) => getIt<InformationPage>(),
                  ),
                );
                widget.services.store.init();
              },
              child: Center(
                child: image.Image.asset(
                  'assets/images/ic_about.png',
                  height: 20,
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
            padding: const EdgeInsets.only(top: 12.0, right: 16, left: 16),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                isDense: true,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                hintText: "Search",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: Colors.grey.shade400,
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 22,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => getIt<FiltersPage>(
                          param1:
                              FiltersPageParams(store: widget.services.store),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          image.Image.asset(
                            'assets/images/ic_filter.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Filter',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: Colors.grey.shade400,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
