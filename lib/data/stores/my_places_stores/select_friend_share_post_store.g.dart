// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_friend_share_post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectFriendSharePostStore on _SelectFriendSharePostStore, Store {
  final _$isLoadingAtom = Atom(name: '_SelectFriendSharePostStore.isLoading');

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

  final _$errorAtom = Atom(name: '_SelectFriendSharePostStore.error');

  @override
  int get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(int value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$peopleCategoryAtom =
      Atom(name: '_SelectFriendSharePostStore.peopleCategory');

  @override
  String get peopleCategory {
    _$peopleCategoryAtom.reportRead();
    return super.peopleCategory;
  }

  @override
  set peopleCategory(String value) {
    _$peopleCategoryAtom.reportWrite(value, super.peopleCategory, () {
      super.peopleCategory = value;
    });
  }

  final _$friendsAtom = Atom(name: '_SelectFriendSharePostStore.friends');

  @override
  List<User> get friends {
    _$friendsAtom.reportRead();
    return super.friends;
  }

  @override
  set friends(List<User> value) {
    _$friendsAtom.reportWrite(value, super.friends, () {
      super.friends = value;
    });
  }

  final _$familyAtom = Atom(name: '_SelectFriendSharePostStore.family');

  @override
  List<User> get family {
    _$familyAtom.reportRead();
    return super.family;
  }

  @override
  set family(List<User> value) {
    _$familyAtom.reportWrite(value, super.family, () {
      super.family = value;
    });
  }

  final _$selectedTabAtom =
      Atom(name: '_SelectFriendSharePostStore.selectedTab');

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

  final _$initAsyncAction = AsyncAction('_SelectFriendSharePostStore.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$toggleTabBarAsyncAction =
      AsyncAction('_SelectFriendSharePostStore.toggleTabBar');

  @override
  Future toggleTabBar(int tab) {
    return _$toggleTabBarAsyncAction.run(() => super.toggleTabBar(tab));
  }

  final _$getMyFriendsAsyncAction =
      AsyncAction('_SelectFriendSharePostStore.getMyFriends');

  @override
  Future getMyFriends() {
    return _$getMyFriendsAsyncAction.run(() => super.getMyFriends());
  }

  final _$getMyFamilyAsyncAction =
      AsyncAction('_SelectFriendSharePostStore.getMyFamily');

  @override
  Future getMyFamily() {
    return _$getMyFamilyAsyncAction.run(() => super.getMyFamily());
  }

  final _$_SelectFriendSharePostStoreActionController =
      ActionController(name: '_SelectFriendSharePostStore');

  @override
  dynamic setPost(Entry p) {
    final _$actionInfo = _$_SelectFriendSharePostStoreActionController
        .startAction(name: '_SelectFriendSharePostStore.setPost');
    try {
      return super.setPost(p);
    } finally {
      _$_SelectFriendSharePostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePeopleCategory(String value) {
    final _$actionInfo = _$_SelectFriendSharePostStoreActionController
        .startAction(name: '_SelectFriendSharePostStore.updatePeopleCategory');
    try {
      return super.updatePeopleCategory(value);
    } finally {
      _$_SelectFriendSharePostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
peopleCategory: ${peopleCategory},
friends: ${friends},
family: ${family},
selectedTab: ${selectedTab}
    ''';
  }
}
