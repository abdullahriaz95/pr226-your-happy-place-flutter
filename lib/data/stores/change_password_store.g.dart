// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangePasswordStore on _ChangePasswordStore, Store {
  final _$isLoadingAtom = Atom(name: '_ChangePasswordStore.isLoading');

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

  final _$passwordChangedAtom =
      Atom(name: '_ChangePasswordStore.passwordChanged');

  @override
  int get passwordChanged {
    _$passwordChangedAtom.reportRead();
    return super.passwordChanged;
  }

  @override
  set passwordChanged(int value) {
    _$passwordChangedAtom.reportWrite(value, super.passwordChanged, () {
      super.passwordChanged = value;
    });
  }

  final _$changePasswordAsyncAction =
      AsyncAction('_ChangePasswordStore.changePassword');

  @override
  Future changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
passwordChanged: ${passwordChanged}
    ''';
  }
}
