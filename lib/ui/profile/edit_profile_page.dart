import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/data/stores/edit_profile_store.dart';
import 'package:happy_place/data/stores/profile_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/profile/change_password_page.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:happy_place/ui/widgets/rounded_border_image.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;

class EditProfilePageParams {
  const EditProfilePageParams({this.key, required this.user});
  final Key? key;
  final User user;
}

@injectable
class EditProfilePageServices {
  EditProfileStore store;
  EditProfilePageServices({
    required this.store,
  });
}

@injectable
class EditProfilePage extends StatefulWidget {
  final EditProfilePageServices services;
  final EditProfilePageParams? params;
  EditProfilePage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    widget.services.store.updateCurrentUserInfo(getIt<ProfileStore>().user!);
    _disposers = [
      reaction(
        (_) => widget.services.store.profileUpdated,
        (bool result) {
          if (result) {
            Navigator.pop(context, true);
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit/Complete Profile'),
        actions: [
          Center(
            child: GestureDetector(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  if (widget.services.store.finalPlaceSelected == null) {
                    HttpExceptionNotifyUser.showError(
                        'Select some address first');
                  } else if (widget.services.store.selectedAgeGroup == null) {
                    HttpExceptionNotifyUser.showError(
                        'Select some age group first');
                  } else {
                    // good to go
                    await widget.services.store.updateProfile();
                    // getIt<NavigationStore>().updateDontShowAgain();
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'Save',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Observer(builder: (context) {
            return widget.services.store.isLoading
                ? const Loader()
                : _body(context);
          }),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 24),
          _profilePicture(context),
          const SizedBox(height: 24),
          AppEditText(
            headingTextColor: Colors.grey.shade400,
            textController: widget.services.store.firstNameController,
            backgroundcolor: Colors.white,
            borderColor: Colors.grey,
            headingText: 'First Name',
            hint: 'Type here',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enter_first_name;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 12),
          AppEditText(
            headingTextColor: Colors.grey.shade400,
            textController: widget.services.store.lastNameController,
            backgroundcolor: Colors.white,
            borderColor: Colors.grey,
            headingText: 'Last Name',
            hint: 'Type here',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enter_last_name;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 12),
          AppEditText(
            headingTextColor: Colors.grey.shade400,
            textController: widget.services.store.usernameController,
            backgroundcolor: Colors.white,
            borderColor: Colors.grey,
            headingText: 'User Name',
            hint: 'Type here',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enter_username;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 12),
          AppEditText(
            textController: widget.services.store.emailController,
            backgroundcolor: Colors.white,
            headingTextColor: Colors.grey.shade400,
            borderColor: Colors.grey,
            headingText: 'Email',
            hint: 'Type here',
            enabled: false,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).enter_email;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 12),
          _gender(context),
          const SizedBox(height: 12),
          _ageGroup(context),
          const SizedBox(height: 12),
          _location(context),
          const SizedBox(height: 12),
          AppEditText(
            headingTextColor: Colors.grey.shade400,
            textController: widget.services.store.bioController,
            backgroundcolor: Colors.white,
            borderColor: Colors.grey,
            headingText: 'Bio',
            isMultiLine: true,
            hint: 'Type here',
          ),
          const SizedBox(height: 12),
          _changePasswordButton(context),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _changePasswordButton(BuildContext context) {
    return AppButton(
      title: 'Change Password',
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => getIt<ChangePasswordPage>(),
          ),
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
            'Location',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.grey.shade400,
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
          padding: const EdgeInsets.only(left: 16, top: 2),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: widget.services.store.locationController,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                ),
            onChanged: (s) {
              widget.services.store.finalPlaceSelected = null;
              widget.services.store.searchAddressWithAutoComplete(s);
            },
            decoration: InputDecoration(
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

  Widget _profilePicture(BuildContext context) {
    return Observer(builder: (context) {
      return Stack(
        children: [
          widget.services.store.profileImagePath != null
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 75,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(74),
                        child: image.Image.file(
                          io.File(widget.services.store.profileImagePath!),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: RoundedBorderBoxImage(
                    borderColor: Theme.of(context).primaryColor,
                    size: 150,
                    borderWidth: 2,
                    borderRadius: 150,
                    profileUrl: widget.services.store.user?.avatarUrl,
                  ),
                ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 127),
              child: GestureDetector(
                onTap: () {
                  widget.services.store.pickProfileImage();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _ageGroup(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Age Group',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                  fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                ),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<AgeGroup>(
            isDense: true,
            items: widget.services.store.ageGroups.map((AgeGroup ageGroup) {
              return DropdownMenuItem<AgeGroup>(
                value: ageGroup,
                child: Text(ageGroup.title!),
              );
            }).toList(),
            onChanged: (AgeGroup? newValue) {
              widget.services.store.selectedAgeGroup = newValue!;
            },
            value: widget.services.store.selectedAgeGroup,
            decoration: const InputDecoration(
              filled: true,
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              hintText: 'Select age group',
            ),
          ),
        ],
      );
    });
  }

  Widget _gender(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Gender',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w600,
                fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
              ),
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          isDense: true,
          items: ['Male', 'Female', 'Other'].map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
          onChanged: (newValue) {
            widget.services.store.gender = newValue!;
          },
          value: widget.services.store.gender,
          decoration: const InputDecoration(
            filled: true,
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            hintText: 'Gender',
          ),
        ),
      ],
    );
  }
}
