// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExploreStore on _ExploreStore, Store {
  final _$isLoadingAtom = Atom(name: '_ExploreStore.isLoading');

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

  final _$currentTabAtom = Atom(name: '_ExploreStore.currentTab');

  @override
  int get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(int value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  final _$focusMyCurrentPositionAtom =
      Atom(name: '_ExploreStore.focusMyCurrentPosition');

  @override
  int get focusMyCurrentPosition {
    _$focusMyCurrentPositionAtom.reportRead();
    return super.focusMyCurrentPosition;
  }

  @override
  set focusMyCurrentPosition(int value) {
    _$focusMyCurrentPositionAtom
        .reportWrite(value, super.focusMyCurrentPosition, () {
      super.focusMyCurrentPosition = value;
    });
  }

  final _$markersUpdatedAtom = Atom(name: '_ExploreStore.markersUpdated');

  @override
  int get markersUpdated {
    _$markersUpdatedAtom.reportRead();
    return super.markersUpdated;
  }

  @override
  set markersUpdated(int value) {
    _$markersUpdatedAtom.reportWrite(value, super.markersUpdated, () {
      super.markersUpdated = value;
    });
  }

  final _$placesAtom = Atom(name: '_ExploreStore.places');

  @override
  List<Entry> get places {
    _$placesAtom.reportRead();
    return super.places;
  }

  @override
  set places(List<Entry> value) {
    _$placesAtom.reportWrite(value, super.places, () {
      super.places = value;
    });
  }

  final _$markersAtom = Atom(name: '_ExploreStore.markers');

  @override
  List<ExploreMapMarker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(List<ExploreMapMarker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$customMarkersAtom = Atom(name: '_ExploreStore.customMarkers');

  @override
  Set<Marker> get customMarkers {
    _$customMarkersAtom.reportRead();
    return super.customMarkers;
  }

  @override
  set customMarkers(Set<Marker> value) {
    _$customMarkersAtom.reportWrite(value, super.customMarkers, () {
      super.customMarkers = value;
    });
  }

  final _$loadingFilterOptionsAtom =
      Atom(name: '_ExploreStore.loadingFilterOptions');

  @override
  bool get loadingFilterOptions {
    _$loadingFilterOptionsAtom.reportRead();
    return super.loadingFilterOptions;
  }

  @override
  set loadingFilterOptions(bool value) {
    _$loadingFilterOptionsAtom.reportWrite(value, super.loadingFilterOptions,
        () {
      super.loadingFilterOptions = value;
    });
  }

  final _$searchAllAtom = Atom(name: '_ExploreStore.searchAll');

  @override
  bool get searchAll {
    _$searchAllAtom.reportRead();
    return super.searchAll;
  }

  @override
  set searchAll(bool value) {
    _$searchAllAtom.reportWrite(value, super.searchAll, () {
      super.searchAll = value;
    });
  }

  final _$searchMyEntriesAtom = Atom(name: '_ExploreStore.searchMyEntries');

  @override
  bool get searchMyEntries {
    _$searchMyEntriesAtom.reportRead();
    return super.searchMyEntries;
  }

  @override
  set searchMyEntries(bool value) {
    _$searchMyEntriesAtom.reportWrite(value, super.searchMyEntries, () {
      super.searchMyEntries = value;
    });
  }

  final _$searchFamilyAndFriendsAtom =
      Atom(name: '_ExploreStore.searchFamilyAndFriends');

  @override
  bool get searchFamilyAndFriends {
    _$searchFamilyAndFriendsAtom.reportRead();
    return super.searchFamilyAndFriends;
  }

  @override
  set searchFamilyAndFriends(bool value) {
    _$searchFamilyAndFriendsAtom
        .reportWrite(value, super.searchFamilyAndFriends, () {
      super.searchFamilyAndFriends = value;
    });
  }

  final _$activitySelectableAtom =
      Atom(name: '_ExploreStore.activitySelectable');

  @override
  ObservableList<ActivitySelectable> get activitySelectable {
    _$activitySelectableAtom.reportRead();
    return super.activitySelectable;
  }

  @override
  set activitySelectable(ObservableList<ActivitySelectable> value) {
    _$activitySelectableAtom.reportWrite(value, super.activitySelectable, () {
      super.activitySelectable = value;
    });
  }

  final _$placesSelectableAtom = Atom(name: '_ExploreStore.placesSelectable');

  @override
  ObservableList<PlaceSelectable> get placesSelectable {
    _$placesSelectableAtom.reportRead();
    return super.placesSelectable;
  }

  @override
  set placesSelectable(ObservableList<PlaceSelectable> value) {
    _$placesSelectableAtom.reportWrite(value, super.placesSelectable, () {
      super.placesSelectable = value;
    });
  }

  final _$moodsSelectableAtom = Atom(name: '_ExploreStore.moodsSelectable');

  @override
  ObservableList<MoodSelectable> get moodsSelectable {
    _$moodsSelectableAtom.reportRead();
    return super.moodsSelectable;
  }

  @override
  set moodsSelectable(ObservableList<MoodSelectable> value) {
    _$moodsSelectableAtom.reportWrite(value, super.moodsSelectable, () {
      super.moodsSelectable = value;
    });
  }

  final _$getPostsAsyncAction = AsyncAction('_ExploreStore.getPosts');

  @override
  Future getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  final _$getLocationPermissionAsyncAction =
      AsyncAction('_ExploreStore.getLocationPermission');

  @override
  Future getLocationPermission() {
    return _$getLocationPermissionAsyncAction
        .run(() => super.getLocationPermission());
  }

  final _$loadFiltersAsyncAction = AsyncAction('_ExploreStore.loadFilters');

  @override
  Future loadFilters() {
    return _$loadFiltersAsyncAction.run(() => super.loadFilters());
  }

  final _$getMoodsAsyncAction = AsyncAction('_ExploreStore.getMoods');

  @override
  Future getMoods() {
    return _$getMoodsAsyncAction.run(() => super.getMoods());
  }

  final _$getPlacesAsyncAction = AsyncAction('_ExploreStore.getPlaces');

  @override
  Future getPlaces() {
    return _$getPlacesAsyncAction.run(() => super.getPlaces());
  }

  final _$getActivitiesAsyncAction = AsyncAction('_ExploreStore.getActivities');

  @override
  Future getActivities() {
    return _$getActivitiesAsyncAction.run(() => super.getActivities());
  }

  final _$_ExploreStoreActionController =
      ActionController(name: '_ExploreStore');

  @override
  dynamic refreshList() {
    final _$actionInfo = _$_ExploreStoreActionController.startAction(
        name: '_ExploreStore.refreshList');
    try {
      return super.refreshList();
    } finally {
      _$_ExploreStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentTab: ${currentTab},
focusMyCurrentPosition: ${focusMyCurrentPosition},
markersUpdated: ${markersUpdated},
places: ${places},
markers: ${markers},
customMarkers: ${customMarkers},
loadingFilterOptions: ${loadingFilterOptions},
searchAll: ${searchAll},
searchMyEntries: ${searchMyEntries},
searchFamilyAndFriends: ${searchFamilyAndFriends},
activitySelectable: ${activitySelectable},
placesSelectable: ${placesSelectable},
moodsSelectable: ${moodsSelectable}
    ''';
  }
}
