import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/profile_store.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/profile/add_people.dart';
import 'package:happy_place/ui/profile/edit_profile_page.dart';
import 'package:happy_place/ui/widgets/app_tab_layout.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:happy_place/ui/widgets/rounded_border_image.dart';
import 'package:injectable/injectable.dart';

class ProfilePageParams {
  const ProfilePageParams(this.key);
  final Key key;
}

@injectable
class ProfilePageServices {
  ProfileStore store;
  ProfilePageServices({
    required this.store,
  });
}

@injectable
class ProfilePage extends StatefulWidget {
  final ProfilePageServices services;
  final ProfilePageParams? params;
  ProfilePage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    widget.services.store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        child: Observer(builder: (context) {
          if (widget.services.store.isLoading) {
            return const Loader();
          } else {
            return Stack(
              children: [
                _coverBanner(context),
                _mainContent(context),
                _profileImage(context),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget _mainContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.3,
        left: 16.0,
        right: 16.0,
      ),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: GestureDetector(
                  onTap: () async {
                    var ss = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => getIt<EditProfilePage>(),
                      ),
                    );
                    if (ss != null) {
                      widget.services.store.init();
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/ic_edit_profile.png',
                        height: 16,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Edit',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey.shade400,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.services.store.user?.fullName ?? '',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 8),
            if (widget.services.store.user?.description != null)
              Text(
                widget.services.store.user?.description ?? '',
              ),
            if (widget.services.store.user?.description != null)
              const SizedBox(height: 32),
            if (widget.services.store.user?.description == null)
              const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My People',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget.services.store.deletionMode = true;
                        widget.services.store.deletionMode =
                            widget.services.store.deletionMode;
                      },
                      child: Image.asset(
                        'assets/images/ic_delete.png',
                        height: 22,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => getIt<AddPeoplePage>(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),
            widget.services.store.deletionMode
                ? _deleteLayout()
                : _friendsAndFamilySegment(),
            const SizedBox(height: 12),
            _list(),
          ],
        ),
      ),
    );
  }

  Widget _list() {
    return Observer(builder: (context) {
      var getDeleteMode = widget.services.store.deletionMode;
      if (widget.services.store.peopleCategory == 'Friends') {
        if (widget.services.store.friends.isEmpty) {
          return const Center(child: Text('No Friends Added'));
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
                return Row(
                  children: [
                    RoundedBorderBoxImage(
                        borderColor: Colors.transparent,
                        size: 40,
                        borderRadius: 100,
                        profileUrl: widget
                            .services.store.friends[index].user.avatarUrl),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Text(widget
                            .services.store.friends[index].user.fullName!)),
                    const SizedBox(width: 16),
                    getDeleteMode
                        ? Checkbox(
                            value: widget.services.store.friends[index].checked,
                            onChanged: (v) {
                              widget.services.store.friends[index].checked = v!;
                              widget.services.store.friends =
                                  widget.services.store.friends;
                            })
                        : const SizedBox(),
                  ],
                );
              }),
        );
      } else {
        //family
        if (widget.services.store.family.isEmpty) {
          return const Center(child: Text('No Family Added'));
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
                return Row(
                  children: [
                    RoundedBorderBoxImage(
                        borderColor: Colors.transparent,
                        size: 40,
                        borderRadius: 100,
                        profileUrl:
                            widget.services.store.family[index].user.avatarUrl),
                    const SizedBox(width: 16),
                    Expanded(
                        child: Text(widget
                            .services.store.family[index].user.fullName!)),
                    const SizedBox(width: 16),
                    getDeleteMode
                        ? Checkbox(
                            value: widget.services.store.family[index].checked,
                            onChanged: (v) {
                              widget.services.store.family[index].checked = v!;
                              widget.services.store.family =
                                  widget.services.store.family;
                            })
                        : const SizedBox(),
                  ],
                );
              }),
        );
      }
    });
  }

  Widget _deleteLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
            widget.services.store.deletionMode = false;
          },
          child: const Text('Cancel'),
        ),
        GestureDetector(
          onTap: () {
            widget.services.store.deleteFriendsAndFamily();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Colors.red.shade900,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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

  Widget _friendsAndFamilySegment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppTabLayout(
        tab1Text: 'Friends',
        tab2Text: 'Family',
        alreadySelectedtab:
            widget.services.store.peopleCategory == 'Friends' ? 0 : 1,
        ontap: (s) {
          if (s == 0) {
            // friends
            widget.services.store.updatePeopleCategory('Friends');
          } else {
            // family
            widget.services.store.updatePeopleCategory('Family');
          }
        },
      ),
    );
  }

  Widget _profileImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        top: (MediaQuery.of(context).size.height * 0.3) - 40,
      ),
      child: RoundedBorderBoxImage(
        size: 80,
        borderRadius: 12,
        profileUrl: widget.services.store.user?.avatarUrl,
      ),
    );
  }

  Widget _coverBanner(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          Image.network(
            widget.services.store.user?.coverImageUrl ?? '',
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception, stackTrace) {
              return Image.asset(
                'assets/images/default_background.jpg',
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  widget.services.store.pickCoverImage();
                },
                child: Image.asset(
                  'assets/images/btn_add_photo.png',
                  height: 50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
