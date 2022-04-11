// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStore, Store {
  final _$isLoadingAtom = Atom(name: '_SignupStore.isLoading');

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

  final _$signUpCompleteAtom = Atom(name: '_SignupStore.signUpComplete');

  @override
  bool get signUpComplete {
    _$signUpCompleteAtom.reportRead();
    return super.signUpComplete;
  }

  @override
  set signUpComplete(bool value) {
    _$signUpCompleteAtom.reportWrite(value, super.signUpComplete, () {
      super.signUpComplete = value;
    });
  }

  final _$signUpAsyncAction = AsyncAction('_SignupStore.signUp');

  @override
  Future signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_SignupStoreActionController = ActionController(name: '_SignupStore');

  @override
  dynamic updateUserProvider(User user) {
    final _$actionInfo = _$_SignupStoreActionController.startAction(
        name: '_SignupStore.updateUserProvider');
    try {
      return super.updateUserProvider(user);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
signUpComplete: ${signUpComplete}
    ''';
  }
}
