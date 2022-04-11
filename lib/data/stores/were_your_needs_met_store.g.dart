// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'were_your_needs_met_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WereYourNeedsMetStore on _WereYourNeedsMetStore, Store {
  final _$isLoadingAtom = Atom(name: '_WereYourNeedsMetStore.isLoading');

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

  final _$filtersAtom = Atom(name: '_WereYourNeedsMetStore.filters');

  @override
  List<FeelingRating> get filters {
    _$filtersAtom.reportRead();
    return super.filters;
  }

  @override
  set filters(List<FeelingRating> value) {
    _$filtersAtom.reportWrite(value, super.filters, () {
      super.filters = value;
    });
  }

  final _$indexSelectedAtom =
      Atom(name: '_WereYourNeedsMetStore.indexSelected');

  @override
  int get indexSelected {
    _$indexSelectedAtom.reportRead();
    return super.indexSelected;
  }

  @override
  set indexSelected(int value) {
    _$indexSelectedAtom.reportWrite(value, super.indexSelected, () {
      super.indexSelected = value;
    });
  }

  final _$getFiltersAsyncAction =
      AsyncAction('_WereYourNeedsMetStore.getFilters');

  @override
  Future getFilters() {
    return _$getFiltersAsyncAction.run(() => super.getFilters());
  }

  final _$_WereYourNeedsMetStoreActionController =
      ActionController(name: '_WereYourNeedsMetStore');

  @override
  dynamic updateSelected(int index) {
    final _$actionInfo = _$_WereYourNeedsMetStoreActionController.startAction(
        name: '_WereYourNeedsMetStore.updateSelected');
    try {
      return super.updateSelected(index);
    } finally {
      _$_WereYourNeedsMetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
filters: ${filters},
indexSelected: ${indexSelected}
    ''';
  }
}
