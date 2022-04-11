// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TestStore on _TestStore, Store {
  final _$pageViewPageAtom = Atom(name: '_TestStore.pageViewPage');

  @override
  int get pageViewPage {
    _$pageViewPageAtom.reportRead();
    return super.pageViewPage;
  }

  @override
  set pageViewPage(int value) {
    _$pageViewPageAtom.reportWrite(value, super.pageViewPage, () {
      super.pageViewPage = value;
    });
  }

  final _$loadingAtom = Atom(name: '_TestStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_TestStore.error');

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

  final _$listQuestionsAtom = Atom(name: '_TestStore.listQuestions');

  @override
  List<Question> get listQuestions {
    _$listQuestionsAtom.reportRead();
    return super.listQuestions;
  }

  @override
  set listQuestions(List<Question> value) {
    _$listQuestionsAtom.reportWrite(value, super.listQuestions, () {
      super.listQuestions = value;
    });
  }

  final _$pageModeAtom = Atom(name: '_TestStore.pageMode');

  @override
  int get pageMode {
    _$pageModeAtom.reportRead();
    return super.pageMode;
  }

  @override
  set pageMode(int value) {
    _$pageModeAtom.reportWrite(value, super.pageMode, () {
      super.pageMode = value;
    });
  }

  final _$testIdAtom = Atom(name: '_TestStore.testId');

  @override
  int get testId {
    _$testIdAtom.reportRead();
    return super.testId;
  }

  @override
  set testId(int value) {
    _$testIdAtom.reportWrite(value, super.testId, () {
      super.testId = value;
    });
  }

  final _$listBigFiveAnswersAtom = Atom(name: '_TestStore.listBigFiveAnswers');

  @override
  List<BigFiveAnswerRequest> get listBigFiveAnswers {
    _$listBigFiveAnswersAtom.reportRead();
    return super.listBigFiveAnswers;
  }

  @override
  set listBigFiveAnswers(List<BigFiveAnswerRequest> value) {
    _$listBigFiveAnswersAtom.reportWrite(value, super.listBigFiveAnswers, () {
      super.listBigFiveAnswers = value;
    });
  }

  final _$getTestDetailsAsyncAction = AsyncAction('_TestStore.getTestDetails');

  @override
  Future getTestDetails(HappynessTest test) {
    return _$getTestDetailsAsyncAction.run(() => super.getTestDetails(test));
  }

  final _$submitTestAsyncAction = AsyncAction('_TestStore.submitTest');

  @override
  Future submitTest() {
    return _$submitTestAsyncAction.run(() => super.submitTest());
  }

  final _$_TestStoreActionController = ActionController(name: '_TestStore');

  @override
  dynamic nextPageViewPage() {
    final _$actionInfo = _$_TestStoreActionController.startAction(
        name: '_TestStore.nextPageViewPage');
    try {
      return super.nextPageViewPage();
    } finally {
      _$_TestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousPageViewPage() {
    final _$actionInfo = _$_TestStoreActionController.startAction(
        name: '_TestStore.previousPageViewPage');
    try {
      return super.previousPageViewPage();
    } finally {
      _$_TestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getBigFiveAnswerValue(SubQuestion subQuestion) {
    final _$actionInfo = _$_TestStoreActionController.startAction(
        name: '_TestStore.getBigFiveAnswerValue');
    try {
      return super.getBigFiveAnswerValue(subQuestion);
    } finally {
      _$_TestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateBigFiveAnswerValue(SubQuestion subQuestion, double value) {
    final _$actionInfo = _$_TestStoreActionController.startAction(
        name: '_TestStore.updateBigFiveAnswerValue');
    try {
      return super.updateBigFiveAnswerValue(subQuestion, value);
    } finally {
      _$_TestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageViewPage: ${pageViewPage},
loading: ${loading},
error: ${error},
listQuestions: ${listQuestions},
pageMode: ${pageMode},
testId: ${testId},
listBigFiveAnswers: ${listBigFiveAnswers}
    ''';
  }
}
