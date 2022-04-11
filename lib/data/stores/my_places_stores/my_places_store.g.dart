// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_places_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyPlacesStore on _MyPlacesStore, Store {
  final _$isLoadingAtom = Atom(name: '_MyPlacesStore.isLoading');

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

  final _$currentTabAtom = Atom(name: '_MyPlacesStore.currentTab');

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
      Atom(name: '_MyPlacesStore.focusMyCurrentPosition');

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

  final _$markersUpdatedAtom = Atom(name: '_MyPlacesStore.markersUpdated');

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

  final _$myPostsAtom = Atom(name: '_MyPlacesStore.myPosts');

  @override
  List<Entry> get myPosts {
    _$myPostsAtom.reportRead();
    return super.myPosts;
  }

  @override
  set myPosts(List<Entry> value) {
    _$myPostsAtom.reportWrite(value, super.myPosts, () {
      super.myPosts = value;
    });
  }

  final _$markersAtom = Atom(name: '_MyPlacesStore.markers');

  @override
  List<MapMarker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(List<MapMarker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$customMarkersAtom = Atom(name: '_MyPlacesStore.customMarkers');

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

  final _$getPostsAsyncAction = AsyncAction('_MyPlacesStore.getPosts');

  @override
  Future getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  final _$getLocationPermissionAsyncAction =
      AsyncAction('_MyPlacesStore.getLocationPermission');

  @override
  Future getLocationPermission() {
    return _$getLocationPermissionAsyncAction
        .run(() => super.getLocationPermission());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentTab: ${currentTab},
focusMyCurrentPosition: ${focusMyCurrentPosition},
markersUpdated: ${markersUpdated},
myPosts: ${myPosts},
markers: ${markers},
customMarkers: ${customMarkers}
    ''';
  }
}
