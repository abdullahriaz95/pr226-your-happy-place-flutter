import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/my_places_stores/view_posts_store.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/models/checkable_my_post.dart';
import 'package:happy_place/ui/my_places/add_place_page.dart';
import 'package:happy_place/ui/my_places/share_post_page.dart';
import 'package:intl/intl.dart';
import 'package:page_indicator/page_indicator.dart';

import '../../injection.dart';

class PostsCard extends StatefulWidget {
  final CheckableMyPost post;
  final List<Mood> moods;
  final bool isSharedOne;
  final ViewPostsStore store;
  final int index;
  const PostsCard({
    Key? key,
    this.isSharedOne = false,
    required this.post,
    required this.moods,
    required this.store,
    required this.index,
  }) : super(key: key);

  @override
  State<PostsCard> createState() => _PostsCardState();
}

class _PostsCardState extends State<PostsCard> {
  String? postMood;

  @override
  initState() {
    Mood m = widget.moods
        .firstWhere((element) => element.id == widget.post.entry.moodId);
    postMood = m.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _imagesPageView(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _title(context),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _location(),
                                const SizedBox(height: 4),
                                _date(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (postMood != null)
                            image.Image.network(
                              postMood!,
                              height: 40,
                              width: 40,
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (widget.post.entry.note != null)
                        Text(widget.post.entry.note!),
                      if (widget.isSharedOne) const SizedBox(height: 12),
                      if (!widget.isSharedOne) const Divider(),
                      if (!widget.isSharedOne) _editAndShare(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Observer(builder: (context) {
            if (widget.store.inDeletionMode) {
              return Checkbox(
                  value: widget.store.myPosts[widget.index].isChecked,
                  onChanged: (s) {
                    widget.store.myPosts[widget.index].isChecked = s!;
                    widget.store.myPosts = widget.store.myPosts;
                  });
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      widget.post.entry.title!,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
    );
  }

  Widget _location() {
    return Row(
      children: [
        image.Image.asset(
          'assets/images/ic_location_post.png',
          height: 12,
          width: 12,
          color: Colors.grey.shade300,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(child: Text(widget.post.entry.location!)),
      ],
    );
  }

  Widget _date() {
    DateTime dt = DateFormat('y-M-d').parse(widget.post.entry.postDate!);
    String s = DateFormat.yMMMMd('en_US').format(dt);
    return Row(
      children: [
        image.Image.asset(
          'assets/images/ic_date_post.png',
          height: 12,
          width: 12,
          color: Colors.grey.shade300,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(s),
      ],
    );
  }

  Widget _editAndShare() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => getIt<SharePostPage>(
                    param1: SharePostParams(post: widget.post.entry),
                  ),
                ),
              );
            },
            child: Row(
              children: [
                image.Image.asset(
                  'assets/images/ic_share.png',
                  height: 16,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(width: 8),
                Text(
                  'Share',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.grey.shade300,
                      ),
                ),
              ],
            ),
          ),
          Container(
            height: 16,
            width: 0.5,
            color: Colors.grey,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  var s = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getIt<AddPlacePage>(
                        param1: AddPlaceParams(post: widget.post.entry),
                      ),
                    ),
                  );
                  if (s != null) {
                    widget.store.init();
                  }
                },
                child: Row(
                  children: [
                    image.Image.asset(
                      'assets/images/ic_edit_profile.png',
                      height: 16,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Edit',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey.shade300,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _imagesPageView() {
    if (widget.post.entry.images?.isNotEmpty ?? false) {
      return Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: PageIndicatorContainer(
              length: widget.post.entry.images!.length,
              align: IndicatorAlign.bottom,
              child: PageView.builder(
                itemCount: widget.post.entry.images!.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: image.Image.network(
                      widget.post.entry.images![index].imagePath!,
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }

    return Observer(builder: (context) {
      if (widget.store.inDeletionMode) {
        return const SizedBox(height: 40);
      }

      return const SizedBox(height: 10);
    });
  }
}
