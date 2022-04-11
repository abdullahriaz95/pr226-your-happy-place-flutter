import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/add_new_happy_place_store.dart';
import 'package:happy_place/data/stores/how_are_you_generic_store.dart';
import 'package:happy_place/extensions/color_extensions.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class HowAreYouGenericPageParams {
  final int
      category; // feeling == 1, where are you == 2 , what are you doing there == 3,
  final dynamic selectedItem;
  final AddNewHappyPlaceStore addNewHappyPlaceStore;
  final String? title;

  Key? key;
  HowAreYouGenericPageParams({
    required this.category,
    required this.selectedItem,
    required this.addNewHappyPlaceStore,
    this.key,
    this.title,
  });
}

@injectable
class HowAreYouGenericPageServices {
  HowAreYouGenericStore store;
  HowAreYouGenericPageServices({
    required this.store,
  });
}

@injectable
class HowAreYouGenericPage extends StatefulWidget {
  final HowAreYouGenericPageServices services;
  final HowAreYouGenericPageParams? params;
  HowAreYouGenericPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<HowAreYouGenericPage> createState() => _HowAreYouGenericPageState();
}

class _HowAreYouGenericPageState extends State<HowAreYouGenericPage> {
  @override
  void initState() {
    // getting the data here.
    if (widget.params?.category == 1) {
      // moods
      Mood m = widget.params!.selectedItem;
      widget.services.store.getMoodDetails(m.id!);
    }

    if (widget.params?.category == 2) {
      // places
      Place p = widget.params!.selectedItem;
      widget.services.store.getPlaceDetails(p.id!);
    }
    if (widget.params?.category == 3) {
      // activities
      Activity p = widget.params!.selectedItem;
      widget.services.store.getActivityDetails(int.parse(p.id!));
    }
    if (widget.params?.category == 4) {
      // feelings
      Feeling p = widget.params!.selectedItem;
      widget.services.store.getFeelingDetails(p.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.params?.category == 1
              ? S.of(context).howAreYouFeeling
              : widget.params?.category == 2
                  ? S.of(context).whereAreYou
                  : widget.params?.category == 3
                      ? S.of(context).whatAreYouDoing
                      : widget.params?.category == 4
                          ? S.of(context).howDoYouFeelAboutThisPlace
                          : '',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(62.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   widget.params?.title ?? 'no title',
                  //   style: Theme.of(context).textTheme.headline6,
                  //   textAlign: TextAlign.center,
                  // ),
                  _heading(context, widget.params?.title ?? 'no title'),
                  const SizedBox(height: 24),
                  items(widget.params?.title),
                  // if (widget.params?.category == 4) // not being used now
                  //   Column(
                  //     children: [
                  //       const SizedBox(height: 24),
                  //       AppEditText(
                  //         textController:
                  //             widget.services.store.noteEditingController,
                  //         headingText: 'Add a Note',
                  //         hint: 'Write here...',
                  //         isMultiLine: true,
                  //         backgroundcolor: Colors.white,
                  //       ),
                  //       const SizedBox(height: 24),
                  //       AppButton(title: 'Done', onPressed: () {})
                  //     ],
                  //   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget items(String? title) {
    return Observer(builder: (context) {
      if (widget.services.store.isLoading) {
        return const Loader();
      }

      var textColor = Colors.white;
      if (title != null) {
        if (title.toLowerCase() == 'energised') {
          textColor = const Color(0xFFA36100);
        } else if (title.toLowerCase() == 'relaxed') {
          textColor = const Color(0xFF1E0274);
        } else if (title.toLowerCase() == 'sick') {
          textColor = const Color(0xFF4E570F);
        }
      }

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.params?.category == 1
            ? widget.services.store.moodTypes.length
            : widget.params?.category == 2
                ? widget.services.store.placesTypes.length
                : widget.params?.category == 3
                    ? widget.services.store.activityTypes.length
                    : widget.params?.category == 4
                        ? widget.services.store.feelingTypes.length
                        : 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          String value;
          String colorValue;
          if (widget.params?.category == 1) {
            value = widget.services.store.moodTypes[index].name!;
            colorValue = widget.services.store.moodTypes[index].colour!;
          } else if (widget.params?.category == 2) {
            value = widget.services.store.placesTypes[index].name!;
            colorValue = widget.services.store.placesTypes[index].colour!;
          } else if (widget.params?.category == 3) {
            value = widget.services.store.activityTypes[index].name!;
            colorValue = widget.services.store.activityTypes[index].colour!;
          } else if (widget.params?.category == 4) {
            value = widget.services.store.feelingTypes[index].name!;
            colorValue = widget.services.store.feelingTypes[index].colour!;
          } else {
            value = '';
            colorValue = '0xffffff';
          }
          return _gridItem(colorValue, value, context, index, textColor);
        },
      );
    });
  }

  Widget _gridItem(String colorValue, String value, BuildContext context,
      int index, Color textColor) {
    bool oneWord = true;
    String s = value.trim();
    List<String> ss = s.split(" ");
    if (ss.length > 1) {
      oneWord = false;
    }

    return GestureDetector(
      onTap: () {
        if (widget.params?.category == 1) {
          widget.params?.addNewHappyPlaceStore.finalMoodSelected =
              widget.params?.selectedItem as Mood;
          widget.params?.addNewHappyPlaceStore.finalMoodTypeSelected =
              widget.services.store.moodTypes[index];
        } else if (widget.params?.category == 2) {
          widget.params?.addNewHappyPlaceStore.finalPlaceSelected =
              widget.params?.selectedItem as Place;
          widget.params?.addNewHappyPlaceStore.finalPlaceTypeSelected =
              widget.services.store.placesTypes[index];
        } else if (widget.params?.category == 3) {
          widget.params?.addNewHappyPlaceStore.finalActivitySelected =
              widget.params?.selectedItem as Activity;
          widget.params?.addNewHappyPlaceStore.finalActivityTypeSelected =
              widget.services.store.activityTypes[index];
        } /*  else if (widget.params?.category == 4) {
          widget.params?.addNewHappyPlaceStore.finalFeelingSelected =
              widget.params?.selectedItem as Feeling;
          widget.params?.addNewHappyPlaceStore.finalFeelingTypeSelected =
              widget.services.store.feelingTypes[index];
          widget.params?.addNewHappyPlaceStore.finalNoteFeeling =
              widget.services.store.noteEditingController.text;
        } */
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorValue.toColor(),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: oneWord
                ? FittedBox(
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                : Text(
                    value,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: textColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _heading(BuildContext context, String title) {
    String value;
    if (widget.params?.category == 1) {
      // moods
      Mood m = widget.params!.selectedItem;
      value = m.name!;
      return Text(
        title,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      );
    } else if (widget.params?.category == 2) {
      return Text(
        '$title Places',
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      );
    } else if (widget.params?.category == 3) {
      return Text(
        '$title Activities',
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      );
    } else if (widget.params?.category == 4) {
      return Text(
        title,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      );
    } else {
      value = '';
    }

    return Text(
      'How $value are you?',
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }
}
