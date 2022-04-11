import 'package:expandable_page_view/expandable_page_view.dart';

import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/test_store.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/app_outlined_button.dart';
import 'package:happy_place/ui/widgets/custom_slider_shape.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class TestPageParams {
  const TestPageParams({this.key, required this.test});
  final Key? key;
  final HappynessTest test;
}

@injectable
class TestPageServices {
  TestStore store;
  TestPageServices({
    required this.store,
  });
}

@injectable
class TestPage extends StatefulWidget {
  final TestPageServices services;
  final TestPageParams? params;
  TestPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    widget.services.store.getTestDetails(widget.params!.test);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.params!.test.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Observer(builder: (context) {
          if (widget.services.store.pageMode == 0) {
            return _resultLayout();
          } else {
            return _testLayout(context);
          }
        }),
      ),
    );
  }

  Widget _resultLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        AppButton(
          title: 'Take the Test',
          verticalPadding: 40,
          borderRadius: 12,
          onPressed: () {
            widget.services.store.pageMode = 1;
          },
        ),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
        Observer(builder: (context) {
          if (widget.services.store.testId == 1) {
            return const Text('Big Five result');
          } else if (widget.services.store.testId == 2) {
            return const Text('HEXACO result');
          } else {
            return const Text('Make a Happiness Entry');
          }
        }),
      ],
    );
  }

  Widget _testLayout(BuildContext context) {
    return Observer(builder: (context) {
      if (widget.services.store.loading) return const Loader();

      if (widget.services.store.testId == 1) {
        return _bigFiveTest(context);
      }

      if (widget.services.store.testId == 2) {
        return _hexacoTest(context);
      }

      if (widget.services.store.testId == 3) {
        return _makeAHappinessEntryTest(context);
      }

      return const SizedBox();
    });
  }

  Widget _bigFiveTest(BuildContext context) {
    return SingleChildScrollView(
      child: Observer(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Text(
                widget
                    .services
                    .store
                    .listQuestions[widget.services.store.pageViewPage - 1]
                    .title!,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                widget
                    .services
                    .store
                    .listQuestions[widget.services.store.pageViewPage - 1]
                    .description!,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            ExpandablePageView.builder(
              itemCount: widget.services.store.listQuestions.length,
              controller: widget.services.store.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, pageViewIndex) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.services.store
                          .listQuestions[pageViewIndex].subQuestions!.length,
                      itemBuilder: (context, listIndex) {
                        var number = listIndex + 1;
                        return Observer(builder: (context) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    number.toString() + '.',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      widget
                                          .services
                                          .store
                                          .listQuestions[pageViewIndex]
                                          .subQuestions![listIndex]
                                          .title!,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                        Icons.thumb_down_off_alt_outlined),
                                    Expanded(
                                      child: Slider(
                                        value: double.parse(
                                          widget
                                              .services.store.listBigFiveAnswers
                                              .firstWhere(
                                                (answer) =>
                                                    answer.questionId ==
                                                    widget
                                                        .services
                                                        .store
                                                        .listQuestions[
                                                            pageViewIndex]
                                                        .subQuestions![
                                                            listIndex]
                                                        .id,
                                              )
                                              .answer!,
                                        ),
                                        onChanged: (s) {
                                          widget.services.store
                                              .updateBigFiveAnswerValue(
                                            widget
                                                .services
                                                .store
                                                .listQuestions[pageViewIndex]
                                                .subQuestions![listIndex],
                                            s,
                                          );
                                        },
                                      ),
                                    ),
                                    const Icon(Icons.thumb_up_off_alt_outlined),
                                  ],
                                ),
                              ),
                            ],
                          );
                        });
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: widget.services.store.pageViewPage == 1
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              widget.services.store.previousPageViewPage();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      '${widget.services.store.pageViewPage} of ${widget.services.store.listQuestions.length}',
                    ),
                  ),
                ),
                Expanded(
                  child: widget.services.store.pageViewPage ==
                          widget.services.store.listQuestions.length
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              widget.services.store.nextPageViewPage();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: AppOutlinedButton(
                title: widget.services.store.pageViewPage ==
                        widget.services.store.listQuestions.length
                    ? 'Save'
                    : 'Cancel',
                onPressed: () async {
                  if (widget.services.store.pageViewPage ==
                      widget.services.store.listQuestions.length) {
                    await widget.services.store.submitTest();
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      }),
    );
  }

  Widget _hexacoTest(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Center(
            child: Text(
              widget.services.store.listQuestions[0].title!,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              widget.services.store.listQuestions[0].description!,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // separatorBuilder: (context, index) {
                //   return const SizedBox(height: 16);
                // },
                itemBuilder: (context, index) {
                  return Observer(builder: (context) {
                    var subQuestion = widget
                        .services.store.listQuestions[0].subQuestions![index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              subQuestion.title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context)
                                .copyWith(trackShape: CustomTrackShape()),
                            child: Slider(
                              value: double.parse(
                                  widget.services.store.listBigFiveAnswers
                                      .firstWhere(
                                        (answer) =>
                                            // answer.happinessTestId ==
                                            //     widget
                                            //         .services
                                            //         .store
                                            //         .listQuestions[0]
                                            //         .subQuestions![index]
                                            //         .happynessTestId &&
                                            // answer.parentQuestionId ==
                                            //     widget
                                            //         .services
                                            //         .store
                                            //         .listQuestions[0]
                                            //         .subQuestions![index]
                                            //         .parentQuestionId &&
                                            answer.questionId ==
                                            widget
                                                .services
                                                .store
                                                .listQuestions[0]
                                                .subQuestions![index]
                                                .id,
                                      )
                                      .answer!),
                              onChanged: (s) {
                                widget.services.store.updateBigFiveAnswerValue(
                                  widget
                                      .services
                                      .store
                                      .listQuestions[
                                          0] // always one top question
                                      .subQuestions![index],
                                  s,
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  subQuestion.topEndNote!,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Flexible(
                                child: Container(),
                                flex: 1,
                              ),
                              Flexible(
                                flex: 3,
                                child: Text(
                                  subQuestion.bottomEndNote!,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
                },
                itemCount: 5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 150,
              child: AppButton(
                title: 'Save',
                onPressed: () {
                  widget.services.store.submitTest();
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _makeAHappinessEntryTest(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.services.store.listQuestions.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          widget.services.store.listQuestions[index].title!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.services.store.listQuestions[index]
                              .subQuestions!.length,
                          itemBuilder: (context, subQuestionIndex) {
                            return Observer(builder: (context) {
                              var itemIndex = subQuestionIndex + 1;
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          itemIndex.toString() + '.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(color: Colors.grey),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            widget
                                                .services
                                                .store
                                                .listQuestions[index]
                                                .subQuestions![subQuestionIndex]
                                                .title!,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.sentiment_dissatisfied_rounded,
                                          color: Colors.grey.shade500,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: SliderTheme(
                                            data: SliderTheme.of(context)
                                                .copyWith(
                                                    trackShape:
                                                        CustomTrackShape()),
                                            child: Slider(
                                              value: double.parse(widget
                                                  .services
                                                  .store
                                                  .listBigFiveAnswers
                                                  .firstWhere(
                                                    (answer) =>
                                                        // answer.happinessTestId ==
                                                        //     widget
                                                        //         .services
                                                        //         .store
                                                        //         .listQuestions[0]
                                                        //         .subQuestions![index]
                                                        //         .happynessTestId &&
                                                        // answer.parentQuestionId ==
                                                        //     widget
                                                        //         .services
                                                        //         .store
                                                        //         .listQuestions[0]
                                                        //         .subQuestions![index]
                                                        //         .parentQuestionId &&
                                                        answer.questionId ==
                                                        widget
                                                            .services
                                                            .store
                                                            .listQuestions[
                                                                index]
                                                            .subQuestions![
                                                                subQuestionIndex]
                                                            .id,
                                                  )
                                                  .answer!),
                                              onChanged: (s) {
                                                widget.services.store
                                                    .updateBigFiveAnswerValue(
                                                  widget
                                                          .services
                                                          .store
                                                          .listQuestions[index]
                                                          .subQuestions![
                                                      subQuestionIndex],
                                                  s,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.sentiment_satisfied_rounded,
                                          color: Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 150,
              child: AppButton(
                title: 'Save',
                onPressed: () {
                  widget.services.store.submitTest();
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
