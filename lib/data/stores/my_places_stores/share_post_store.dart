import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'share_post_store.g.dart';

@injectable
class SharePostStore = _SharePostStore with _$SharePostStore;

abstract class _SharePostStore with Store {
  final ApiProvider apiProvider;
  _SharePostStore({
    required this.apiProvider,
  });

  Entry? post;
  TextEditingController postCaptionTextEditingController =
      TextEditingController();

  String? message;

  @observable
  User? friendOrFamily;

  @observable
  int selectedTab = 0;

  @observable
  bool postShared = false;

  @observable
  bool sharingPost = false;

  @action
  toggleTabBar(int tab) async {
    selectedTab = tab;
  }

  @action
  setPost(Entry p) {
    post = p;
  }

  @action
  setFriendOrFamilyUser(User u) {
    friendOrFamily = u;
  }

  @action
  sharePost() async {
    try {
      sharingPost = true;
      Response<EntriesShareAPostsResponse> response =
          await apiProvider.apiClient.entriesSharePost(
              sharedTo: int.parse(friendOrFamily!.id!),
              postId: int.parse(post!.id!),
              description: postCaptionTextEditingController.text);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        if (sharingPost == true) sharingPost = false;

        message = response.body!.message;
        postShared = true;
      } else {
        if (sharingPost == true) sharingPost = false;

        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      if (sharingPost == true) sharingPost = false;
      rethrow;
    }
  }
}
