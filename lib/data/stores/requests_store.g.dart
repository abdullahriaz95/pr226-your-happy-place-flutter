// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequestsStore on _RequestsStore, Store {
  final _$isLoadingAtom = Atom(name: '_RequestsStore.isLoading');

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

  final _$usersAtom = Atom(name: '_RequestsStore.users');

  @override
  List<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$getRequestsAsyncAction = AsyncAction('_RequestsStore.getRequests');

  @override
  Future getRequests() {
    return _$getRequestsAsyncAction.run(() => super.getRequests());
  }

  final _$acceptRequestAsyncAction =
      AsyncAction('_RequestsStore.acceptRequest');

  @override
  Future acceptRequest(int userId) {
    return _$acceptRequestAsyncAction.run(() => super.acceptRequest(userId));
  }

  final _$rejectRequestAsyncAction =
      AsyncAction('_RequestsStore.rejectRequest');

  @override
  Future rejectRequest(int userId) {
    return _$rejectRequestAsyncAction.run(() => super.rejectRequest(userId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
users: ${users}
    ''';
  }
}
