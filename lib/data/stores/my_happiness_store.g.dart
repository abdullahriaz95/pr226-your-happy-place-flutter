// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_happiness_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyHappinessStore on _MyHappinessStore, Store {
  final _$isLoadingOptionsAtom =
      Atom(name: '_MyHappinessStore.isLoadingOptions');

  @override
  bool get isLoadingOptions {
    _$isLoadingOptionsAtom.reportRead();
    return super.isLoadingOptions;
  }

  @override
  set isLoadingOptions(bool value) {
    _$isLoadingOptionsAtom.reportWrite(value, super.isLoadingOptions, () {
      super.isLoadingOptions = value;
    });
  }

  final _$errorAtom = Atom(name: '_MyHappinessStore.error');

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

  final _$happinessOptionsAtom =
      Atom(name: '_MyHappinessStore.happinessOptions');

  @override
  List<HappynessOption> get happinessOptions {
    _$happinessOptionsAtom.reportRead();
    return super.happinessOptions;
  }

  @override
  set happinessOptions(List<HappynessOption> value) {
    _$happinessOptionsAtom.reportWrite(value, super.happinessOptions, () {
      super.happinessOptions = value;
    });
  }

  final _$testsLoadingAtom = Atom(name: '_MyHappinessStore.testsLoading');

  @override
  List<bool> get testsLoading {
    _$testsLoadingAtom.reportRead();
    return super.testsLoading;
  }

  @override
  set testsLoading(List<bool> value) {
    _$testsLoadingAtom.reportWrite(value, super.testsLoading, () {
      super.testsLoading = value;
    });
  }

  final _$listTestsAtom = Atom(name: '_MyHappinessStore.listTests');

  @override
  List<List<HappynessTest>> get listTests {
    _$listTestsAtom.reportRead();
    return super.listTests;
  }

  @override
  set listTests(List<List<HappynessTest>> value) {
    _$listTestsAtom.reportWrite(value, super.listTests, () {
      super.listTests = value;
    });
  }

  final _$getHappinessOptionsAsyncAction =
      AsyncAction('_MyHappinessStore.getHappinessOptions');

  @override
  Future getHappinessOptions() {
    return _$getHappinessOptionsAsyncAction
        .run(() => super.getHappinessOptions());
  }

  final _$getTestsAsyncAction = AsyncAction('_MyHappinessStore.getTests');

  @override
  Future getTests(String id, int index) {
    return _$getTestsAsyncAction.run(() => super.getTests(id, index));
  }

  @override
  String toString() {
    return '''
isLoadingOptions: ${isLoadingOptions},
error: ${error},
happinessOptions: ${happinessOptions},
testsLoading: ${testsLoading},
listTests: ${listTests}
    ''';
  }
}
