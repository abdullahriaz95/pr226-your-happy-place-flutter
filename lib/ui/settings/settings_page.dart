
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/settings_store.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class SettingsPageParams {
  SettingsPageParams({
    this.key,
  });
  final Key? key;
}

@injectable
class SettingsPageServices {
  SettingsStore store;
  SettingsPageServices({
    required this.store,
  });
}

@injectable
class SettingsPage extends StatefulWidget {
  final SettingsPageServices services;
  final SettingsPageParams? params;
  SettingsPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 32,
          ),
          child: Observer(builder: (context) {
            if (widget.services.store.isLoading) {
              return const Loader();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'We keep your posts private unless you want to share. Who do you want to share with?',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                _privateAndPublic(context),
                const SizedBox(height: 16),
                _familyAndFriends(context),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),

                _visibleUserName(context),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _privateAndPublic(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                height: 32,
                width: 32,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  value: widget.services.store.keepPrivate,
                  onChanged: (i) {
                    widget.services.store.keepPrivate = i!;
                    widget.services.store.updateSettings();
                  },
                  fillColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
              ),
              const SizedBox(width: 4),
              const Text('Keep Private'),
            ],
          ),
        ),
        // Expanded(
        //   child: Row(
        //     children: [
        //       SizedBox(
        //         height: 32,
        //         width: 32,
        //         child: Checkbox(
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(4),
        //           ),
        //           value: widget.services.store.makePublic,
        //           onChanged: (i) {
        //             widget.services.store.makePublic = i!;
        //             widget.services.store.updateSettings();
        //           },
        //           fillColor:
        //               MaterialStateProperty.all(Theme.of(context).primaryColor),
        //         ),
        //       ),
        //       const SizedBox(width: 4),
        //       const Text('Make Public'),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget _familyAndFriends(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                height: 32,
                width: 32,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  value: widget.services.store.family,
                  onChanged: (i) {
                    widget.services.store.family = i!;
                    widget.services.store.updateSettings();
                  },
                  fillColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
              ),
              const SizedBox(width: 4),
              const Text('Family'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                height: 32,
                width: 32,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  value: widget.services.store.friends,
                  onChanged: (i) {
                    widget.services.store.friends = i!;
                    widget.services.store.updateSettings();
                  },
                  fillColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
              ),
              const SizedBox(width: 4),
              const Text('Friends'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _visibleUserName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                height: 32,
                width: 32,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  value: widget.services.store.visibleUserName,
                  onChanged: (i) {
                    widget.services.store.visibleUserName = i!;
                    widget.services.store.updateSettings();
                  },
                  fillColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
              ),
              const SizedBox(width: 4),
              const Text('Visible user name on location pin'),
            ],
          ),
        ),
      ],
    );
  }
}
