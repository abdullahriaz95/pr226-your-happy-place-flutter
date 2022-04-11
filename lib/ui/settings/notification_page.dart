
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/notification_store.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class NotificationPageParams {
  NotificationPageParams({
    this.key,
  });
  final Key? key;
}

@injectable
class NotificationPageServices {
  NotificationStore store;
  NotificationPageServices({
    required this.store,
  });
}

@injectable
class NotificationPage extends StatefulWidget {
  final NotificationPageServices services;
  final NotificationPageParams? params;
  NotificationPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 32,
        ),
        child: Observer(builder: (context) {
          if (widget.services.store.isLoading) {
            return const Loader();
          }
          return _list();
        }),
      ),
    );
  }

  Widget _list() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
      itemCount: 5,
      itemBuilder: (context, index) {
        return _listItem();
      },
    );
  }

  Widget _listItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification Title',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Notification description which goes for multiple lines. lorem ipusm ...',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '25/Jan/2022',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                ),
                const SizedBox(width: 16),
                Text(
                  '5:30 PM',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
