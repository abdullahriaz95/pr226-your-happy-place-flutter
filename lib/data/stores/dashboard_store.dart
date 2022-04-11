import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

@injectable
class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  String? errorMessage;
  @observable
  bool isLoading = false;

  @observable
  int error = 1;
}
