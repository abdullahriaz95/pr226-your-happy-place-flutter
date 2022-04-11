// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SharePostStore on _SharePostStore, Store {
  final _$friendOrFamilyAtom = Atom(name: '_SharePostStore.friendOrFamily');

  @override
  User? get friendOrFamily {
    _$friendOrFamilyAtom.reportRead();
    return super.friendOrFamily;
  }

  @override
  set friendOrFamily(User? value) {
    _$friendOrFamilyAtom.reportWrite(value, super.friendOrFamily, () {
      super.friendOrFamily = value;
    });
  }

  final _$selectedTabAtom = Atom(name: '_SharePostStore.selectedTab');

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

  final _$postSharedAtom = Atom(name: '_SharePostStore.postShared');

  @override
  bool get postShared {
    _$postSharedAtom.reportRead();
    return super.postShared;
  }

  @override
  set postShared(bool value) {
    _$postSharedAtom.reportWrite(value, super.postShared, () {
      super.postShared = value;
    });
  }

  final _$sharingPostAtom = Atom(name: '_SharePostStore.sharingPost');

  @override
  bool get sharingPost {
    _$sharingPostAtom.reportRead();
    return super.sharingPost;
  }

  @override
  set sharingPost(bool value) {
    _$sharingPostAtom.reportWrite(value, super.sharingPost, () {
      super.sharingPost = value;
    });
  }

  final _$toggleTabBarAsyncAction = AsyncAction('_SharePostStore.toggleTabBar');

  @override
  Future toggleTabBar(int tab) {
    return _$toggleTabBarAsyncAction.run(() => super.toggleTabBar(tab));
  }

  final _$sharePostAsyncAction = AsyncAction('_SharePostStore.sharePost');

  @override
  Future sharePost() {
    return _$sharePostAsyncAction.run(() => super.sharePost());
  }

  final _$_SharePostStoreActionController =
      ActionController(name: '_SharePostStore');

  @override
  dynamic setPost(Entry p) {
    final _$actionInfo = _$_SharePostStoreActionController.startAction(
        name: '_SharePostStore.setPost');
    try {
      return super.setPost(p);
    } finally {
      _$_SharePostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFriendOrFamilyUser(User u) {
    final _$actionInfo = _$_SharePostStoreActionController.startAction(
        name: '_SharePostStore.setFriendOrFamilyUser');
    try {
      return super.setFriendOrFamilyUser(u);
    } finally {
      _$_SharePostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
friendOrFamily: ${friendOrFamily},
selectedTab: ${selectedTab},
postShared: ${postShared},
sharingPost: ${sharingPost}
    ''';
  }
}
