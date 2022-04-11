// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlacesHistoryStore on _PlacesHistoryStore, Store {
  final _$isLoadingAtom = Atom(name: '_PlacesHistoryStore.isLoading');

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

  final _$errorAtom = Atom(name: '_PlacesHistoryStore.error');

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

  final _$myPlacesAtom = Atom(name: '_PlacesHistoryStore.myPlaces');

  @override
  List<VisitedPlace> get myPlaces {
    _$myPlacesAtom.reportRead();
    return super.myPlaces;
  }

  @override
  set myPlaces(List<VisitedPlace> value) {
    _$myPlacesAtom.reportWrite(value, super.myPlaces, () {
      super.myPlaces = value;
    });
  }

  final _$getPlacesHistoryAsyncAction =
      AsyncAction('_PlacesHistoryStore.getPlacesHistory');

  @override
  Future getPlacesHistory() {
    return _$getPlacesHistoryAsyncAction.run(() => super.getPlacesHistory());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
myPlaces: ${myPlaces}
    ''';
  }
}
