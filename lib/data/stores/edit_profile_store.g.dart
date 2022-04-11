// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfileStore on _EditProfileStore, Store {
  final _$profileImagePathAtom =
      Atom(name: '_EditProfileStore.profileImagePath');

  @override
  String? get profileImagePath {
    _$profileImagePathAtom.reportRead();
    return super.profileImagePath;
  }

  @override
  set profileImagePath(String? value) {
    _$profileImagePathAtom.reportWrite(value, super.profileImagePath, () {
      super.profileImagePath = value;
    });
  }

  final _$genderAtom = Atom(name: '_EditProfileStore.gender');

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$loadingPlacesAtom = Atom(name: '_EditProfileStore.loadingPlaces');

  @override
  bool get loadingPlaces {
    _$loadingPlacesAtom.reportRead();
    return super.loadingPlaces;
  }

  @override
  set loadingPlaces(bool value) {
    _$loadingPlacesAtom.reportWrite(value, super.loadingPlaces, () {
      super.loadingPlaces = value;
    });
  }

  final _$showPlacesLayoutAtom =
      Atom(name: '_EditProfileStore.showPlacesLayout');

  @override
  bool get showPlacesLayout {
    _$showPlacesLayoutAtom.reportRead();
    return super.showPlacesLayout;
  }

  @override
  set showPlacesLayout(bool value) {
    _$showPlacesLayoutAtom.reportWrite(value, super.showPlacesLayout, () {
      super.showPlacesLayout = value;
    });
  }

  final _$placesAutoCompleteListAtom =
      Atom(name: '_EditProfileStore.placesAutoCompleteList');

  @override
  List<HappyPlace> get placesAutoCompleteList {
    _$placesAutoCompleteListAtom.reportRead();
    return super.placesAutoCompleteList;
  }

  @override
  set placesAutoCompleteList(List<HappyPlace> value) {
    _$placesAutoCompleteListAtom
        .reportWrite(value, super.placesAutoCompleteList, () {
      super.placesAutoCompleteList = value;
    });
  }

  final _$finalPlaceSelectedAtom =
      Atom(name: '_EditProfileStore.finalPlaceSelected');

  @override
  HappyPlace? get finalPlaceSelected {
    _$finalPlaceSelectedAtom.reportRead();
    return super.finalPlaceSelected;
  }

  @override
  set finalPlaceSelected(HappyPlace? value) {
    _$finalPlaceSelectedAtom.reportWrite(value, super.finalPlaceSelected, () {
      super.finalPlaceSelected = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_EditProfileStore.isLoading');

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

  final _$errorAtom = Atom(name: '_EditProfileStore.error');

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

  final _$userAtom = Atom(name: '_EditProfileStore.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$ageGroupsAtom = Atom(name: '_EditProfileStore.ageGroups');

  @override
  List<AgeGroup> get ageGroups {
    _$ageGroupsAtom.reportRead();
    return super.ageGroups;
  }

  @override
  set ageGroups(List<AgeGroup> value) {
    _$ageGroupsAtom.reportWrite(value, super.ageGroups, () {
      super.ageGroups = value;
    });
  }

  final _$ageGroupIdAtom = Atom(name: '_EditProfileStore.ageGroupId');

  @override
  String? get ageGroupId {
    _$ageGroupIdAtom.reportRead();
    return super.ageGroupId;
  }

  @override
  set ageGroupId(String? value) {
    _$ageGroupIdAtom.reportWrite(value, super.ageGroupId, () {
      super.ageGroupId = value;
    });
  }

  final _$selectedAgeGroupAtom =
      Atom(name: '_EditProfileStore.selectedAgeGroup');

  @override
  AgeGroup? get selectedAgeGroup {
    _$selectedAgeGroupAtom.reportRead();
    return super.selectedAgeGroup;
  }

  @override
  set selectedAgeGroup(AgeGroup? value) {
    _$selectedAgeGroupAtom.reportWrite(value, super.selectedAgeGroup, () {
      super.selectedAgeGroup = value;
    });
  }

  final _$profileUpdatedAtom = Atom(name: '_EditProfileStore.profileUpdated');

  @override
  bool get profileUpdated {
    _$profileUpdatedAtom.reportRead();
    return super.profileUpdated;
  }

  @override
  set profileUpdated(bool value) {
    _$profileUpdatedAtom.reportWrite(value, super.profileUpdated, () {
      super.profileUpdated = value;
    });
  }

  final _$pickProfileImageAsyncAction =
      AsyncAction('_EditProfileStore.pickProfileImage');

  @override
  Future pickProfileImage() {
    return _$pickProfileImageAsyncAction.run(() => super.pickProfileImage());
  }

  final _$getAgeGroupsAsyncAction =
      AsyncAction('_EditProfileStore.getAgeGroups');

  @override
  Future getAgeGroups() {
    return _$getAgeGroupsAsyncAction.run(() => super.getAgeGroups());
  }

  final _$searchAddressWithAutoCompleteAsyncAction =
      AsyncAction('_EditProfileStore.searchAddressWithAutoComplete');

  @override
  Future searchAddressWithAutoComplete(String value) {
    return _$searchAddressWithAutoCompleteAsyncAction
        .run(() => super.searchAddressWithAutoComplete(value));
  }

  final _$updateProfileAsyncAction =
      AsyncAction('_EditProfileStore.updateProfile');

  @override
  Future updateProfile() {
    return _$updateProfileAsyncAction.run(() => super.updateProfile());
  }

  final _$updatePictureAsyncAction =
      AsyncAction('_EditProfileStore.updatePicture');

  @override
  Future<void> updatePicture() {
    return _$updatePictureAsyncAction.run(() => super.updatePicture());
  }

  final _$_EditProfileStoreActionController =
      ActionController(name: '_EditProfileStore');

  @override
  dynamic updateCurrentUserInfo(User u) {
    final _$actionInfo = _$_EditProfileStoreActionController.startAction(
        name: '_EditProfileStore.updateCurrentUserInfo');
    try {
      return super.updateCurrentUserInfo(u);
    } finally {
      _$_EditProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profileImagePath: ${profileImagePath},
gender: ${gender},
loadingPlaces: ${loadingPlaces},
showPlacesLayout: ${showPlacesLayout},
placesAutoCompleteList: ${placesAutoCompleteList},
finalPlaceSelected: ${finalPlaceSelected},
isLoading: ${isLoading},
error: ${error},
user: ${user},
ageGroups: ${ageGroups},
ageGroupId: ${ageGroupId},
selectedAgeGroup: ${selectedAgeGroup},
profileUpdated: ${profileUpdated}
    ''';
  }
}
