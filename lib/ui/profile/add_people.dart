import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/add_people_store.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/debouncer.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:happy_place/ui/widgets/rounded_border_image.dart';
import 'package:injectable/injectable.dart';

class AddPeoplePageParams {
  const AddPeoplePageParams(this.key);
  final Key key;
}

@injectable
class AddPeoplePageServices {
  AddPeopleStore store;
  AddPeoplePageServices({
    required this.store,
  });
}

@injectable
class AddPeoplePage extends StatefulWidget {
  final AddPeoplePageServices services;
  final AddPeoplePageParams? params;
  AddPeoplePage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<AddPeoplePage> createState() => _AddPeoplePageState();
}

class _AddPeoplePageState extends State<AddPeoplePage> {
  TextEditingController textController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add People'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            _searchBar(),
            const SizedBox(height: 24),
            _results(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return TextFormField(
      onChanged: (s) {
        _debouncer.run(() {
          if (s.isNotEmpty) {
            widget.services.store.searchPeople(s);
          }
        });
      },
      controller: textController,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
          ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Colors.grey,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
      ),
    );
  }

  Widget _results() {
    return Observer(builder: (context) {
      if (widget.services.store.searchingPeople) {
        return const Center(child: Loader());
      }
      if (widget.services.store.users.isEmpty) {
        return const Center(child: Text('No Users'));
      }

      return Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.services.store.users.length,
            itemBuilder: (context, index) {
              return _listItem(widget.services.store.users[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
          SizedBox(
            width: 200,
            child: AppButton(
              title: 'Done',
              verticalPadding: 12,
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 100),
        ],
      );
    });
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
          widget.services.store.sendFriendOrFamilyRequest(
              userId: int.parse(user.id!), addAsFriend: false);
        },
        child: Chip(
          label: const Text(
            'Family',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      const SizedBox(width: 8),
      GestureDetector(
        onTap: () {
          widget.services.store.sendFriendOrFamilyRequest(
              userId: int.parse(user.id!), addAsFriend: true);
        },
        child: Chip(
          label: const Text(
            'Friends',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      )
    ]);
  }
}
