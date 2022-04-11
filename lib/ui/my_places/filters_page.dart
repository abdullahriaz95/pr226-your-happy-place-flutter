import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/explore/explore_store.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class FiltersPageParams {
  ExploreStore store;
  FiltersPageParams({
    this.key,
    required this.store,
  });
  final Key? key;
}

// @injectable
// class FiltersPageServices {
//   SettingsStore store;
//   FiltersPageServices({
//     required this.store,
//   });
// }

@injectable
class FiltersPage extends StatefulWidget {
  // final SettingsPageServices services;
  final FiltersPageParams? params;
  FiltersPage({
    @factoryParam this.params,
    // required this.services,
  }) : super(key: params?.key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  @override
  void initState() {
    widget.params!.store.loadFilters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Filter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Observer(builder: (context) {
            if (widget.params!.store.loadingFilterOptions) {
              return const Loader();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                _explorebySection(context),
                const SizedBox(height: 16),
                _moodSection(context),
                // const SizedBox(height: 16),
                _activitySection(context),
                // const SizedBox(height: 16),
                _placeSection(context),
                // const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: AppButton(
                    title: 'Filter',
                    onPressed: () {
                      widget.params?.store.getPosts();
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _explorebySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore By',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                value: widget.params!.store.searchAll,
                onChanged: (i) {
                  widget.params!.store.searchAll = i!;
                },
                fillColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(width: 4),
            const Text('Search All'),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                value: widget.params!.store.searchMyEntries,
                onChanged: (i) {
                  widget.params!.store.searchMyEntries = i!;
                },
                fillColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(width: 4),
            const Text('Search My Entries'),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                value: widget.params!.store.searchFamilyAndFriends,
                onChanged: (i) {
                  widget.params!.store.searchFamilyAndFriends = i!;
                },
                fillColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(width: 4),
            const Text('Search Family and Friends'),
          ],
        ),
      ],
    );
  }

  Widget _moodSection(BuildContext context) {
    return Observer(builder: (context) {
      List<Widget> moodsList = [];
      for (var m in widget.params!.store.moodsSelectable) {
        moodsList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: m.isSelected,
                    onChanged: (i) {
                      m.isSelected = i!;
                      widget.params!.store.refreshList();
                    },
                    fillColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(width: 8),
                Image.network(
                  m.mood.imageUrl!,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(m.mood.name!),
              ],
            ),
          ),
        );
      }

      return ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title:const Text('Mood'),
        children: <Widget>[...moodsList],
      );
    });
  }

  Widget _activitySection(BuildContext context) {
    return Observer(builder: (context) {


      List<Widget> wList = [];
      for (var m in widget.params!.store.activitySelectable) {
        wList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: m.isSelected,
                    onChanged: (i) {
                      m.isSelected = i!;
                      widget.params!.store.refreshList();
                    },
                    fillColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(width: 8),
                Image.network(
                  m.activity.imageUrl!,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(m.activity.name!),
              ],
            ),
          ),
        );
      }

      return ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title:const Text('Activity'),
        children: <Widget>[...wList],
      );
    });
  }

  Widget _placeSection(BuildContext context) {
    return Observer(builder: (context) {


      List<Widget> wList = [];
      for (var m in widget.params!.store.placesSelectable) {
        wList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: m.isSelected,
                    onChanged: (i) {
                      m.isSelected = i!;
                      widget.params!.store.refreshList();
                    },
                    fillColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(width: 8),
                Image.network(
                  m.place.imageUrl!,
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 8),
                Text(m.place.name!),
              ],
            ),
          ),
        );
      }

      return ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title:const Text('Place'),
        children: <Widget>[...wList],
      );
    });
  }
}
