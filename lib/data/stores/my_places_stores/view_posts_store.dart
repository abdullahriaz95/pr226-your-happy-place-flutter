import 'package:chopper/chopper.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/models/checkable_my_post.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'view_posts_store.g.dart';

@injectable
class ViewPostsStore = _ViewPostsStore with _$ViewPostsStore;

abstract class _ViewPostsStore with Store {
  final ApiProvider apiProvider;

  _ViewPostsStore({
    required this.apiProvider,
  }) {
    init();
  }

  init() async {
    isLoading = true;
    await getMoods();
    await getPosts();
    await getSharedPosts();
    isLoading = false;
  }

  @observable
  bool isLoading = false;

  @observable
  int selectedTab = 0;

  @observable
  List<CheckableMyPost> myPosts = [];

  @observable
  List<Mood> moods = [];

  @observable
  Mood? selectedMood;

  @observable
  bool inDeletionMode = false;

  @observable
  bool checkAll = false;

  @observable
  List<SharedPost> sharedWithMePosts = [];

  @action
  toggleTabBar(int tab) async {
    selectedTab = tab;
  }

  @action
  checkAllItems(bool val) {
    checkAll = val;
    if (selectedTab == 0) {
      // my posts
      for (var i in myPosts) {
        i.isChecked = val;
      }
      myPosts = myPosts;
    }
  }

  @action
  getPosts() async {
    try {
      myPosts.clear();
      Response<EntriesListResponse> response =
          await apiProvider.apiClient.entriesGet(filter: 'my');
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        List<Entry> listEntry = [];

        listEntry = ApiSuccessParser.payloadOrThrow(response);
        for (var l in listEntry) {
          myPosts.add(
            CheckableMyPost(entry: l, isChecked: false),
          );
        }
        myPosts = myPosts;

      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }

    } catch (e) {

      rethrow;
    }
  }

  @action
  getSharedPosts() async {
    try {
      sharedWithMePosts.clear();
      Response<EntriesGetSharedPostsResponse> response =
          await apiProvider.apiClient.entriesSharedPostsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        sharedWithMePosts = ApiSuccessParser.payloadOrThrow(response);

      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }

    } catch (e) {

      rethrow;
    }
  }

  @action
  getMoods() async {
    try {
      Response<MoodsListResponse> response =
          await apiProvider.apiClient.moodsGet();

      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        moods = ApiSuccessParser.payloadOrThrow(response);
        selectedMood = moods.first;
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  deletePosts() async {
    try {
      List<String> listOfIds = [];
      if (selectedTab == 0) {
        for (var i in myPosts) {
          if (i.isChecked) {
            listOfIds.add(i.entry.id!);
          }
        }
      }

      if (listOfIds.isNotEmpty) {
        String commaSeperatedListOfIds = listOfIds.join(', ');

 await apiProvider.apiClient
            .entriesDelete(idList: commaSeperatedListOfIds);
        inDeletionMode = false;
        await HttpExceptionNotifyUser.showMessage('Posts Deleted');
        init();
      }
    } catch (e) {
      rethrow;
    }
  }
}
