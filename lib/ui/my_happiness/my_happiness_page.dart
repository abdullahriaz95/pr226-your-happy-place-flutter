import 'package:expansion_widget/expansion_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/my_happiness_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/my_happiness/test_page.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

import '../../injection.dart';

class MyHappinessPageParams {
  const MyHappinessPageParams(this.key);
  final Key key;
}

@injectable
class MyHappinessPageServices {
  MyHappinessStore store;
  MyHappinessPageServices({
    required this.store,
  });
}

@injectable
class MyHappinessPage extends StatelessWidget {
  final MyHappinessPageServices services;
  final MyHappinessPageParams? params;
  MyHappinessPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myHappiness),
      ),
      body: Observer(builder: (context) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: services.store.isLoadingOptions
              ? const SingleChildScrollView(
                  child: Loader(),
                )
              : body(context),
        );
      }),
    );
  }

  Widget body(BuildContext context) {
    if (services.store.happinessOptions.isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: ListView.builder(
        itemCount: services.store.happinessOptions.length,
        itemBuilder: (context, index) {
          return _listItem(
              services.store.happinessOptions[index], context, index);
        },
      ),
    );
  }

  Widget _listItem(
      HappynessOption happinessOption, BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8.0),
        child: ExpansionWidget(
          content: Observer(builder: (context) {
            if (services.store.testsLoading[index]) {
              return Column(
                children: const [
                  Loader(),
                  SizedBox(height: 16),
                ],
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: services.store.listTests[index].length,
                    itemBuilder: (context, i) {
                      return _item(index, i, context);
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    services.store.happinessOptions[index].description!,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          }),
          titleBuilder: (double animationValue,
              double easeInValue,
              bool isExpanded,
              dynamic Function({bool animated}) toggleFunction) {
            return InkWell(
              onTap: () {
                services.store.getTests(happinessOption.id.toString(), index);
                if (isExpanded) {
                  toggleFunction(animated: false);
                } else {
                  toggleFunction(animated: true);
                }
              },
              child: Column(
                children: [
                  Text(
                    happinessOption.title!,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Icon(
                    Icons.expand_more,
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _item(int index, int i, BuildContext context) {
    return Column(
      children: [
        AppButton(
          title: services.store.listTests[index][i].name!,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => getIt<TestPage>(
                  param1: TestPageParams(
                    test: services.store.listTests[index][i],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
