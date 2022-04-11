// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordStore on _ForgotPasswordStore, Store {
  final _$isLoadingAtom = Atom(name: '_ForgotPasswordStore.isLoading');

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

  final _$errorAtom = Atom(name: '_ForgotPasswordStore.error');

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

  final _$linkSentAtom = Atom(name: '_ForgotPasswordStore.linkSent');

  @override
  int get linkSent {
    _$linkSentAtom.reportRead();
    return super.linkSent;
  }

  @override
  set linkSent(int value) {
    _$linkSentAtom.reportWrite(value, super.linkSent, () {
      super.linkSent = value;
    });
  }

  final _$forgotPasswordAsyncAction =
      AsyncAction('_ForgotPasswordStore.forgotPassword');

  @override
  Future forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
linkSent: ${linkSent}
    ''';
  }
}
