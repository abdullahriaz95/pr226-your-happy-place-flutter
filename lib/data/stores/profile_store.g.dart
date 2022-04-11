// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  final _$isProfileUpdatedAtom = Atom(name: '_ProfileStore.isProfileUpdated');

  @override
  bool get isProfileUpdated {
    _$isProfileUpdatedAtom.reportRead();
    return super.isProfileUpdated;
  }

  @override
  set isProfileUpdated(bool value) {
    _$isProfileUpdatedAtom.reportWrite(value, super.isProfileUpdated, () {
      super.isProfileUpdated = value;
    });
  }

  final _$deletionModeAtom = Atom(name: '_ProfileStore.deletionMode');

  @override
  bool get deletionMode {
    _$deletionModeAtom.reportRead();
    return super.deletionMode;
  }

  @override
  set deletionMode(bool value) {
    _$deletionModeAtom.reportWrite(value, super.deletionMode, () {
      super.deletionMode = value;
    });
  }

  final _$checkAllAtom = Atom(name: '_ProfileStore.checkAll');

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

  final _$isLoadingAtom = Atom(name: '_ProfileStore.isLoading');

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

  final _$errorAtom = Atom(name: '_ProfileStore.error');

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

  final _$peopleCategoryAtom = Atom(name: '_ProfileStore.peopleCategory');

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

  final _$userAtom = Atom(name: '_ProfileStore.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$friendsAtom = Atom(name: '_ProfileStore.friends');

  @override
  List<UserWithWrapper> get friends {
    _$friendsAtom.reportRead();
    return super.friends;
  }

  @override
  set friends(List<UserWithWrapper> value) {
    _$friendsAtom.reportWrite(value, super.friends, () {
      super.friends = value;
    });
  }

  final _$familyAtom = Atom(name: '_ProfileStore.family');

  @override
  List<UserWithWrapper> get family {
    _$familyAtom.reportRead();
    return super.family;
  }

  @override
  set family(List<UserWithWrapper> value) {
    _$familyAtom.reportWrite(value, super.family, () {
      super.family = value;
    });
  }

  final _$listFriendRequestsAtom =
      Atom(name: '_ProfileStore.listFriendRequests');

  @override
  List<User> get listFriendRequests {
    _$listFriendRequestsAtom.reportRead();
    return super.listFriendRequests;
  }

  @override
  set listFriendRequests(List<User> value) {
    _$listFriendRequestsAtom.reportWrite(value, super.listFriendRequests, () {
      super.listFriendRequests = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_ProfileStore.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$initProfileOnlyAsyncAction =
      AsyncAction('_ProfileStore.initProfileOnly');

  @override
  Future initProfileOnly() {
    return _$initProfileOnlyAsyncAction.run(() => super.initProfileOnly());
  }

  final _$getFriendsAndFamilyRequestsAsyncAction =
      AsyncAction('_ProfileStore.getFriendsAndFamilyRequests');

  @override
  Future getFriendsAndFamilyRequests() {
    return _$getFriendsAndFamilyRequestsAsyncAction
        .run(() => super.getFriendsAndFamilyRequests());
  }

  final _$getProfileAsyncAction = AsyncAction('_ProfileStore.getProfile');

  @override
  Future getProfile({bool calledFromDashboard = false}) {
    return _$getProfileAsyncAction
        .run(() => super.getProfile(calledFromDashboard: calledFromDashboard));
  }

  final _$getMyFriendsAsyncAction = AsyncAction('_ProfileStore.getMyFriends');

  @override
  Future getMyFriends() {
    return _$getMyFriendsAsyncAction.run(() => super.getMyFriends());
  }

  final _$getMyFamilyAsyncAction = AsyncAction('_ProfileStore.getMyFamily');

  @override
  Future getMyFamily() {
    return _$getMyFamilyAsyncAction.run(() => super.getMyFamily());
  }

  final _$deleteFriendsAndFamilyAsyncAction =
      AsyncAction('_ProfileStore.deleteFriendsAndFamily');

  @override
  Future deleteFriendsAndFamily() {
    return _$deleteFriendsAndFamilyAsyncAction
        .run(() => super.deleteFriendsAndFamily());
  }

  final _$pickCoverImageAsyncAction =
      AsyncAction('_ProfileStore.pickCoverImage');

  @override
  Future pickCoverImage() {
    return _$pickCoverImageAsyncAction.run(() => super.pickCoverImage());
  }

  final _$updatePictureAsyncAction = AsyncAction('_ProfileStore.updatePicture');

  @override
  Future<void> updatePicture() {
    return _$updatePictureAsyncAction.run(() => super.updatePicture());
  }

  final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore');

  @override
  dynamic checkAllItems(bool val) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.checkAllItems');
    try {
      return super.checkAllItems(val);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePeopleCategory(String value) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.updatePeopleCategory');
    try {
      return super.updatePeopleCategory(value);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.reset');
    try {
      return super.reset();
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isProfileUpdated: ${isProfileUpdated},
deletionMode: ${deletionMode},
checkAll: ${checkAll},
isLoading: ${isLoading},
error: ${error},
peopleCategory: ${peopleCategory},
user: ${user},
friends: ${friends},
family: ${family},
listFriendRequests: ${listFriendRequests}
    ''';
  }
}
