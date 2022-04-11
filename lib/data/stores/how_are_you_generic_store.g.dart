// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'how_are_you_generic_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HowAreYouGenericStore on _HowAreYouGenericStore, Store {
  final _$isLoadingAtom = Atom(name: '_HowAreYouGenericStore.isLoading');

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

  final _$moodTypesAtom = Atom(name: '_HowAreYouGenericStore.moodTypes');

  @override
  List<MoodType> get moodTypes {
    _$moodTypesAtom.reportRead();
    return super.moodTypes;
  }

  @override
  set moodTypes(List<MoodType> value) {
    _$moodTypesAtom.reportWrite(value, super.moodTypes, () {
      super.moodTypes = value;
    });
  }

  final _$placesTypesAtom = Atom(name: '_HowAreYouGenericStore.placesTypes');

  @override
  List<PlaceType> get placesTypes {
    _$placesTypesAtom.reportRead();
    return super.placesTypes;
  }

  @override
  set placesTypes(List<PlaceType> value) {
    _$placesTypesAtom.reportWrite(value, super.placesTypes, () {
      super.placesTypes = value;
    });
  }

  final _$activityTypesAtom =
      Atom(name: '_HowAreYouGenericStore.activityTypes');

  @override
  List<ActivityType> get activityTypes {
    _$activityTypesAtom.reportRead();
    return super.activityTypes;
  }

  @override
  set activityTypes(List<ActivityType> value) {
    _$activityTypesAtom.reportWrite(value, super.activityTypes, () {
      super.activityTypes = value;
    });
  }

  final _$feelingTypesAtom = Atom(name: '_HowAreYouGenericStore.feelingTypes');

  @override
  List<FeelingType> get feelingTypes {
    _$feelingTypesAtom.reportRead();
    return super.feelingTypes;
  }

  @override
  set feelingTypes(List<FeelingType> value) {
    _$feelingTypesAtom.reportWrite(value, super.feelingTypes, () {
      super.feelingTypes = value;
    });
  }

  final _$getMoodDetailsAsyncAction =
      AsyncAction('_HowAreYouGenericStore.getMoodDetails');

  @override
  Future getMoodDetails(int id) {
    return _$getMoodDetailsAsyncAction.run(() => super.getMoodDetails(id));
  }

  final _$getPlaceDetailsAsyncAction =
      AsyncAction('_HowAreYouGenericStore.getPlaceDetails');

  @override
  Future getPlaceDetails(int id) {
    return _$getPlaceDetailsAsyncAction.run(() => super.getPlaceDetails(id));
  }

  final _$getActivityDetailsAsyncAction =
      AsyncAction('_HowAreYouGenericStore.getActivityDetails');

  @override
  Future getActivityDetails(int id) {
    return _$getActivityDetailsAsyncAction
        .run(() => super.getActivityDetails(id));
  }

  final _$getFeelingDetailsAsyncAction =
      AsyncAction('_HowAreYouGenericStore.getFeelingDetails');

  @override
  Future getFeelingDetails(int id) {
    return _$getFeelingDetailsAsyncAction
        .run(() => super.getFeelingDetails(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
moodTypes: ${moodTypes},
placesTypes: ${placesTypes},
activityTypes: ${activityTypes},
feelingTypes: ${feelingTypes}
    ''';
  }
}
