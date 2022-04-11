// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_people_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddPeopleStore on _AddPeopleStore, Store {
  final _$isLoadingAtom = Atom(name: '_AddPeopleStore.isLoading');

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

  final _$errorAtom = Atom(name: '_AddPeopleStore.error');

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

  final _$usersAtom = Atom(name: '_AddPeopleStore.users');

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

  final _$searchingPeopleAtom = Atom(name: '_AddPeopleStore.searchingPeople');

  @override
  bool get searchingPeople {
    _$searchingPeopleAtom.reportRead();
    return super.searchingPeople;
  }

  @override
  set searchingPeople(bool value) {
    _$searchingPeopleAtom.reportWrite(value, super.searchingPeople, () {
      super.searchingPeople = value;
    });
  }

  final _$searchPeopleAsyncAction = AsyncAction('_AddPeopleStore.searchPeople');

  @override
  Future searchPeople(String query) {
    return _$searchPeopleAsyncAction.run(() => super.searchPeople(query));
  }

  final _$sendFriendOrFamilyRequestAsyncAction =
      AsyncAction('_AddPeopleStore.sendFriendOrFamilyRequest');

  @override
  Future sendFriendOrFamilyRequest(
      {bool addAsFriend = true, required int userId}) {
    return _$sendFriendOrFamilyRequestAsyncAction.run(() => super
        .sendFriendOrFamilyRequest(addAsFriend: addAsFriend, userId: userId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
users: ${users},
searchingPeople: ${searchingPeople}
    ''';
  }
}
