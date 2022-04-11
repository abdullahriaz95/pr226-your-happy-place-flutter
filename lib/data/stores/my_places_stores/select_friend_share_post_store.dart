import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'select_friend_share_post_store.g.dart';

@injectable
class SelectFriendSharePostStore = _SelectFriendSharePostStore
    with _$SelectFriendSharePostStore;

abstract class _SelectFriendSharePostStore with Store {
  final ApiProvider apiProvider;
  _SelectFriendSharePostStore({
    required this.apiProvider,
  }) {
    init();
  }

  @action
  init() async {
    isLoading = true;
    await getMyFamily();
    await getMyFriends();
    isLoading = false;
  }

  Entry? post;

  TextEditingController postCaptionTextEditingController =
      TextEditingController();

  String? errorMessage;

  @observable
  bool isLoading = false;

  @observable
  int error = 1;

  @observable
  String peopleCategory = 'Friends';

  @observable
  List<User> friends = [];

  @observable
  List<User> family = [];

  @observable
  int selectedTab = 0;

  @action
  toggleTabBar(int tab) async {
    selectedTab = tab;
  }

  @action
  setPost(Entry p) {
    post = p;
  }

  @action
  updatePeopleCategory(String value) {
    peopleCategory = value;
  }

  @action
  getMyFriends() async {
    try {
      friends.clear();
      Response<ProfileMyFriendsResponse> response =
          await apiProvider.apiClient.friendsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        friends = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getMyFamily() async {
    try {
      family.clear();
      Response<ProfileMyFamilyResponse> response =
          await apiProvider.apiClient.familyGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        family = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {

      rethrow;
    }
  }
}
