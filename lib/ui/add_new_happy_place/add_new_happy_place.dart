import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/data/stores/add_new_happy_place_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/add_new_happy_place/how_are_you_generic.dart';
import 'package:happy_place/ui/add_new_happy_place/were_your_needs_met.dart';
import 'package:happy_place/ui/places_history/places_history_page.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:happy_place/ui/widgets/progress_dialog_layout.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

const kGoogleApiKey = "AIzaSyCICfk-dh166H3MEaF2SgmtHhDcNlcf-8w";

class AddNewHappyPlacePageParams {
  const AddNewHappyPlacePageParams(this.key);
  final Key key;
}

@injectable
class AddNewHappyPlacePageServices {
  AddNewHappyPlaceStore store;
  AddNewHappyPlacePageServices({
    required this.store,
  });
}

@injectable
class AddNewHappyPlacePage extends StatefulWidget {
  final AddNewHappyPlacePageServices services;
  final AddNewHappyPlacePageParams? params;
  AddNewHappyPlacePage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  _AddNewHappyPlacePageState createState() => _AddNewHappyPlacePageState();
}

class _AddNewHappyPlacePageState extends State<AddNewHappyPlacePage> {
  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _disposers = [
      reaction(
        (_) => widget.services.store.savingPlace,
        (bool result) {
          if (result) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.grey.shade800,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  content: const ProgressDialogLayout(),
                );
              },
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    for (final d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add your Happy Place'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => getIt<PlacesHistoryPage>(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                'assets/images/time_picker.png',
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Summary',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _happyPlaces(context),
              const SizedBox(height: 16),
              _cardContent(context),
              const SizedBox(height: 16),
              // SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              _pageIndicators(context),
              const SizedBox(height: 16),
              _buttons(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardContent(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        elevation: 12,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Observer(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: widget.services.store.currentPage == 0
                    ? _pickLocation(context)
                    : widget.services.store.currentPage == 1
                        ? _howAreYouFeeling(context)
                        : widget.services.store.currentPage == 2
                            ? _whereAreYou(context)
                            : widget.services.store.currentPage == 3
                                ? _whatAreYouDoingHere(context)
                                : _howDoYouFeel(context),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _howDoYouFeel(BuildContext context) {
    return Observer(
        key: UniqueKey(),
        builder: (context) {
          if (widget.services.store.feelings?.isEmpty ?? true) {
            return const SizedBox();
          }
          var listRows = [];
          var listWidgets = [];
          for (int i = 0; i < widget.services.store.feelings!.length; i++) {
            listWidgets.add(
              Expanded(
                child: TapDebouncer(
                  onTap: () async {
                    if (widget.services.store.currentPage == 4) {
                      widget.services.store.finalFeelingSelected =
                          widget.services.store.feelings![i];
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => getIt<WereYourNeedsMetPage>(
                            param1: WereYourNeedsMetPageParams(
                              addNewHappyPlaceStore: widget.services.store,
                            ),
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => getIt<HowAreYouGenericPage>(
                            param1: HowAreYouGenericPageParams(
                              category: widget.services.store.currentPage,
                              selectedItem: widget.services.store.feelings![i],
                              addNewHappyPlaceStore: widget.services.store,
                              title: widget.services.store.feelings![i].name!,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, onTap) {
                    return GestureDetector(
                      onTap: onTap,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                widget.services.store.feelings![i].imageUrl!,
                                fit: BoxFit.contain,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const CupertinoActivityIndicator();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.services.store.feelings![i].name!,
                              style: Theme.of(context).textTheme.overline,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
            if (listWidgets.length == 3) {
              listRows.add(
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [...listWidgets],
                  ),
                ),
              );
              listRows.add(
                const SizedBox(
                  height: 6,
                ),
              );
              listWidgets.clear();
            }
          }

          return Column(
            children: [
              const SizedBox(height: 24),
              Text(
                S.of(context).howDoYouFeelAboutThisPlace,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [...listRows],
                ),
              ),
            ],
          );
        });
  }

  Widget _whatAreYouDoingHere(BuildContext context) {
    return Observer(
        key: UniqueKey(),
        builder: (context) {
          if (widget.services.store.activities?.isEmpty ?? true) {
            return const SizedBox();
          }
          var listRows = [];
          var listPlacesWidgets = [];
          for (int i = 0; i < widget.services.store.activities!.length; i++) {
            listPlacesWidgets.add(
              Expanded(
                child: TapDebouncer(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => getIt<HowAreYouGenericPage>(
                          param1: HowAreYouGenericPageParams(
                            category: widget.services.store.currentPage,
                            selectedItem: widget.services.store.activities![i],
                            addNewHappyPlaceStore: widget.services.store,
                            title: widget.services.store.activities![i].name!,
                          ),
                        ),
                      ),
                    );
                  },
                  builder: (context, onTap) {
                    return GestureDetector(
                      onTap: onTap,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                widget.services.store.activities![i].imageUrl!,
                                fit: BoxFit.contain,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const CupertinoActivityIndicator();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.services.store.activities![i].name!,
                              style: Theme.of(context).textTheme.overline,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
            if (listPlacesWidgets.length == 3) {
              listRows.add(
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [...listPlacesWidgets],
                  ),
                ),
              );
              listRows.add(
                const SizedBox(
                  height: 6,
                ),
              );
              listPlacesWidgets.clear();
            }
          }

          return Column(
            children: [
              const SizedBox(height: 24),
              Text(
                S.of(context).whatAreYouDoing,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [...listRows],
                ),
              ),
            ],
          );
        });
  }

  Widget _whereAreYou(BuildContext context) {
    return Observer(
        key: UniqueKey(),
        builder: (context) {
          if (widget.services.store.places?.isEmpty ?? true) {
            return const SizedBox();
          }
          var listRows = [];
          var listPlacesWidgets = [];
          for (int i = 0; i < widget.services.store.places!.length; i++) {
            listPlacesWidgets.add(
              Expanded(
                child: TapDebouncer(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => getIt<HowAreYouGenericPage>(
                          param1: HowAreYouGenericPageParams(
                            category: widget.services.store.currentPage,
                            selectedItem: widget.services.store.places![i],
                            addNewHappyPlaceStore: widget.services.store,
                            title: widget.services.store.places![i].name!,
                          ),
                        ),
                      ),
                    );
                  },
                  builder: (context, onTap) {
                    return GestureDetector(
                      onTap: onTap,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                widget.services.store.places![i].imageUrl!,
                                key: UniqueKey(),
                                fit: BoxFit.contain,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const CupertinoActivityIndicator();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.services.store.places![i].name!,
                              style: Theme.of(context).textTheme.overline,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
            if (listPlacesWidgets.length == 3) {
              listRows.add(
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [...listPlacesWidgets],
                  ),
                ),
              );
              listRows.add(
                const SizedBox(
                  height: 6,
                ),
              );
              listPlacesWidgets.clear();
            }
          }

          return Column(
            children: [
              const SizedBox(height: 24),
              Text(
                S.of(context).whereAreYou,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [...listRows],
                ),
              ),
            ],
          );
        });
  }

  Widget _howAreYouFeeling(BuildContext context) {
    return Observer(
        key: UniqueKey(),
        builder: (context) {
          if (widget.services.store.moods?.isEmpty ?? true) {
            return const SizedBox();
          }
          var listRows = [];
          var listFeelingWidgets = [];
          for (int i = 0; i < widget.services.store.moods!.length; i++) {
            listFeelingWidgets.add(
              Expanded(
                child: TapDebouncer(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => getIt<HowAreYouGenericPage>(
                          param1: HowAreYouGenericPageParams(
                            category: widget.services.store.currentPage,
                            selectedItem: widget.services.store.moods![i],
                            addNewHappyPlaceStore: widget.services.store,
                            title: widget.services.store.moods![i].name!,
                          ),
                        ),
                      ),
                    );
                  },
                  builder: (context, onTap) {
                    return GestureDetector(
                      onTap: onTap,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.network(
                                widget.services.store.moods![i].imageUrl!,
                                fit: BoxFit.contain,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const CupertinoActivityIndicator();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            FittedBox(
                              child: Text(
                                widget.services.store.moods![i].name!,
                                style: Theme.of(context).textTheme.overline,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
            if (listFeelingWidgets.length == 3) {
              listRows.add(
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [...listFeelingWidgets],
                  ),
                ),
              );
              listRows.add(
                const SizedBox(
                  height: 6,
                ),
              );
              listFeelingWidgets.clear();
            }
          }

          return Column(
            children: [
              const SizedBox(height: 24),
              Text(
                S.of(context).howAreYouFeeling,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [...listRows],
                ),
              ),
            ],
          );
        });
  }

  Widget _pickLocation(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          'Pick your location',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          textCapitalization: TextCapitalization.sentences,

          // style: Theme.of(context).textTheme.bodyText1?.copyWith(
          //       color: Colors.black,
          //       fontWeight: FontWeight.normal,
          //       fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
          //     ),
          onChanged: (s) {
            widget.services.store.finalLocationSelected = null;
            widget.services.store.searchAddressWithAutoComplete(s);
          },
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/places_btn.png',
                    height: 26,
                    width: 26,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
            hintText: 'Location',
            hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.grey,
                  fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        Expanded(
          child: Observer(builder: (context) {
            if (widget.services.store.finalLocationSelected != null) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.services.store.finalLocationSelected!.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              );
            }

            if (widget.services.store.loadingPlaces) {
              return const Loader();
            }
            if (widget.services.store.placesAutoCompleteList.isEmpty) {
              return const SizedBox();
            }
            return ListView.builder(
              itemCount: widget.services.store.placesAutoCompleteList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    widget.services.store.finalLocationSelected =
                        widget.services.store.placesAutoCompleteList[index];
                  },
                  title: Text(widget.services.store
                      .placesAutoCompleteList[index].description),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buttons() {
    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: AppButton(
              title: S.of(context).previous,
              verticalPadding: 16,
              onPressed: () => widget.services.store.previousPage(),
              disabled: widget.services.store.currentPage == 0,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: AppButton(
              title: (widget.services.store.currentPage <
                      widget.services.store.totalPages)
                  ? S.of(context).next
                  : S.of(context).complete,
              verticalPadding: 16,
              disabled: (widget.services.store.currentPage ==
                      widget.services.store.totalPages) &&
                  (widget.services.store.finalMoodTypeSelected == null ||
                      widget.services.store.finalPlaceTypeSelected == null ||
                      widget.services.store.finalActivityTypeSelected == null ||
                      widget.services.store.finalFeelingTypeSelected == null ||
                      widget.services.store.finalLocationSelected == null),
              disabledOnPressed: () {
                if (widget.services.store.finalLocationSelected == null) {
                  HttpExceptionNotifyUser.showError(
                      'Please select a location first');
                } else if (widget.services.store.finalMoodTypeSelected ==
                        null ||
                    widget.services.store.finalPlaceTypeSelected == null ||
                    widget.services.store.finalActivityTypeSelected == null ||
                    widget.services.store.finalFeelingTypeSelected == null) {
                  HttpExceptionNotifyUser.showError(
                      'Please complete all the previous steps first');
                }
              },
              onPressed: () async {
                if (widget.services.store.currentPage <
                    widget.services.store.totalPages) {
                  widget.services.store.nextPage();
                } else {
                  try {
                    await widget.services.store.completeAHappyPlace();
                    await HttpExceptionNotifyUser.showError(
                        'Place Added Successfully');
                    Navigator.pop(context);
                  } catch (e) {
                    rethrow;
                  }
                }
              },
            ),
          ),
        ],
      );
    });
  }

  Widget _pageIndicators(BuildContext context) {
    return Observer(builder: (context) {
      var listPageIndicators = [];
      for (int i = 0; i <= widget.services.store.totalPages; i++) {
        if (widget.services.store.currentPage == i) {
          listPageIndicators.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                height: 4,
                width: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        } else {
          listPageIndicators.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Container(
                height: 4,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
        }
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [...listPageIndicators],
      );
    });
  }

  Widget _happyPlaces(BuildContext context) {
    return Observer(builder: (context) {
      return Row(
        children: [
          Expanded(
            child: widget.services.store.finalMoodTypeSelected == null
                ? DottedBorder(
                    dashPattern: const [6, 6],
                    color: Colors.grey,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              S.of(context).addYourHappyPlace,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(color: Colors.grey),
                            )),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.services.store.finalMoodSelected!.imageUrl!,
                          fit: BoxFit.contain,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.services.store.finalMoodSelected!.name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 8),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.grey.shade100,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 2),
                              child: Text(
                                widget.services.store.finalMoodTypeSelected!
                                    .name!,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(fontSize: 8),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          const SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              height: 40,
              width: 1,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: widget.services.store.finalPlaceTypeSelected == null
                ? DottedBorder(
                    dashPattern: const [6, 6],
                    color: Colors.grey,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            S.of(context).addYourHappyPlace,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.services.store.finalPlaceSelected!.imageUrl!,
                          fit: BoxFit.contain,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.services.store.finalPlaceSelected!.name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 8),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.grey.shade100,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 2),
                              child: Text(
                                widget.services.store.finalPlaceTypeSelected!
                                    .name!,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(fontSize: 8),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          const SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              height: 40,
              width: 1,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: widget.services.store.finalActivityTypeSelected == null
                ? DottedBorder(
                    dashPattern: const [6, 6],
                    color: Colors.grey,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            S.of(context).addYourHappyPlace,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget
                              .services.store.finalActivitySelected!.imageUrl!,
                          fit: BoxFit.contain,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.services.store.finalActivitySelected!.name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 8),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.grey.shade100,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 2),
                              child: Text(
                                widget.services.store.finalActivityTypeSelected!
                                    .name!,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(fontSize: 8),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          const SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              height: 40,
              width: 1,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: widget.services.store.finalFeelingTypeSelected == null
                ? DottedBorder(
                    dashPattern: const [6, 6],
                    color: Colors.grey,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            S.of(context).addYourHappyPlace,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .overline
                                ?.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.services.store.finalFeelingSelected!.imageUrl!,
                          fit: BoxFit.contain,
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.services.store.finalFeelingSelected!.name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 8),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.grey.shade100,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 2),
                              child: Text(
                                widget.services.store.finalFeelingTypeSelected!,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(fontSize: 8),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ],
      );
    });
  }
}
