import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/my_places_stores/select_friend_share_post_store.dart';
import 'package:happy_place/data/stores/my_places_stores/share_post_store.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:happy_place/ui/widgets/app_tab_layout.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:happy_place/ui/widgets/rounded_border_image.dart';
import 'package:injectable/injectable.dart';

class SelectFriendsParams {
  SelectFriendsParams({this.key, required this.sharePostStore});
  final Key? key;
  final SharePostStore sharePostStore;
}

@injectable
class SelectFriendsServices {
  final SelectFriendSharePostStore store;
  SelectFriendsServices({
    required this.store,
  });
}

@injectable
class SelectFriendsPage extends StatefulWidget {
  final SelectFriendsServices services;
  final SelectFriendsParams? params;

  SelectFriendsPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  _SelectFriendsPageState createState() => _SelectFriendsPageState();
}

class _SelectFriendsPageState extends State<SelectFriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
        title: const Text('Add Friend to Share Post'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        if (widget.services.store.isLoading) {
          return const Loader();
        } else {
          return _body();
        }
      }),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        AppEditText(
          headingText: '',
          hint: 'Search',
          radius: 40,
          borderColor: Colors.grey.shade300,
          prefixIcon: const Icon(Icons.search_rounded),
        ),
        const SizedBox(height: 16),
        AppTabLayout(
            tab1Text: 'Friends',
            tab2Text: 'Family',
            ontap: (s) {
              if (s == 0) {
                // friends
                widget.services.store.updatePeopleCategory('Friends');
              } else {
                // family
                widget.services.store.updatePeopleCategory('Family');
              }
            }),
        // _friendsAndFamilySegment(),
        _list(),
      ]),
    );
  }

  Widget _list() {
    return Observer(builder: (context) {
      if (widget.services.store.peopleCategory == 'Friends') {
        if (widget.services.store.friends.isEmpty) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('No Friends Added'),
          ));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.services.store.friends.length,
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Divider(),
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    User user = widget.services.store.friends[index];
                    await widget.params!.sharePostStore
                        .setFriendOrFamilyUser(user);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      RoundedBorderBoxImage(
                          borderColor: Colors.transparent,
                          size: 40,
                          borderRadius: 100,
                          profileUrl:
                              widget.services.store.friends[index].avatarUrl),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Text(
                              widget.services.store.friends[index].fullName!)),
                      const SizedBox(width: 16),
                    ],
                  ),
                );
              }),
        );
      } else {
        //family
        if (widget.services.store.family.isEmpty) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('No Family Added'),
          ));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.services.store.family.length,
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Divider(),
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    User user = widget.services.store.family[index];
                    await widget.params!.sharePostStore
                        .setFriendOrFamilyUser(user);
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      RoundedBorderBoxImage(
                          borderColor: Colors.transparent,
                          size: 40,
                          borderRadius: 100,
                          profileUrl:
                              widget.services.store.family[index].avatarUrl),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Text(
                              widget.services.store.family[index].fullName!)),
                      const SizedBox(width: 16),
                    ],
                  ),
                );
              }),
        );
      }
    });
  }
}
