import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:happy_place/api_utils/user_provider.dart';
import 'package:happy_place/config/api_settings.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:http/io_client.dart' as http;
import 'package:injectable/injectable.dart';

import 'authentication_interceptor.dart';

@singleton
class ApiProvider {
  ApiProvider({
    required this.apiSettings,
    required this.userProvider,
  }) : apiClient = ApiClient.create(
          ChopperClient(
            interceptors: [
              AuthenticationInterceptor(
                apiSettings.apiKey,
                () => userProvider.user?.accessToken ?? 'not found',
              ),
              HttpLoggingInterceptor(),
            ],
            converter: $JsonSerializableConverter(),
            errorConverter: $JsonSerializableConverter(),
            baseUrl: apiSettings.endpoint,
            client: http.IOClient(
              HttpClient()..connectionTimeout = const Duration(seconds: 30),
            ),
          ),
        );

  ApiSettings apiSettings;
  UserProvider userProvider;

  ApiClient apiClient;
}
