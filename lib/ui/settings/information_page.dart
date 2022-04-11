import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/data/models/information_response.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class InformationPageParams {
  InformationPageParams({
    this.key,
  });
  final Key? key;
}

// @injectable
// class ViewNotePageServices {
//   PlacesHistoryStore store;
//   PlacesHistoryPageServices({
//     required this.store,
//   });
// }

@injectable
class InformationPage extends StatefulWidget {
  // final PlacesHistoryPageServices services;
  final InformationPageParams? params;
  InformationPage({
    @factoryParam this.params,
    // required this.services,
  }) : super(key: params?.key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Information'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 32,
          ),
          child: FutureBuilder<Response<SuccessResponse>>(
              future: getIt<ApiProvider>()
                  .apiClient
                  .settingsKeyGet(key: 'APP_INFO'),
              builder:
                  (context, AsyncSnapshot<Response<SuccessResponse>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null) {
                    Response<SuccessResponse>? response = snapshot.data!;
                    InformationResponse ir = InformationResponse.fromJson(
                        response.body!.payload! as Map<String, dynamic>);
                    return Text((ir.value).toString());
                  } 
                } else {
                  return const Center(
                    child: Loader(),
                  );
                }
                return const SizedBox();
              }),
        ),
      ),
    );
  }
}
