import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/my_places_stores/view_posts_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/ui/my_places/add_place_page.dart';
import 'package:happy_place/ui/my_places/post_card.dart';
import 'package:happy_place/ui/my_places/shared_with_me_card.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

import '../../injection.dart';

class ViewPostsParams {
  const ViewPostsParams(this.key);
  final Key key;
}

@injectable
class ViewPostsServices {
  ViewPostsStore store;

  ViewPostsServices({
    required this.store,
  });
}

@injectable
class ViewPostsPage extends StatefulWidget {
  final ViewPostsServices services;
  final ViewPostsParams? params;
  ViewPostsPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  _ViewPostsPageState createState() => _ViewPostsPageState();
}

class _ViewPostsPageState extends State<ViewPostsPage> {
  Widget buildSegment(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFBFBFB),
      appBar: _appBar(),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Observer(builder: (context) {
            if (widget.services.store.isLoading) {
              return Column(
                children: const [
                  Center(
                    child: Loader(),
                  ),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Observer(builder: (context) {
                    if (widget.services.store.inDeletionMode) {
                      return _deleteLayout();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CupertinoSegmentedControl(
                          children: <int, Widget>{
                            0: buildSegment(S.of(context).my_posts),
                            1: buildSegment(S.of(context).shared_with_me),
                          },
                          padding: EdgeInsets.zero,
                          groupValue: widget.services.store.selectedTab,
                          onValueChanged: widget.services.store.toggleTabBar),
                    );
                  }),
                  const SizedBox(height: 12),
                  Expanded(
                    child: widget.services.store.selectedTab == 0
                        ? _myPostsList()
                        : _sharedWithMePosts(),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _deleteLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.services.store.checkAll,
                  onChanged: (s) {
                    widget.services.store.checkAllItems(s!);
                  }),
            ),
            const SizedBox(width: 3),
            const Text('Select all')
          ],
        ),
        GestureDetector(
          onTap: () {
            widget.services.store.inDeletionMode = false;
          },
          child: const Text('Cancel'),
        ),
        GestureDetector(
          onTap: () {
            widget.services.store.deletePosts();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Colors.red.shade900,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _myPostsList() {
    return Observer(builder: (context) {
      if (widget.services.store.myPosts.isEmpty) {
        return const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('No Posts'),
          ),
        );
      }
      return ListView.builder(
        itemCount: widget.services.store.myPosts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: PostsCard(
              post: widget.services.store.myPosts[index],
              moods: widget.services.store.moods,
              store: widget.services.store,
              index: index,
            ),
          );
        },
      );
    });
  }

  Widget _sharedWithMePosts() {
    return Observer(builder: (context) {
      if (widget.services.store.sharedWithMePosts.isEmpty) {
        return const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('No Posts'),
          ),
        );
      }

      return ListView.builder(
        itemCount: widget.services.store.sharedWithMePosts.length,
        itemBuilder: (context, index) {
          return ShareWithMeCard(
            post: widget.services.store.sharedWithMePosts[index],
            moods: widget.services.store.moods,
            store: widget.services.store,
            index: index,
          );
        },
      );
    });
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Observer(
        builder: (BuildContext context) {
          return widget.services.store.selectedTab == 0
              ? const Text('Location Name')
              : const Text('All Posts');
        },
      ),
      actions: [
        Observer(builder: (context) {
          if (widget.services.store.selectedTab == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: widget.services.store.inDeletionMode
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        widget.services.store.inDeletionMode = true;
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_delete.png',
                            height: 20,
                          ),
                        ],
                      ),
                    ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 8.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: const Icon(Icons.travel_explore),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () async {
                      var s = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => getIt<AddPlacePage>(),
                        ),
                      );
                      if (s != null) {
                        widget.services.store.init();
                      }
                    },
                    child: const Icon(Icons.add_circle_outline_outlined),
                  ),
                ),
              ],
            );
          }
        }),
      ],
    );
  }
}
