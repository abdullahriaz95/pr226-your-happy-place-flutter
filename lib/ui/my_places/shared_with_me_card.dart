import 'package:flutter/material.dart';

import 'package:happy_place/data/stores/my_places_stores/view_posts_store.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/models/checkable_my_post.dart';
import 'package:happy_place/ui/my_places/post_card.dart';
import 'package:happy_place/ui/widgets/rounded_border_image.dart';
import 'package:intl/intl.dart';

class ShareWithMeCard extends StatefulWidget {
  final SharedPost post;
  final List<Mood> moods;
  final ViewPostsStore store;
  final int index;

  const ShareWithMeCard({
    Key? key,
    required this.post,
    required this.moods,
    required this.store,
    required this.index,
  }) : super(key: key);

  @override
  State<ShareWithMeCard> createState() => _ShareWithMeCardState();
}

class _ShareWithMeCardState extends State<ShareWithMeCard> {
  DateTime? datePost;
  @override
  void initState() {
    datePost = DateFormat('y-M-d').parse(widget.post.entry!.postDate!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          children: [
            Row(
              children: [
                RoundedBorderBoxImage(
                  size: 50,
                  borderWidth: 2,
                  borderRadius: 6,
                  profileUrl: widget.post.user?.avatarUrl,
                  borderColor: Colors.white,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              widget.post.user!.fullName!.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Shared a Post',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      Text(
                        DateFormat('EEEEE, MMMM d, ''yyyy').format(datePost!),
                        // DateFormat.MMMMEEEEd().add_y().format(datePost!),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        widget.post.description != null
            ? const SizedBox(height: 4)
            : const SizedBox(),
        widget.post.description != null
            ? Text(
                widget.post.description!,
              )
            : const SizedBox(),
        const SizedBox(height: 4),
        PostsCard(
          post: CheckableMyPost(entry: widget.post.entry!, isChecked: false),
          moods: widget.moods,
          isSharedOne: true,
          store: widget.store,
          index: widget.index,
        ),
      ]),
    );
  }
}
