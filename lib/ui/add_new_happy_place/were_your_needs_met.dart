import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/add_new_happy_place_store.dart';
import 'package:happy_place/data/stores/were_your_needs_met_store.dart';

import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class WereYourNeedsMetPageParams {
  final AddNewHappyPlaceStore addNewHappyPlaceStore;
  Key? key;
  WereYourNeedsMetPageParams({
    required this.addNewHappyPlaceStore,
    this.key,
  });
}

@injectable
class WereYourNeedsMetPageServices {
  WereYourNeedsMetStore store;
  WereYourNeedsMetPageServices({
    required this.store,
  });
}

@injectable
class WereYourNeedsMetPage extends StatefulWidget {
  final WereYourNeedsMetPageServices services;
  final WereYourNeedsMetPageParams? params;
  WereYourNeedsMetPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<WereYourNeedsMetPage> createState() => _WereYourNeedsMetPageState();
}

class _WereYourNeedsMetPageState extends State<WereYourNeedsMetPage> {
  @override
  void initState() {
    widget.services.store.getFilters();

    // // getting the data here.
    // if (widget.params?.category == 1) {
    //   // moods
    //   Mood m = widget.params!.selectedItem;
    //   widget.services.store.getMoodDetails(m.id!);
    // }

    // if (widget.params?.category == 2) {
    //   // places
    //   Place p = widget.params!.selectedItem;
    //   widget.services.store.getPlaceDetails(p.id!);
    // }
    // if (widget.params?.category == 3) {
    //   // activities
    //   Activity p = widget.params!.selectedItem;
    //   widget.services.store.getActivityDetails(p.id!);
    // }
    // if (widget.params?.category == 4) {
    //   // feelings
    //   Feeling p = widget.params!.selectedItem;
    //   widget.services.store.getFeelingDetails(p.id!);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _heading(context),
                  const SizedBox(height: 24),
                  items(),
                  Column(
                    children: [
                      const SizedBox(height: 24),
                      AppEditText(
                        textController:
                            widget.services.store.noteEditingController,
                        headingText: 'Add a Note',
                        hint: 'Write here...',
                        isMultiLine: true,
                        backgroundcolor: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                          title: 'Done',
                          onPressed: () {
                            widget.params?.addNewHappyPlaceStore
                                    .finalFeelingRating =
                                int.parse(widget
                                    .services
                                    .store
                                    .filters[
                                        widget.services.store.indexSelected]
                                    .id!);
                            widget.params?.addNewHappyPlaceStore
                                    .finalFeelingTypeSelected =
                                widget
                                    .services
                                    .store
                                    .filters[
                                        widget.services.store.indexSelected]
                                    .title;
                            widget.params?.addNewHappyPlaceStore
                                    .finalNoteFeeling =
                                widget
                                    .services.store.noteEditingController.text;
                            Navigator.pop(context);
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget items() {
    return Observer(builder: (context) {
      if (widget.services.store.isLoading) {
        return const Loader();
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.services.store.filters.length,
        reverse: true,
        itemBuilder: (context, index) {
          return Observer(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  widget.services.store.updateSelected(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _getBgColor(index),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: widget.services.store.indexSelected == index
                          ? Colors.black
                          : Colors.transparent,
                      width: 5,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        widget.services.store.filters[index].title!,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      );
    });
  }

  Widget _heading(BuildContext context) {
    return Text(
      'Were your needs met?',
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }

  Color _getBgColor(int index) {
    if (index == 0) return const Color(0xFFFE4540);
    if (index == 1) return const Color(0xFFF96D01);
    if (index == 2) return const Color(0xFFFFB301);
    if (index == 3) return const Color(0xFF59C404);
    if (index == 4) return const Color(0xFF00B47B);
    return Colors.yellow;
  }
}
