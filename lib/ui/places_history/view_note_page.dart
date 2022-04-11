import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

class ViewNotePageParams {
  final String note;
  final String location;
  ViewNotePageParams({
    this.key,
    required this.note,
    required this.location,
  });
  final Key? key;
}

/* 

No store needed on this page
 */

// @injectable
// class ViewNotePageServices {
//   PlacesHistoryStore store;
//   PlacesHistoryPageServices({
//     required this.store,
//   });
// }

@injectable
class ViewNotePage extends StatefulWidget {
  // final PlacesHistoryPageServices services;
  final ViewNotePageParams? params;
  ViewNotePage({
    @factoryParam this.params,
    // required this.services,
  }) : super(key: params?.key);

  @override
  State<ViewNotePage> createState() => _ViewNotePageState();
}

class _ViewNotePageState extends State<ViewNotePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('View Note'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.params!.location,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Text(widget.params!.note),
            ],
          ),
        ),
      ),
    );
  }
}
