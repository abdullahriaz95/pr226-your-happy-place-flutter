// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationStore on _NavigationStore, Store {
  final _$selectedPageAtom = Atom(name: '_NavigationStore.selectedPage');

  @override
  int get selectedPage {
    _$selectedPageAtom.reportRead();
    return super.selectedPage;
  }

  @override
  set selectedPage(int value) {
    _$selectedPageAtom.reportWrite(value, super.selectedPage, () {
      super.selectedPage = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NavigationStore.isLoading');

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

  final _$dontShowAgainAtom = Atom(name: '_NavigationStore.dontShowAgain');

  @override
  bool get dontShowAgain {
    _$dontShowAgainAtom.reportRead();
    return super.dontShowAgain;
  }

  @override
  set dontShowAgain(bool value) {
    _$dontShowAgainAtom.reportWrite(value, super.dontShowAgain, () {
      super.dontShowAgain = value;
    });
  }

  final _$updateDontShowAgainAsyncAction =
      AsyncAction('_NavigationStore.updateDontShowAgain');

  @override
  Future updateDontShowAgain() {
    return _$updateDontShowAgainAsyncAction
        .run(() => super.updateDontShowAgain());
  }

  final _$getProfileAsyncAction = AsyncAction('_NavigationStore.getProfile');

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore');

  @override
  dynamic selectPage(int page) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.selectPage');
    try {
      return super.selectPage(page);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.reset');
    try {
      return super.reset();
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedPage: ${selectedPage},
isLoading: ${isLoading},
dontShowAgain: ${dontShowAgain}
    ''';
  }
}
