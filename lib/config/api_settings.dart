import 'package:happy_place/injection.dart';
import 'package:injectable/injectable.dart';

abstract class ApiSettings {
  ApiSettings({
    required this.apiKey,
    required this.endpoint,
  });

  final String apiKey;
  final String endpoint;

  String rewriteHost(String url);
}

@dev
@Injectable(as: ApiSettings)
class DevApiSettings implements ApiSettings {
  @override
  String get apiKey => '123-123-123-123';

  @override
  String get endpoint => 'http://192.168.0.227:6061/api/v1';

  @override
  String rewriteHost(String url) {
    return url.replaceAll('localhost:6061', '192.168.0.227:6061');
  }
}

@sandbox
@Injectable(as: ApiSettings)
class SandboxApiSettings implements ApiSettings {
  @override
  String get apiKey => 'LoS1m8izoJ\$OJySzco0TvUaxowQMUfw';

  @override
  String get endpoint => 'http://newyourhappyplace.sandbox19.preview.cx/api/v1';

  @override
  String rewriteHost(String url) {
    return url;
  }
}

@prod
@Injectable(as: ApiSettings)
class ProdApiSettings implements ApiSettings {
  @override
  String get apiKey => 'TODO';

  @override
  String get endpoint => 'TODO';

  @override
  String rewriteHost(String url) {
    return url;
  }
}
