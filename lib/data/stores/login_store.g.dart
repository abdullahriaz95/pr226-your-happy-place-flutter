// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$isLoadingAtom = Atom(name: '_LoginStore.isLoading');

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

  final _$errorAtom = Atom(name: '_LoginStore.error');

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

  final _$loginCompleteAtom = Atom(name: '_LoginStore.loginComplete');

  @override
  bool get loginComplete {
    _$loginCompleteAtom.reportRead();
    return super.loginComplete;
  }

  @override
  set loginComplete(bool value) {
    _$loginCompleteAtom.reportWrite(value, super.loginComplete, () {
      super.loginComplete = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_LoginStore.signIn');

  @override
  Future signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  dynamic updateUserProvider(User user) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.updateUserProvider');
    try {
      return super.updateUserProvider(user);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
loginComplete: ${loginComplete}
    ''';
  }
}
