import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/extensions/double_extensions.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/models/big_five_request.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'test_store.g.dart';

@injectable
class TestStore = _TestStore with _$TestStore;

abstract class _TestStore with Store {
  final ApiProvider apiProvider;

  _TestStore(this.apiProvider);

  String? errorMessage;
  String? profileImagePath;
  PageController? pageController = PageController();

  @observable
  int pageViewPage = 1;

  @observable
  bool loading = false;

  @observable
  int error = 1;

  @observable
  List<Question> listQuestions = [];

  @observable
  int pageMode = 0; // 0 for new layout, 1 for test layout

  @observable
  int testId = 1; // 1 for Big Five, 2 for HEXACO, 3 for Make a Happiness Entry

  @observable
  List<BigFiveAnswerRequest> listBigFiveAnswers = [];

  @action
  nextPageViewPage() {
    if (pageViewPage < listQuestions.length) {
      pageViewPage++;
      pageController?.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  @action
  previousPageViewPage() {
    if (pageViewPage > 1) {
      pageViewPage--;
      pageController?.previousPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  @action
  getTestDetails(HappynessTest test) async {
    try {
      loading = true;
      testId = int.parse(test.id!);
      Response<HappynessTestsQuestionsResponse>? response =
          await apiProvider.apiClient.happynessTestsIdQuestionsGet(id: test.id);

      if (loading) loading = false;
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        listQuestions = ApiSuccessParser.payloadOrThrow(response);

        if (testId == 1 || testId == 3) {
          // it means the test is big five or make a happiness entry. so we get the answers list ready.
          for (int i = 0; i < listQuestions.length; i++) {
            if (listQuestions[i].subQuestions != null) {
              for (int j = 0; j < listQuestions[i].subQuestions!.length; j++) {
                listBigFiveAnswers.add(
                  BigFiveAnswerRequest(
                    // happinessTestId:
                    //     listQuestions[i].subQuestions![j].happynessTestId!,
                    // parentQuestionId:
                    //     listQuestions[i].subQuestions![j].parentQuestionId!,
                    questionId: listQuestions[i].subQuestions![j].id!,
                    answer: '0.5',
                  ),
                );
              }
            }
          }
        } else if (testId == 2) {
          // hexaco test

          if (listQuestions.isNotEmpty) {
            if (listQuestions[0].subQuestions != null) {
              for (int j = 0; j < listQuestions[0].subQuestions!.length; j++) {
                listBigFiveAnswers.add(
                  BigFiveAnswerRequest(
                    // happinessTestId:
                    //     listQuestions[0].subQuestions![j].happynessTestId!,
                    // parentQuestionId:
                    //     listQuestions[0].subQuestions![j].parentQuestionId!,
                    questionId: listQuestions[0].subQuestions![j].id!,
                    answer: '0.5',
                  ),
                );
              }
            }
          }
        }
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      if (loading) loading = false;

      rethrow;
    }
  }

  @action
  submitTest() async {
    try {
      // var json = jsonEncode(listBigFiveAnswers.map((e) => e.toJson()).toList());
      // loading = true;
      // var response =
      //     await apiProvider.apiClient.answersPost(questionAndAnswers: json);

      // if (loading) loading = false;
      // if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
      // } else {
      //   ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      // }
    } catch (e) {
      if (loading) loading = false;

      rethrow;
    }
  }

  @action
  getBigFiveAnswerValue(SubQuestion subQuestion) {
    return double.parse(listBigFiveAnswers
        .firstWhere((answer) =>
            // answer.happinessTestId == subQuestion.happynessTestId &&
            // answer.parentQuestionId == subQuestion.parentQuestionId &&
            answer.questionId == answer.questionId)
        .answer!);
  }

  @action
  updateBigFiveAnswerValue(SubQuestion subQuestion, double value) {
    listBigFiveAnswers
        .firstWhere((answer) =>
            // answer.happinessTestId == subQuestion.happynessTestId &&
            // answer.parentQuestionId == subQuestion.parentQuestionId &&
            answer.questionId == subQuestion.id)
        .answer = value.toPrecision(2).toString();
    listBigFiveAnswers = listBigFiveAnswers;
    // for (var j in listBigFiveAnswers) {
    //   print(
    //       'Answer item\nparent question id: ${j.parentQuestionId}\nquestion id: ${j.questionId}\nanswer :${j.answer}\n\n');
    // }
  }
}
