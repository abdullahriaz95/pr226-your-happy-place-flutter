
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/requests_store.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:happy_place/ui/widgets/rounded_border_image.dart';
import 'package:injectable/injectable.dart';

class RequestsPageParams {
  const RequestsPageParams(this.key);
  final Key key;
}

@injectable
class RequestsPageServices {
  RequestsStore store;
  RequestsPageServices({
    required this.store,
  });
}

@injectable
class RequestsPage extends StatefulWidget {
  final RequestsPageServices services;
  final RequestsPageParams? params;
  RequestsPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Friends Requests'),
        centerTitle: true,
      ),
      body: Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: widget.services.store.isLoading
              ? const Loader()
              : widget.services.store.users.isEmpty
                  ? const Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('No Requests'),
                      ),
                    )
                  : ListView.separated(
                      itemCount: widget.services.store.users.length,
                      itemBuilder: (context, index) {
                        return _listItem(widget.services.store.users[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
        );
      }),
    );
  }

  Widget _listItem(User user) {
    return Row(children: [
      RoundedBorderBoxImage(
        size: 40,
        borderRadius: 40,
        profileUrl: user.avatarUrl,
      ),
      const SizedBox(width: 8),
      Expanded(child: Text(user.fullName!)),
      const SizedBox(width: 8),
      GestureDetector(
        onTap: () {
          widget.services.store.acceptRequest(int.parse(user.id!));
        },
        child: Chip(
          label: const Text(
            'Accept',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      const SizedBox(width: 8),
      GestureDetector(
        onTap: () {
          widget.services.store.rejectRequest(int.parse(user.id!));
        },
        child: const Chip(
          label: Text(
            'Decline',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          backgroundColor: Colors.red,
        ),
      )
    ]);
  }
}
