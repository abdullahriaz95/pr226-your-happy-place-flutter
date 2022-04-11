import 'dart:io' as io;

import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/data/stores/my_places_stores/add_place_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:happy_place/ui/widgets/progress_dialog_layout.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class AddPlaceParams {
  Entry? post;
  AddPlaceParams({this.key, this.post});
  final Key? key;
}

@injectable
class AddPlaceServices {
  AddPlaceStore store;

  AddPlaceServices({
    required this.store,
  });
}

@injectable
class AddPlacePage extends StatefulWidget {
  final AddPlaceServices services;
  final AddPlaceParams? params;
  AddPlacePage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  late List<ReactionDisposer> _disposers;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    if (widget.params?.post != null) {
      widget.services.store.editingMode = true;
      widget.services.store.setPostDetials(widget.params!.post!);
    }

    _disposers = [
      reaction((_) => widget.services.store.isLoading, (bool result) async {
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
      }),
      reaction((_) => widget.services.store.placeAdded, (bool result) async {
        if (result) {
          await HttpExceptionNotifyUser.showMessage(
              widget.services.store.editingMode
                  ? 'Post Updated'
                  : 'Post Added');
          Navigator.pop(context, true);
        }
      }),
      reaction((_) => widget.services.store.moreThan5ImagesPicked,
          (int result) async {
        await HttpExceptionNotifyUser.showMessage(
            'You can only add upto 5 images.');
      })
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Photos'),
      ),
      body: Observer(builder: (BuildContext context) {
        if (widget.services.store.moodsLoading) return const Loader();

        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              primary: true,
              children: [
                Text(
                  S.of(context).we_keep_your_posts,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 12),
                _checkGroup(),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                _location(context),
                const SizedBox(height: 10.0),
                AppEditText(
                  headingText: 'Post Title',
                  hint: 'Title',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter Post Title';
                    }
                    return null;
                  },
                  textController: widget.services.store.titleController,
                ),
                const SizedBox(height: 10.0),
                _date(),
                const SizedBox(height: 20.0),
                _mood(context),
                const SizedBox(height: 20.0),
                AppEditText(
                  headingText: 'Add a note',
                  hint: '',
                  textController: widget.services.store.noteController,
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'Enter Note';
                  //   }
                  //   return null;
                  // },
                  isMultiLine: true,
                ),
                const SizedBox(height: 20.0),
                _images(context),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.center,
                  child: AppButton(
                    verticalPadding: 12.0,
                    onPressed: () async {
                      // validate first here
                      if (widget.services.store.finalPlaceSelected == null) {
                        await HttpExceptionNotifyUser.showError(
                            'Select a Place First');
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        if (widget.services.store.editingMode) {
                          widget.services.store.updatePost();
                        } else {
                          widget.services.store.uploadPlace();
                        }
                      }
                    },
                    title: 'Save',
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _images(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Image',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                ),
          ),
          Text(
            '(You can only add 5 images)',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.grey,
                  fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                ),
          ),
          SizedBox(
            height: 100.0,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => widget.services.store.choosePhoto(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DottedBorder(
                      radius: const Radius.circular(10),
                      strokeWidth: 2,
                      dashPattern: const [8, 3],
                      borderType: BorderType.RRect,
                      color: Theme.of(context).primaryColor,
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: image.Image.asset(
                          'assets/images/image_upload.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                Observer(builder: (context) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.services.store.images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            widget.services.store.images.removeAt(index);
                            widget.services.store.images =
                                widget.services.store.images;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DottedBorder(
                              radius: const Radius.circular(10),
                              strokeWidth: 2,
                              dashPattern: const [8, 3],
                              borderType: BorderType.RRect,
                              color: Theme.of(context).primaryColor,
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: !widget
                                              .services.store.images[index]
                                              .contains('http')
                                          ? image.Image.file(
                                              io.File(
                                                widget.services.store
                                                    .images[index],
                                              ),
                                              height: 80,
                                              width: 80,
                                              fit: BoxFit.cover,
                                            )
                                          : image.Image.network(
                                              widget
                                                  .services.store.images[index],
                                              height: 80,
                                              width: 80,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _mood(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Mood?',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
              ),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.services.store.moods.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10.0),
            itemBuilder: (context, index) {
              return Observer(builder: (context) {
                return GestureDetector(
                  onTap: () => widget.services.store.selectedMood =
                      widget.services.store.moods[index],
                  child: _moodListItems(widget.services.store.moods[index]),
                );
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _date() {
    return Observer(
      builder: (BuildContext context) {
        return AppEditText(
          headingText: 'Date',
          hint: 'Date',
          keyboardType: TextInputType.datetime,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: SizedBox(
              height: 24,
              child: image.Image.asset(
                'assets/images/ic_calendar.png',
                height: 24,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Enter Date';
            }
            return null;
          },
          onChanged: (s) async {
            DateTime? day = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2005),
                lastDate: DateTime.now());
            FocusScope.of(context).unfocus();
            widget.services.store.dateController.text =
                DateFormat.yMMMMd('en_US').format(day!);
            // widget.services.store.dateController.text =
            //     '${day?.year}-${day?.month}-${day?.day}';
          },
          onTap: () async {
            DateTime? day = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2005),
                lastDate: DateTime.now());
            FocusScope.of(context).unfocus();
            widget.services.store.dateController.text =
                DateFormat.yMMMMd('en_US').format(day!);
            // '${day?.year}-${day?.month}-${day?.day}';
          },
          textController: widget.services.store.dateController,
        );
      },
    );
  }

  Widget _location(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Select Location',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade700),
          ),
          padding: const EdgeInsets.only(left: 16, top: 4),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: widget.services.store.locationController,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  // fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                ),
            onChanged: (s) {
              widget.services.store.finalPlaceSelected = null;
              widget.services.store.searchAddressWithAutoComplete(s);
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image.Image.asset(
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
              border: InputBorder.none,
            ),
          ),
        ),
        Observer(builder: (context) {
          if (widget.services.store.showPlacesLayout == false) {
            return const SizedBox();
          }
          return Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 200,
            child: widget.services.store.loadingPlaces
                ? const Loader()
                : ListView.builder(
                    itemCount:
                        widget.services.store.placesAutoCompleteList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          widget.services.store.finalPlaceSelected = widget
                              .services.store.placesAutoCompleteList[index];
                          if (widget.services.store.finalPlaceSelected
                                  ?.description !=
                              null) {
                            widget.services.store.locationController.text =
                                widget.services.store.finalPlaceSelected!
                                    .description;
                            FocusScope.of(context).unfocus();
                            widget.services.store.showPlacesLayout = false;
                          }
                        },
                        title: Text(widget.services.store
                            .placesAutoCompleteList[index].description),
                      );
                    },
                  ),
          );
        }),
        const SizedBox(height: 10),
      ],
    );
  }

  _checkGroup() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      value: widget.services.store.privacyPrivate,
                      onChanged: (i) {
                        widget.services.store.privacyPrivate = true;
                        widget.services.store.privacypublic = false;
                        widget.services.store.privacyFamily = false;
                        widget.services.store.privacyFriends = false;
                      },
                      fillColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Keep Private',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      value: widget.services.store.privacypublic,
                      onChanged: (i) {
                        widget.services.store.privacyPrivate = false;
                        widget.services.store.privacypublic = true;
                        widget.services.store.privacyFamily = false;
                        widget.services.store.privacyFriends = false;
                      },
                      fillColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Make Public',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      value: widget.services.store.privacyFamily,
                      onChanged: (i) {
                        widget.services.store.privacyPrivate = false;
                        widget.services.store.privacypublic = false;
                        widget.services.store.privacyFamily = true;
                        widget.services.store.privacyFriends = false;
                      },
                      fillColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Family',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      value: widget.services.store.privacyFriends,
                      onChanged: (i) {
                        widget.services.store.privacyPrivate = false;
                        widget.services.store.privacypublic = false;
                        widget.services.store.privacyFamily = false;
                        widget.services.store.privacyFriends = true;
                      },
                      fillColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Friends',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _moodListItems(Mood mood) {
    return Observer(
      builder: (BuildContext context) {
        return Container(
          height: 80,
          width: 100,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: widget.services.store.selectedMood == mood
                  ? Theme.of(context).primaryColor.withOpacity(0.3)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image.Image.network(
                mood.imageUrl!,
                width: 50.0,
                height: 50.0,
              ),
              const SizedBox(height: 2.0),
              Text(mood.name!, style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        );
      },
    );
  }
}
