import 'package:happy_place/api_utils/api_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

@injectable
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final ApiProvider apiProvider;
  _HomeStore({
    required this.apiProvider,
  });
  String? errorMessage;
  @observable
  bool isLoading = false;

  @observable
  int error = 1;
}
