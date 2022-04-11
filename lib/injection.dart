import 'package:get_it/get_it.dart';
import 'package:happy_place/injection.config.dart';
import 'package:injectable/injectable.dart';

const sandbox = Environment('sandbox');

final getIt = GetIt.I;

@injectableInit
configureInjection(String evironment) {
  return $initGetIt(getIt, environment: evironment);
}
