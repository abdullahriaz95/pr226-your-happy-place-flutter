import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/api_utils/http_exception.dart';

import 'package:happy_place/data/stores/my_places_stores/share_post_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:happy_place/ui/widgets/progress_dialog_layout.dart';
import 'package:injectable/injectable.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:mobx/mobx.dart';

import '../../injection.dart';
import 'select_friends_share_page.dart';

class SharePostParams {
  const SharePostParams({this.key, required this.post});
  final Key? key;
  final Entry post;
}

@injectable
class SharePostServices {
  SharePostStore store;

  SharePostServices({
    required this.store,
  });
}

@injectable
class SharePostPage extends StatefulWidget {
  final SharePostServices services;
  final SharePostParams? params;

  SharePostPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<SharePostPage> createState() => _SharePostPageState();
}

class _SharePostPageState extends State<SharePostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    widget.services.store.setPost(widget.params!.post);

    _disposers = [
      reaction(
        (_) => widget.services.store.sharingPost,
        (bool result) {
          if (result) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.grey.shade800,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  content: const ProgressDialogLayout(),
                );
              },
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
      reaction(
        (_) => widget.services.store.postShared,
        (bool result) {
          if (result) {
            Navigator.pop(context);
          }
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
        title: const Text('Share Post'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => getIt<SelectFriendsPage>(
                        param1: SelectFriendsParams(
                            sharePostStore: widget.services.store),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width,
                  child: Observer(builder: (context) {
                    return Text(
                      widget.services.store.friendOrFamily == null
                          ? 'Enter Friend\'s Name Here'
                          : widget.services.store.friendOrFamily!.fullName!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.grey),
                    );
                  }),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              AppEditText(
                textController:
                    widget.services.store.postCaptionTextEditingController,
                headingText: '',
                hint: 'Write something about this post',
                isMultiLine: true,
                filled: false,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).enter_post_caption;
                  } else {
                    return null;
                  }
                },
                borderColor: Colors.grey.shade400,
                radius: 26,
              ),
              const SizedBox(height: 16),
              _postLayout(context),
              const SizedBox(height: 24),
              AppButton(
                  title: 'Share Post',
                  onPressed: () {
                    if (widget.services.store.friendOrFamily == null) {
                      HttpExceptionNotifyUser.showError(
                          S.of(context).select_someone_first);
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      widget.services.store.sharePost();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postLayout(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(2.0),
        height: widget.params!.post.note != null ? 100 : 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.params!.post.images != null &&
                widget.params!.post.images!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: image.Image.network(
                  widget.params!.post.images!.first.imagePath!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            if (widget.params!.post.images != null &&
                widget.params!.post.images!.isNotEmpty)
              const SizedBox(width: 12.0),
            if (widget.params!.post.images!.isEmpty)
              const SizedBox(width: 12.0),
            _titleAndDesc(context)
          ],
        ),
      ),
    );
  }

  Widget _titleAndDesc(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.params!.post.title!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5.0),
            if (widget.params!.post.note != null)
              Expanded(
                child: Text(
                  widget.params!.post.note!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
