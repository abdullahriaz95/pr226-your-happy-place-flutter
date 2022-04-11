// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$keepPrivateAtom = Atom(name: '_SettingsStore.keepPrivate');

  @override
  bool get keepPrivate {
    _$keepPrivateAtom.reportRead();
    return super.keepPrivate;
  }

  @override
  set keepPrivate(bool value) {
    _$keepPrivateAtom.reportWrite(value, super.keepPrivate, () {
      super.keepPrivate = value;
    });
  }

  final _$makePublicAtom = Atom(name: '_SettingsStore.makePublic');

  @override
  bool get makePublic {
    _$makePublicAtom.reportRead();
    return super.makePublic;
  }

  @override
  set makePublic(bool value) {
    _$makePublicAtom.reportWrite(value, super.makePublic, () {
      super.makePublic = value;
    });
  }

  final _$familyAtom = Atom(name: '_SettingsStore.family');

  @override
  bool get family {
    _$familyAtom.reportRead();
    return super.family;
  }

  @override
  set family(bool value) {
    _$familyAtom.reportWrite(value, super.family, () {
      super.family = value;
    });
  }

  final _$friendsAtom = Atom(name: '_SettingsStore.friends');

  @override
  bool get friends {
    _$friendsAtom.reportRead();
    return super.friends;
  }

  @override
  set friends(bool value) {
    _$friendsAtom.reportWrite(value, super.friends, () {
      super.friends = value;
    });
  }

  final _$visibleUserNameAtom = Atom(name: '_SettingsStore.visibleUserName');

  @override
  bool get visibleUserName {
    _$visibleUserNameAtom.reportRead();
    return super.visibleUserName;
  }

  @override
  set visibleUserName(bool value) {
    _$visibleUserNameAtom.reportWrite(value, super.visibleUserName, () {
      super.visibleUserName = value;
    });
  }

  final _$savingSettingsAtom = Atom(name: '_SettingsStore.savingSettings');

  @override
  bool get savingSettings {
    _$savingSettingsAtom.reportRead();
    return super.savingSettings;
  }

  @override
  set savingSettings(bool value) {
    _$savingSettingsAtom.reportWrite(value, super.savingSettings, () {
      super.savingSettings = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SettingsStore.isLoading');

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

  final _$getSettingsAsyncAction = AsyncAction('_SettingsStore.getSettings');

  @override
  Future getSettings() {
    return _$getSettingsAsyncAction.run(() => super.getSettings());
  }

  final _$updateSettingsAsyncAction =
      AsyncAction('_SettingsStore.updateSettings');

  @override
  Future updateSettings() {
    return _$updateSettingsAsyncAction.run(() => super.updateSettings());
  }

  @override
  String toString() {
    return '''
keepPrivate: ${keepPrivate},
makePublic: ${makePublic},
family: ${family},
friends: ${friends},
visibleUserName: ${visibleUserName},
savingSettings: ${savingSettings},
isLoading: ${isLoading}
    ''';
  }
}
