// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'api_utils/api_provider.dart' as _i14;
import 'api_utils/device_id_provider.dart' as _i61;
import 'api_utils/user_provider.dart' as _i43;
import 'config/api_settings.dart' as _i3;
import 'data/stores/add_new_happy_place_store.dart' as _i35;
import 'data/stores/add_people_store.dart' as _i36;
import 'data/stores/change_password_store.dart' as _i13;
import 'data/stores/dashboard_store.dart' as _i5;
import 'data/stores/edit_profile_store.dart' as _i15;
import 'data/stores/explore/explore_store.dart' as _i16;
import 'data/stores/forgot_password_store.dart' as _i17;
import 'data/stores/home_store.dart' as _i18;
import 'data/stores/how_are_you_generic_store.dart' as _i19;
import 'data/stores/login_store.dart' as _i20;
import 'data/stores/my_happiness_store.dart' as _i21;
import 'data/stores/my_places_stores/add_place_store.dart' as _i37;
import 'data/stores/my_places_stores/my_places_store.dart' as _i22;
import 'data/stores/my_places_stores/select_friend_share_post_store.dart'
    as _i26;
import 'data/stores/my_places_stores/share_post_store.dart' as _i29;
import 'data/stores/my_places_stores/view_posts_store.dart' as _i33;
import 'data/stores/navigation_store.dart' as _i12;
import 'data/stores/notification_store.dart' as _i23;
import 'data/stores/places_history/places_history_store.dart' as _i24;
import 'data/stores/profile_store.dart' as _i44;
import 'data/stores/requests_store.dart' as _i25;
import 'data/stores/settings_store.dart' as _i28;
import 'data/stores/signup_store.dart' as _i30;
import 'data/stores/test_store.dart' as _i32;
import 'data/stores/were_your_needs_met_store.dart' as _i34;
import 'ui/add_new_happy_place/add_new_happy_place.dart' as _i58;
import 'ui/add_new_happy_place/how_are_you_generic.dart' as _i45;
import 'ui/add_new_happy_place/were_your_needs_met.dart' as _i57;
import 'ui/authentication/forgot_password_page.dart' as _i41;
import 'ui/authentication/login_page.dart' as _i46;
import 'ui/authentication/signup_page.dart' as _i31;
import 'ui/dashboard/dashboard_page.dart' as _i11;
import 'ui/explore/explore_page.dart' as _i40;
import 'ui/home/home_page.dart' as _i42;
import 'ui/home/profile_completion.dart' as _i4;
import 'ui/my_happiness/my_happiness_page.dart' as _i47;
import 'ui/my_happiness/test_page.dart' as _i55;
import 'ui/my_places/add_place_page.dart' as _i60;
import 'ui/my_places/filters_page.dart' as _i6;
import 'ui/my_places/my_places_page.dart' as _i48;
import 'ui/my_places/select_friends_share_page.dart' as _i27;
import 'ui/my_places/share_post_page.dart' as _i54;
import 'ui/my_places/view_posts_page.dart' as _i56;
import 'ui/places_history/places_history_page.dart' as _i50;
import 'ui/places_history/view_note_page.dart' as _i10;
import 'ui/profile/add_people.dart' as _i59;
import 'ui/profile/change_password_page.dart' as _i38;
import 'ui/profile/edit_profile_page.dart' as _i39;
import 'ui/profile/profile_page.dart' as _i51;
import 'ui/profile/requests_page.dart' as _i52;
import 'ui/settings/information_page.dart' as _i7;
import 'ui/settings/notification_page.dart' as _i49;
import 'ui/settings/settings_page.dart' as _i53;
import 'ui/terms_and_privacy_policy/terms_and_privacy_policy.dart' as _i9;

const String _sandbox = 'sandbox';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.factory<_i3.ApiSettings>(() => _i3.SandboxApiSettings(),
      registerFor: {_sandbox});
  gh.factory<_i3.ApiSettings>(() => _i3.DevApiSettings(), registerFor: {_dev});
  gh.factory<_i3.ApiSettings>(() => _i3.ProdApiSettings(),
      registerFor: {_prod});
  gh.factoryParam<_i4.CompleteProfilePage, _i4.CompleteProfilePageParams?,
          dynamic>(
      (params, _) => _i4.CompleteProfilePage(
          params: params, services: get<_i4.CompleteProfileServices>()));
  gh.factory<_i4.CompleteProfileServices>(() => _i4.CompleteProfileServices());
  gh.factory<_i5.DashboardStore>(() => _i5.DashboardStore());
  gh.factoryParam<_i6.FiltersPage, _i6.FiltersPageParams?, dynamic>(
      (params, _) => _i6.FiltersPage(params: params));
  gh.factoryParam<_i7.InformationPage, _i7.InformationPageParams?, dynamic>(
      (params, _) => _i7.InformationPage(params: params));
  await gh.factoryAsync<_i8.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true);
  gh.factory<_i9.TermsAndPrivacyPolicyPageServices>(
      () => _i9.TermsAndPrivacyPolicyPageServices());
  gh.factoryParam<_i10.ViewNotePage, _i10.ViewNotePageParams?, dynamic>(
      (params, _) => _i10.ViewNotePage(params: params));
  gh.factory<_i11.DashboardServices>(() => _i11.DashboardServices(
      store: get<_i5.DashboardStore>(),
      navigationStore: get<_i12.NavigationStore>()));
  gh.factoryParam<_i9.TermsAndPrivacyPolicyPage,
          _i9.TermsAndPrivacyPolicyPageParams?, dynamic>(
      (params, _) => _i9.TermsAndPrivacyPolicyPage(
          params: params,
          services: get<_i9.TermsAndPrivacyPolicyPageServices>()));
  gh.factory<_i13.ChangePasswordStore>(
      () => _i13.ChangePasswordStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factoryParam<_i11.DashboardPage, _i11.DashboardParams?, dynamic>(
      (params, _) => _i11.DashboardPage(
          params: params, services: get<_i11.DashboardServices>()));
  gh.factory<_i15.EditProfileStore>(
      () => _i15.EditProfileStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i16.ExploreStore>(
      () => _i16.ExploreStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i17.ForgotPasswordStore>(
      () => _i17.ForgotPasswordStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i18.HomeStore>(
      () => _i18.HomeStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i19.HowAreYouGenericStore>(
      () => _i19.HowAreYouGenericStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i20.LoginStore>(
      () => _i20.LoginStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i21.MyHappinessStore>(
      () => _i21.MyHappinessStore(get<_i14.ApiProvider>()));
  gh.factory<_i22.MyPlacesStore>(
      () => _i22.MyPlacesStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i23.NotificationStore>(
      () => _i23.NotificationStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i24.PlacesHistoryStore>(
      () => _i24.PlacesHistoryStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i25.RequestsStore>(
      () => _i25.RequestsStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i26.SelectFriendSharePostStore>(() =>
      _i26.SelectFriendSharePostStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i27.SelectFriendsServices>(() => _i27.SelectFriendsServices(
      store: get<_i26.SelectFriendSharePostStore>()));
  gh.factory<_i28.SettingsStore>(
      () => _i28.SettingsStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i29.SharePostStore>(
      () => _i29.SharePostStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i30.SignupStore>(
      () => _i30.SignupStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i31.SingupPageServices>(
      () => _i31.SingupPageServices(store: get<_i30.SignupStore>()));
  gh.factory<_i32.TestStore>(() => _i32.TestStore(get<_i14.ApiProvider>()));
  gh.factory<_i33.ViewPostsStore>(
      () => _i33.ViewPostsStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i34.WereYourNeedsMetStore>(
      () => _i34.WereYourNeedsMetStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i35.AddNewHappyPlaceStore>(
      () => _i35.AddNewHappyPlaceStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i36.AddPeopleStore>(
      () => _i36.AddPeopleStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i37.AddPlaceStore>(
      () => _i37.AddPlaceStore(apiProvider: get<_i14.ApiProvider>()));
  gh.factory<_i38.ChangePasswordPageServices>(() =>
      _i38.ChangePasswordPageServices(store: get<_i13.ChangePasswordStore>()));
  gh.factory<_i39.EditProfilePageServices>(
      () => _i39.EditProfilePageServices(store: get<_i15.EditProfileStore>()));
  gh.factory<_i40.ExploreServices>(
      () => _i40.ExploreServices(store: get<_i16.ExploreStore>()));
  gh.factory<_i41.ForgotPasswordPageServices>(() =>
      _i41.ForgotPasswordPageServices(store: get<_i17.ForgotPasswordStore>()));
  gh.factory<_i42.HomePageServices>(() => _i42.HomePageServices(
      userProvider: get<_i43.UserProvider>(),
      navigationStore: get<_i12.NavigationStore>(),
      profileStore: get<_i44.ProfileStore>()));
  gh.factory<_i45.HowAreYouGenericPageServices>(() =>
      _i45.HowAreYouGenericPageServices(
          store: get<_i19.HowAreYouGenericStore>()));
  gh.factory<_i46.LoginPageServices>(
      () => _i46.LoginPageServices(loginStore: get<_i20.LoginStore>()));
  gh.factory<_i47.MyHappinessPageServices>(
      () => _i47.MyHappinessPageServices(store: get<_i21.MyHappinessStore>()));
  gh.factory<_i48.MyPlacesServices>(
      () => _i48.MyPlacesServices(store: get<_i22.MyPlacesStore>()));
  gh.factory<_i49.NotificationPageServices>(() =>
      _i49.NotificationPageServices(store: get<_i23.NotificationStore>()));
  gh.factory<_i50.PlacesHistoryPageServices>(() =>
      _i50.PlacesHistoryPageServices(store: get<_i24.PlacesHistoryStore>()));
  gh.factory<_i51.ProfilePageServices>(
      () => _i51.ProfilePageServices(store: get<_i44.ProfileStore>()));
  gh.factory<_i52.RequestsPageServices>(
      () => _i52.RequestsPageServices(store: get<_i25.RequestsStore>()));
  gh.factoryParam<_i27.SelectFriendsPage, _i27.SelectFriendsParams?, dynamic>(
      (params, _) => _i27.SelectFriendsPage(
          params: params, services: get<_i27.SelectFriendsServices>()));
  gh.factory<_i53.SettingsPageServices>(
      () => _i53.SettingsPageServices(store: get<_i28.SettingsStore>()));
  gh.factory<_i54.SharePostServices>(
      () => _i54.SharePostServices(store: get<_i29.SharePostStore>()));
  gh.factoryParam<_i31.SignUpPage, _i31.SingupPageParams?, dynamic>(
      (params, _) => _i31.SignUpPage(
          params: params, services: get<_i31.SingupPageServices>()));
  gh.factory<_i55.TestPageServices>(
      () => _i55.TestPageServices(store: get<_i32.TestStore>()));
  gh.factory<_i56.ViewPostsServices>(
      () => _i56.ViewPostsServices(store: get<_i33.ViewPostsStore>()));
  gh.factory<_i57.WereYourNeedsMetPageServices>(() =>
      _i57.WereYourNeedsMetPageServices(
          store: get<_i34.WereYourNeedsMetStore>()));
  gh.factory<_i58.AddNewHappyPlacePageServices>(() =>
      _i58.AddNewHappyPlacePageServices(
          store: get<_i35.AddNewHappyPlaceStore>()));
  gh.factory<_i59.AddPeoplePageServices>(
      () => _i59.AddPeoplePageServices(store: get<_i36.AddPeopleStore>()));
  gh.factory<_i60.AddPlaceServices>(
      () => _i60.AddPlaceServices(store: get<_i37.AddPlaceStore>()));
  gh.factoryParam<_i38.ChangePasswordPage, _i38.ChangePasswordPageParams?,
          dynamic>(
      (params, _) => _i38.ChangePasswordPage(
          params: params, services: get<_i38.ChangePasswordPageServices>()));
  gh.factoryParam<_i39.EditProfilePage, _i39.EditProfilePageParams?, dynamic>(
      (params, _) => _i39.EditProfilePage(
          params: params, services: get<_i39.EditProfilePageServices>()));
  gh.factoryParam<_i40.ExplorePage, _i40.ExplorePageParams?, dynamic>((params,
          _) =>
      _i40.ExplorePage(params: params, services: get<_i40.ExploreServices>()));
  gh.factoryParam<_i41.ForgotPasswordPage, _i41.ForgotPasswordPageParams?,
          dynamic>(
      (params, _) => _i41.ForgotPasswordPage(
          params: params, services: get<_i41.ForgotPasswordPageServices>()));
  gh.factoryParam<_i42.HomePage, _i42.HomePageParams?, dynamic>((params, _) =>
      _i42.HomePage(params: params, services: get<_i42.HomePageServices>()));
  gh.factoryParam<_i45.HowAreYouGenericPage, _i45.HowAreYouGenericPageParams?,
          dynamic>(
      (params, _) => _i45.HowAreYouGenericPage(
          params: params, services: get<_i45.HowAreYouGenericPageServices>()));
  gh.factoryParam<_i46.LoginPage, _i46.LoginPageParams?, dynamic>((params, _) =>
      _i46.LoginPage(params: params, services: get<_i46.LoginPageServices>()));
  gh.factoryParam<_i47.MyHappinessPage, _i47.MyHappinessPageParams?, dynamic>(
      (params, _) => _i47.MyHappinessPage(
          params: params, services: get<_i47.MyHappinessPageServices>()));
  gh.factoryParam<_i48.MyPlacesPage, _i48.MyPlacesParams?, dynamic>(
      (params, _) => _i48.MyPlacesPage(
          params: params, services: get<_i48.MyPlacesServices>()));
  gh.factoryParam<_i49.NotificationPage, _i49.NotificationPageParams?, dynamic>(
      (params, _) => _i49.NotificationPage(
          params: params, services: get<_i49.NotificationPageServices>()));
  gh.factoryParam<_i50.PlacesHistoryPage, _i50.PlaceHistoryPageParams?,
          dynamic>(
      (params, _) => _i50.PlacesHistoryPage(
          params: params, services: get<_i50.PlacesHistoryPageServices>()));
  gh.factoryParam<_i51.ProfilePage, _i51.ProfilePageParams?, dynamic>(
      (params, _) => _i51.ProfilePage(
          params: params, services: get<_i51.ProfilePageServices>()));
  gh.factoryParam<_i52.RequestsPage, _i52.RequestsPageParams?, dynamic>(
      (params, _) => _i52.RequestsPage(
          params: params, services: get<_i52.RequestsPageServices>()));
  gh.factoryParam<_i53.SettingsPage, _i53.SettingsPageParams?, dynamic>(
      (params, _) => _i53.SettingsPage(
          params: params, services: get<_i53.SettingsPageServices>()));
  gh.factoryParam<_i54.SharePostPage, _i54.SharePostParams?, dynamic>(
      (params, _) => _i54.SharePostPage(
          params: params, services: get<_i54.SharePostServices>()));
  gh.factoryParam<_i55.TestPage, _i55.TestPageParams?, dynamic>((params, _) =>
      _i55.TestPage(params: params, services: get<_i55.TestPageServices>()));
  gh.factoryParam<_i56.ViewPostsPage, _i56.ViewPostsParams?, dynamic>(
      (params, _) => _i56.ViewPostsPage(
          params: params, services: get<_i56.ViewPostsServices>()));
  gh.factoryParam<_i57.WereYourNeedsMetPage, _i57.WereYourNeedsMetPageParams?,
          dynamic>(
      (params, _) => _i57.WereYourNeedsMetPage(
          params: params, services: get<_i57.WereYourNeedsMetPageServices>()));
  gh.factoryParam<_i58.AddNewHappyPlacePage, _i58.AddNewHappyPlacePageParams?,
          dynamic>(
      (params, _) => _i58.AddNewHappyPlacePage(
          params: params, services: get<_i58.AddNewHappyPlacePageServices>()));
  gh.factoryParam<_i59.AddPeoplePage, _i59.AddPeoplePageParams?, dynamic>(
      (params, _) => _i59.AddPeoplePage(
          params: params, services: get<_i59.AddPeoplePageServices>()));
  gh.factoryParam<_i60.AddPlacePage, _i60.AddPlaceParams?, dynamic>(
      (params, _) => _i60.AddPlacePage(
          params: params, services: get<_i60.AddPlaceServices>()));
  gh.singleton<_i12.NavigationStore>(_i12.NavigationStore());
  gh.singleton<_i61.DeviceIdProvider>(
      _i61.DeviceIdProvider(get<_i8.SharedPreferences>()));
  await gh.singletonAsync<_i43.UserProvider>(
      () => _i43.UserProvider.create(
          get<_i8.SharedPreferences>(), get<_i61.DeviceIdProvider>()),
      preResolve: true);
  gh.singleton<_i14.ApiProvider>(_i14.ApiProvider(
      apiSettings: get<_i3.ApiSettings>(),
      userProvider: get<_i43.UserProvider>()));
  gh.singleton<_i44.ProfileStore>(
      _i44.ProfileStore(apiProvider: get<_i14.ApiProvider>()));
  return get;
}

class _$SharedPreferencesModule extends _i43.SharedPreferencesModule {}
