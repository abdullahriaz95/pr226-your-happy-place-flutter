import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/places_history/places_history_store.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/add_new_happy_place/add_new_happy_place.dart';
import 'package:happy_place/ui/places_history/view_note_page.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class PlaceHistoryPageParams {
  const PlaceHistoryPageParams(this.key);
  final Key key;
}

@injectable
class PlacesHistoryPageServices {
  PlacesHistoryStore store;
  PlacesHistoryPageServices({
    required this.store,
  });
}

@injectable
class PlacesHistoryPage extends StatefulWidget {
  final PlacesHistoryPageServices services;
  final PlaceHistoryPageParams? params;
  PlacesHistoryPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<PlacesHistoryPage> createState() => _PlacesHistoryPageState();
}

class _PlacesHistoryPageState extends State<PlacesHistoryPage> {
  AddNewHappyPlacePage store = getIt<AddNewHappyPlacePage>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Your Happy Place History'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        if (widget.services.store.isLoading) {
          return const Loader();
        } else {
          if (widget.services.store.myPlaces.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('No places added')),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Divider(),
                );
              },
              itemCount: widget.services.store.myPlaces.length,
              itemBuilder: (context, index) {
                return _happyPlaces(
                    context, widget.services.store.myPlaces[index]);

                // return Text(widget.services.store.myPlaces[index]. ??
                //     'undefined');
              },
            ),
          );
        }
      }),
    );
  }

  Widget _happyPlaces(BuildContext context, VisitedPlace vp) {
    bool containsANote = false;

    if (vp.feelingNote != null) {
      if (vp.feelingNote != '') {
        containsANote = true;
      }
    }
    return Observer(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    vp.location ?? '',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    if (containsANote) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => getIt<ViewNotePage>(
                            param1: ViewNotePageParams(
                              note: vp.feelingNote!,
                              location: vp.location!,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    containsANote ? 'View Note' : 'No Note Added',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: containsANote
                              ? Theme.of(context).primaryColor
                              : null,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image.Image.network(
                        vp.mood!.imageUrl!,
                        fit: BoxFit.contain,
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        vp.mood!.name!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 8),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.grey.shade100,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 2),
                            child: Text(
                              vp.moodType?.name ?? '',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(fontSize: 8),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image.Image.network(
                        vp.place!.imageUrl!,
                        fit: BoxFit.contain,
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        vp.place!.name!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 8),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.grey.shade100,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 2),
                            child: Text(
                              vp.placeType?.name ?? '',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(fontSize: 8),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image.Image.network(
                        vp.activity!.imageUrl!,
                        fit: BoxFit.contain,
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        vp.activity!.name!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 8),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.grey.shade100,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 2),
                            child: Text(
                              vp.activityType?.name ?? '',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(fontSize: 8),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  height: 40,
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image.Image.network(
                        vp.feeling!.imageUrl!,
                        fit: BoxFit.contain,
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        vp.feeling!.name!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 8),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.grey.shade100,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 2),
                            child: Text(
                              vp.feelingType?.name ?? '',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(fontSize: 8),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
