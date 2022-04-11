// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_posts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViewPostsStore on _ViewPostsStore, Store {
  final _$isLoadingAtom = Atom(name: '_ViewPostsStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$selectedTabAtom = Atom(name: '_ViewPostsStore.selectedTab');

  @override
  int get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(int value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  final _$myPostsAtom = Atom(name: '_ViewPostsStore.myPosts');

  @override
  List<CheckableMyPost> get myPosts {
    _$myPostsAtom.reportRead();
    return super.myPosts;
  }

  @override
  set myPosts(List<CheckableMyPost> value) {
    _$myPostsAtom.reportWrite(value, super.myPosts, () {
      super.myPosts = value;
    });
  }

  final _$moodsAtom = Atom(name: '_ViewPostsStore.moods');

  @override
  List<Mood> get moods {
    _$moodsAtom.reportRead();
    return super.moods;
  }

  @override
  set moods(List<Mood> value) {
    _$moodsAtom.reportWrite(value, super.moods, () {
      super.moods = value;
    });
  }

  final _$selectedMoodAtom = Atom(name: '_ViewPostsStore.selectedMood');

  @override
  Mood? get selectedMood {
    _$selectedMoodAtom.reportRead();
    return super.selectedMood;
  }

  @override
  set selectedMood(Mood? value) {
    _$selectedMoodAtom.reportWrite(value, super.selectedMood, () {
      super.selectedMood = value;
    });
  }

  final _$inDeletionModeAtom = Atom(name: '_ViewPostsStore.inDeletionMode');

  @override
  bool get inDeletionMode {
    _$inDeletionModeAtom.reportRead();
    return super.inDeletionMode;
  }

  @override
  set inDeletionMode(bool value) {
    _$inDeletionModeAtom.reportWrite(value, super.inDeletionMode, () {
      super.inDeletionMode = value;
    });
  }

  final _$checkAllAtom = Atom(name: '_ViewPostsStore.checkAll');

  @override
  bool get checkAll {
    _$checkAllAtom.reportRead();
    return super.checkAll;
  }

  @override
  set checkAll(bool value) {
    _$checkAllAtom.reportWrite(value, super.checkAll, () {
      super.checkAll = value;
    });
  }

  final _$sharedWithMePostsAtom =
      Atom(name: '_ViewPostsStore.sharedWithMePosts');

  @override
  List<SharedPost> get sharedWithMePosts {
    _$sharedWithMePostsAtom.reportRead();
    return super.sharedWithMePosts;
  }

  @override
  set sharedWithMePosts(List<SharedPost> value) {
    _$sharedWithMePostsAtom.reportWrite(value, super.sharedWithMePosts, () {
      super.sharedWithMePosts = value;
    });
  }

  final _$toggleTabBarAsyncAction = AsyncAction('_ViewPostsStore.toggleTabBar');

  @override
  Future toggleTabBar(int tab) {
    return _$toggleTabBarAsyncAction.run(() => super.toggleTabBar(tab));
  }

  final _$getPostsAsyncAction = AsyncAction('_ViewPostsStore.getPosts');

  @override
  Future getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  final _$getSharedPostsAsyncAction =
      AsyncAction('_ViewPostsStore.getSharedPosts');

  @override
  Future getSharedPosts() {
    return _$getSharedPostsAsyncAction.run(() => super.getSharedPosts());
  }

  final _$getMoodsAsyncAction = AsyncAction('_ViewPostsStore.getMoods');

  @override
  Future getMoods() {
    return _$getMoodsAsyncAction.run(() => super.getMoods());
  }

  final _$deletePostsAsyncAction = AsyncAction('_ViewPostsStore.deletePosts');

  @override
  Future deletePosts() {
    return _$deletePostsAsyncAction.run(() => super.deletePosts());
  }

  final _$_ViewPostsStoreActionController =
      ActionController(name: '_ViewPostsStore');

  @override
  dynamic checkAllItems(bool val) {
    final _$actionInfo = _$_ViewPostsStoreActionController.startAction(
        name: '_ViewPostsStore.checkAllItems');
    try {
      return super.checkAllItems(val);
    } finally {
      _$_ViewPostsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selectedTab: ${selectedTab},
myPosts: ${myPosts},
moods: ${moods},
selectedMood: ${selectedMood},
inDeletionMode: ${inDeletionMode},
checkAll: ${checkAll},
sharedWithMePosts: ${sharedWithMePosts}
    ''';
  }
}
