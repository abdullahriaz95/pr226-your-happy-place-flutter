// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiClient extends ApiClient {
  _$ApiClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiClient;

  @override
  Future<Response<AuthRegisterResponse>> registerPost(
      {String? accept,
      required String? deviceId,
      required String? deviceType,
      String? devicePushToken,
      String? firstName,
      String? lastName,
      num? genderId,
      String? ageGroup,
      required String? email,
      String? address,
      String? latitude,
      String? longitude,
      String? username,
      required String? password,
      String? passwordConfirmation}) {
    final $url = '/register';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'device_id': deviceId,
      'device_type': deviceType,
      'device_push_token': devicePushToken,
      'first_name': firstName,
      'last_name': lastName,
      'gender_id': genderId,
      'age_group': ageGroup,
      'email': email,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'username': username,
      'password': password,
      'password_confirmation': passwordConfirmation
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<AuthRegisterResponse, AuthRegisterResponse>($request);
  }

  @override
  Future<Response<AuthLoginResponse>> loginPost(
      {String? accept,
      required String? deviceId,
      required String? deviceType,
      String? devicePushToken,
      required String? email,
      required String? password}) {
    final $url = '/login';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'device_id': deviceId,
      'device_type': deviceType,
      'device_push_token': devicePushToken,
      'email': email,
      'password': password
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<AuthLoginResponse, AuthLoginResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> passwordEmailPost(
      {String? accept, required String? email}) {
    final $url = '/password/email';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'email': email};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }

  @override
  Future<Response<AuthSocialLoginResponse>> loginSocialPost(
      {String? accept, required String? provider, required String? token}) {
    final $url = '/login/social';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'provider': provider, 'token': token};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<AuthSocialLoginResponse, AuthSocialLoginResponse>($request);
  }

  @override
  Future<Response<SettingsGetSettingsResponse>> settingsGet({String? accept}) {
    final $url = '/settings';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<SettingsGetSettingsResponse,
        SettingsGetSettingsResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> logoutGet({String? accept}) {
    final $url = '/logout';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }

  @override
  Future<Response<ProfileMyProfileResponse>> profileGet({String? accept}) {
    final $url = '/profile';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<ProfileMyProfileResponse, ProfileMyProfileResponse>($request);
  }

  @override
  Future<Response<ProfileUpdateMyProfileResponse>> profilePut(
      {required String? firstName,
      String? lastName,
      required String? email,
      String? phone,
      String? description,
      required num? genderId,
      required String? ageGroup,
      required String? address,
      required String? latitude,
      required String? longitude,
      required String? username,
      int? postsKeepPrivate,
      int? postsWithPublic,
      int? postsWithFamily,
      int? postsWithFriends,
      int? visibleUsername,
      String? accept}) {
    final $url = '/profile';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'description': description,
      'gender_id': genderId,
      'age_group': ageGroup,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'username': username,
      'posts_keep_private': postsKeepPrivate,
      'posts_with_public': postsWithPublic,
      'posts_with_family': postsWithFamily,
      'posts_with_friends': postsWithFriends,
      'visible_username': visibleUsername
    };
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ProfileUpdateMyProfileResponse,
        ProfileUpdateMyProfileResponse>($request);
  }

  @override
  Future<Response<ProfileMyFriendsResponse>> friendsGet({String? accept}) {
    final $url = '/friends';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<ProfileMyFriendsResponse, ProfileMyFriendsResponse>($request);
  }

  @override
  Future<Response<ProfileMyFamilyResponse>> familyGet({String? accept}) {
    final $url = '/family';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<ProfileMyFamilyResponse, ProfileMyFamilyResponse>($request);
  }

  @override
  Future<Response<ProfileMyFriendRequestsResponse>> friendRequestsGet(
      {String? accept}) {
    final $url = '/friend-requests';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<ProfileMyFriendRequestsResponse,
        ProfileMyFriendRequestsResponse>($request);
  }

  @override
  Future<Response<ProfileMyFamilyRequestsResponse>> familyRequestsGet(
      {String? accept}) {
    final $url = '/family-requests';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<ProfileMyFamilyRequestsResponse,
        ProfileMyFamilyRequestsResponse>($request);
  }

  @override
  Future<Response<ProfileHideProfileUpdateMessageResponse>>
      profileCompleteProfileRememberPut({String? accept}) {
    final $url = '/profile/complete-profile-remember';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('PUT', $url, client.baseUrl, headers: $headers);
    return client.send<ProfileHideProfileUpdateMessageResponse,
        ProfileHideProfileUpdateMessageResponse>($request);
  }

  @override
  Future<Response<ProfileUpdateMyProfileSettingsResponse>> profileSettingsPut(
      {int? postsKeepPrivate,
      int? postsWithPublic,
      int? postsWithFamily,
      int? postsWithFriends,
      int? visibleUsername,
      String? accept}) {
    final $url = '/profile/settings';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'posts_keep_private': postsKeepPrivate,
      'posts_with_public': postsWithPublic,
      'posts_with_family': postsWithFamily,
      'posts_with_friends': postsWithFriends,
      'visible_username': visibleUsername
    };
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ProfileUpdateMyProfileSettingsResponse,
        ProfileUpdateMyProfileSettingsResponse>($request);
  }

  @override
  Future<Response<ProfileUpdateMyAvatarResponse>> avatarPost(
      {required List<String>? image, String? accept}) {
    final $url = '/avatar';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'image': image};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ProfileUpdateMyAvatarResponse,
        ProfileUpdateMyAvatarResponse>($request);
  }

  @override
  Future<Response<ProfileUpdateMyCoverImageResponse>> coverPost(
      {required List<String>? image, String? accept}) {
    final $url = '/cover';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'image': image};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ProfileUpdateMyCoverImageResponse,
        ProfileUpdateMyCoverImageResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> passwordEditPost(
      {required String? password,
      required String? currentPassword,
      required String? passwordConfirmation,
      String? accept}) {
    final $url = '/password/edit';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'password': password,
      'current_password': currentPassword,
      'password_confirmation': passwordConfirmation
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }

  @override
  Future<Response<MoodsListResponse>> moodsGet({String? accept}) {
    final $url = '/moods';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<MoodsListResponse, MoodsListResponse>($request);
  }

  @override
  Future<Response<MoodsViewResponse>> moodsIdGet(
      {String? accept, required String? id}) {
    final $url = '/moods/$id';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<MoodsViewResponse, MoodsViewResponse>($request);
  }

  @override
  Future<Response<MoodsTypesResponse>> moodsIdTypesGet(
      {String? accept, required int? id}) {
    final $url = '/moods/$id/types';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<MoodsTypesResponse, MoodsTypesResponse>($request);
  }

  @override
  Future<Response<PlacesListResponse>> placesGet({String? accept}) {
    final $url = '/places';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<PlacesListResponse, PlacesListResponse>($request);
  }

  @override
  Future<Response<PlacesViewResponse>> placesIdGet(
      {String? accept, required String? id}) {
    final $url = '/places/$id';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<PlacesViewResponse, PlacesViewResponse>($request);
  }

  @override
  Future<Response<PlacesTypesResponse>> placesIdTypesGet(
      {String? accept, required int? id}) {
    final $url = '/places/$id/types';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<PlacesTypesResponse, PlacesTypesResponse>($request);
  }

  @override
  Future<Response<ActivitiesListResponse>> activitiesGet({String? accept}) {
    final $url = '/activities';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<ActivitiesListResponse, ActivitiesListResponse>($request);
  }

  @override
  Future<Response<ActivitiesViewResponse>> activitiesIdGet(
      {String? accept, required String? id}) {
    final $url = '/activities/$id';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<ActivitiesViewResponse, ActivitiesViewResponse>($request);
  }

  @override
  Future<Response<ActivitiesTypesResponse>> activitiesIdTypesGet(
      {String? accept, required int? id}) {
    final $url = '/activities/$id/types';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client
        .send<ActivitiesTypesResponse, ActivitiesTypesResponse>($request);
  }

  @override
  Future<Response<FeelingsListResponse>> feelingsGet({String? accept}) {
    final $url = '/feelings';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<FeelingsListResponse, FeelingsListResponse>($request);
  }

  @override
  Future<Response<FeelingsViewResponse>> feelingsIdGet(
      {String? accept, required String? id}) {
    final $url = '/feelings/$id';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<FeelingsViewResponse, FeelingsViewResponse>($request);
  }

  @override
  Future<Response<FeelingsTypesResponse>> feelingsIdTypesGet(
      {String? accept, required int? id}) {
    final $url = '/feelings/$id/types';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<FeelingsTypesResponse, FeelingsTypesResponse>($request);
  }

  @override
  Future<Response<FeelingsListRatingsResponse>> feelingRatingsGet(
      {String? accept}) {
    final $url = '/feeling-ratings';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<FeelingsListRatingsResponse,
        FeelingsListRatingsResponse>($request);
  }

  @override
  Future<Response<VisitedPlacesListResponse>> visitedPlacesGet(
      {String? accept,
      required String? q,
      int? userId,
      int? placeId,
      int? placeTypeId,
      int? feelingRating,
      String? startDate,
      String? endDate,
      String? moodId,
      String? activityId,
      String? longitude,
      String? latitude,
      String? radius}) {
    final $url = '/visited-places';
    final $params = <String, dynamic>{
      'q': q,
      'user_id': userId,
      'place_id': placeId,
      'place_type_id': placeTypeId,
      'feeling_rating': feelingRating,
      'start_date': startDate,
      'end_date': endDate,
      'mood_id': moodId,
      'activity_id': activityId,
      'longitude': longitude,
      'latitude': latitude,
      'radius': radius
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client
        .send<VisitedPlacesListResponse, VisitedPlacesListResponse>($request);
  }

  @override
  Future<Response<VisitedPlacesSaveResponse>> visitedPlacesPost(
      {String? accept,
      required String? location,
      required String? latitude,
      required String? longitude,
      required int? moodId,
      required int? moodTypeId,
      required int? placeId,
      required int? placeTypeId,
      required int? activityId,
      required int? activityTypeId,
      required int? feelingId,
      int? feelingTypeId,
      int? feelingRating,
      String? feelingNote}) {
    final $url = '/visited-places';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'mood_id': moodId,
      'mood_type_id': moodTypeId,
      'place_id': placeId,
      'place_type_id': placeTypeId,
      'activity_id': activityId,
      'activity_type_id': activityTypeId,
      'feeling_id': feelingId,
      'feeling_type_id': feelingTypeId,
      'feeling_rating': feelingRating,
      'feeling_note': feelingNote
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<VisitedPlacesSaveResponse, VisitedPlacesSaveResponse>($request);
  }

  @override
  Future<Response<VisitedPlacesSaveFeelingResponse>>
      visitedPlacesIdFeelingsPost(
          {required int? id,
          int? feelingRating,
          String? feelingNote,
          String? accept}) {
    final $url = '/visited-places/$id/feelings';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'feeling_rating': feelingRating,
      'feeling_note': feelingNote
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<VisitedPlacesSaveFeelingResponse,
        VisitedPlacesSaveFeelingResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> answersPost(
      {required String? questionAndAnswers, String? accept}) {
    final $url = '/answers';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'question_and_answers': questionAndAnswers};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }

  @override
  Future<Response<MyActivitiesStoreMyActivityLocationResponse>>
      myActivitiesPost(
          {required int? activityId,
          required String? location,
          required String? latitude,
          required String? longitude,
          String? accept}) {
    final $url = '/my-activities';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'activity_id': activityId,
      'location': location,
      'latitude': latitude,
      'longitude': longitude
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<MyActivitiesStoreMyActivityLocationResponse,
        MyActivitiesStoreMyActivityLocationResponse>($request);
  }

  @override
  Future<Response<MyActivitiesSearchResponse>> myActivitiesGet(
      {int? activityId,
      String? latitude,
      String? longitude,
      int? radius,
      int? perPage,
      int? page,
      String? accept}) {
    final $url = '/my-activities';
    final $params = <String, dynamic>{
      'activity_id': activityId,
      'latitude': latitude,
      'longitude': longitude,
      'radius': radius,
      'per_page': perPage,
      'page': page
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client
        .send<MyActivitiesSearchResponse, MyActivitiesSearchResponse>($request);
  }

  @override
  Future<Response<HappynessOptionsListResponse>> happynessOptionsGet(
      {int? perPage, int? page, String? accept}) {
    final $url = '/happyness-options';
    final $params = <String, dynamic>{'per_page': perPage, 'page': page};
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<HappynessOptionsListResponse,
        HappynessOptionsListResponse>($request);
  }

  @override
  Future<Response<HappynessTestsQuestionsResponse>>
      happynessTestsIdQuestionsGet(
          {required String? id, int? perPage, int? page, String? accept}) {
    final $url = '/happyness-tests/$id/questions';
    final $params = <String, dynamic>{'per_page': perPage, 'page': page};
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<HappynessTestsQuestionsResponse,
        HappynessTestsQuestionsResponse>($request);
  }

  @override
  Future<Response<TestResultsGetBigFiveTestResultsResponse>>
      happynessTestsBigfiveResultsGet({String? accept}) {
    final $url = '/happyness-tests/bigfive/results';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<TestResultsGetBigFiveTestResultsResponse,
        TestResultsGetBigFiveTestResultsResponse>($request);
  }

  @override
  Future<Response<TestResultsGetHEXACOTestResultsResponse>>
      happynessTestsHexacoResultsGet({String? accept}) {
    final $url = '/happyness-tests/hexaco/results';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<TestResultsGetHEXACOTestResultsResponse,
        TestResultsGetHEXACOTestResultsResponse>($request);
  }

  @override
  Future<Response<TestResultsGetHappinessTestResultsResponse>>
      happynessTestsHappinessResultsGet({String? accept}) {
    final $url = '/happyness-tests/happiness/results';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<TestResultsGetHappinessTestResultsResponse,
        TestResultsGetHappinessTestResultsResponse>($request);
  }

  @override
  Future<Response<HappynessTestsListResponse>> happynessTestsGet(
      {int? perPage, int? page, String? optionId, String? accept}) {
    final $url = '/happyness-tests';
    final $params = <String, dynamic>{
      'per_page': perPage,
      'page': page,
      'option_id': optionId
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client
        .send<HappynessTestsListResponse, HappynessTestsListResponse>($request);
  }

  @override
  Future<Response<UsersSearchResponse>> usersGet(
      {String? q, int? perPage, int? page, String? accept}) {
    final $url = '/users';
    final $params = <String, dynamic>{
      'q': q,
      'per_page': perPage,
      'page': page
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<UsersSearchResponse, UsersSearchResponse>($request);
  }

  @override
  Future<Response<UsersAgeGroupsResponse>> usersAgeGroupsGet(
      {int? perPage, int? page, String? accept}) {
    final $url = '/users/age-groups';
    final $params = <String, dynamic>{'per_page': perPage, 'page': page};
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client
        .send<UsersAgeGroupsResponse, UsersAgeGroupsResponse>($request);
  }

  @override
  Future<Response<FriendAddFriendOrFamilyResponse>> friendFamilyPost(
      {required int? friendId, required int? relationType, String? accept}) {
    final $url = '/friend-family';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'friend_id': friendId,
      'relation_type': relationType
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<FriendAddFriendOrFamilyResponse,
        FriendAddFriendOrFamilyResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> friendFamilyDelete(
      {required String? friendIds, String? accept}) {
    final $url = '/friend-family';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'friend_ids': friendIds};
    final $request =
        Request('DELETE', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }

  @override
  Future<Response<FriendAcceptFriendOrFamilyRequestResponse>>
      friendFamilyAcceptPut({required int? userId, String? accept}) {
    final $url = '/friend-family/accept';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'user_id': userId};
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<FriendAcceptFriendOrFamilyRequestResponse,
        FriendAcceptFriendOrFamilyRequestResponse>($request);
  }

  @override
  Future<Response<FriendRejectFriendOrFamilyRequestResponse>>
      friendFamilyRejectPut({required int? userId, String? accept}) {
    final $url = '/friend-family/reject';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'user_id': userId};
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<FriendRejectFriendOrFamilyRequestResponse,
        FriendRejectFriendOrFamilyRequestResponse>($request);
  }

  @override
  Future<Response<EntriesIndexEntriesExplorerResponse>> entiresGet(
      {String? accept,
      int? page,
      int? perPage,
      String? lat,
      String? long,
      String? radius,
      String? exploreBy,
      String? moods}) {
    final $url = '/entires';
    final $params = <String, dynamic>{
      'page': page,
      'per_page': perPage,
      'lat': lat,
      'long': long,
      'radius': radius,
      'explore_by': exploreBy,
      'moods': moods
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<EntriesIndexEntriesExplorerResponse,
        EntriesIndexEntriesExplorerResponse>($request);
  }

  @override
  Future<Response<EntriesStoreResponse>> entiresPost(
      {required String? location,
      required String? latitude,
      required String? longitude,
      required int? privacyLevel,
      required String? title,
      required String? postDate,
      required int? moodId,
      required String? note,
      String? imagePaths,
      String? accept}) {
    final $url = '/entires';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'privacy_level': privacyLevel,
      'title': title,
      'post_date': postDate,
      'mood_id': moodId,
      'note': note,
      'image_paths': imagePaths
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<EntriesStoreResponse, EntriesStoreResponse>($request);
  }

  @override
  Future<Response<EntriesListResponse>> entriesGet(
      {String? filter,
      int? page,
      int? perPage,
      String? longitude,
      String? latitude,
      String? radius,
      String? moods,
      String? accept}) {
    final $url = '/entries';
    final $params = <String, dynamic>{
      'filter': filter,
      'page': page,
      'per_page': perPage,
      'longitude': longitude,
      'latitude': latitude,
      'radius': radius,
      'moods': moods
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<EntriesListResponse, EntriesListResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> entriesDelete(
      {required String? idList, String? accept}) {
    final $url = '/entries';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'id_list': idList};
    final $request =
        Request('DELETE', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }

  @override
  Future<Response<EntriesUpdateResponse>> entriesIdPut(
      {required String? id,
      required String? location,
      required String? latitude,
      required String? longitude,
      required int? privacyLevel,
      required String? title,
      required String? postDate,
      required int? moodId,
      String? note,
      String? imagePaths,
      String? accept}) {
    final $url = '/entries/$id';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'privacy_level': privacyLevel,
      'title': title,
      'post_date': postDate,
      'mood_id': moodId,
      'note': note,
      'image_paths': imagePaths
    };
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<EntriesUpdateResponse, EntriesUpdateResponse>($request);
  }

  @override
  Future<Response<EntriesGetSharedPostsResponse>> entriesSharedPostsGet(
      {int? page, int? perPage, String? accept}) {
    final $url = '/entries/shared-posts';
    final $params = <String, dynamic>{'page': page, 'per_page': perPage};
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<EntriesGetSharedPostsResponse,
        EntriesGetSharedPostsResponse>($request);
  }

  @override
  Future<Response<EntriesShareAPostsResponse>> entriesSharePost(
      {required int? sharedTo,
      required int? postId,
      required String? description,
      String? accept}) {
    final $url = '/entries/share';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'shared_to': sharedTo,
      'post_id': postId,
      'description': description
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<EntriesShareAPostsResponse, EntriesShareAPostsResponse>($request);
  }

  @override
  Future<Response<ImageStoreImageResponse>> imagePost(
      {String? accept, required List<String>? image}) {
    final $url = '/image';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{'image': image};
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<ImageStoreImageResponse, ImageStoreImageResponse>($request);
  }

  @override
  Future<Response<MyPlacesAddMyPlaceResponse>> myPlacesPost(
      {required String? location,
      required String? latitude,
      required String? longitude,
      required int? myPlaceCategoryId,
      required int? myPlaceOpinionId,
      required String? note,
      String? accept}) {
    final $url = '/my-places';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'my_place_category_id': myPlaceCategoryId,
      'my_place_opinion_id': myPlaceOpinionId,
      'note': note
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<MyPlacesAddMyPlaceResponse, MyPlacesAddMyPlaceResponse>($request);
  }

  @override
  Future<Response<MyPlacesListResponse>> myPlacesGet(
      {int? perPage,
      int? page,
      int? categoryId,
      int? opinionId,
      String? placeName,
      String? longitude,
      String? latitude,
      String? radius,
      String? accept}) {
    final $url = '/my-places';
    final $params = <String, dynamic>{
      'per_page': perPage,
      'page': page,
      'category_id': categoryId,
      'opinion_id': opinionId,
      'place_name': placeName,
      'longitude': longitude,
      'latitude': latitude,
      'radius': radius
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<MyPlacesListResponse, MyPlacesListResponse>($request);
  }

  @override
  Future<Response<MyPlaceCategoriesMyPlaceCategoriesResponse>>
      myPlacesCategoriesGet(
          {String? accept, required String? page, required String? perPage}) {
    final $url = '/my-places/categories';
    final $params = <String, dynamic>{'page': page, 'per_page': perPage};
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<MyPlaceCategoriesMyPlaceCategoriesResponse,
        MyPlaceCategoriesMyPlaceCategoriesResponse>($request);
  }

  @override
  Future<Response<MyPlacesMyPlaceOpinionsResponse>> myPlacesOpinionsGet(
      {String? accept, required String? page, required String? perPage}) {
    final $url = '/my-places/opinions';
    final $params = <String, dynamic>{'page': page, 'per_page': perPage};
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<MyPlacesMyPlaceOpinionsResponse,
        MyPlacesMyPlaceOpinionsResponse>($request);
  }

  @override
  Future<Response<DiariesStoreResponse>> diariesPost(
      {required String? address,
      required String? latitude,
      required String? longitude,
      required String? eventTime,
      required int? moodId,
      required int? activityId,
      required int? placeId,
      required String? journalEntry,
      String? accept}) {
    final $url = '/diaries';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'event_time': eventTime,
      'mood_id': moodId,
      'activity_id': activityId,
      'place_id': placeId,
      'journal_entry': journalEntry
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<DiariesStoreResponse, DiariesStoreResponse>($request);
  }

  @override
  Future<Response<DiariesListResponse>> diariesGet(
      {int? perPage,
      int? page,
      String? dateFrom,
      String? dateTo,
      String? accept}) {
    final $url = '/diaries';
    final $params = <String, dynamic>{
      'per_page': perPage,
      'page': page,
      'date_from': dateFrom,
      'date_to': dateTo
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<DiariesListResponse, DiariesListResponse>($request);
  }

  @override
  Future<Response<DiariesAverageStatsResponse>> diariesAverageStatsGet(
      {String? accept}) {
    final $url = '/diaries/average-stats';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<DiariesAverageStatsResponse,
        DiariesAverageStatsResponse>($request);
  }

  @override
  Future<Response<DiariesEditResponse>> diariesIdPut(
      {required int? id,
      required String? address,
      required String? latitude,
      required String? longitude,
      required String? eventTime,
      required int? moodId,
      required int? activityId,
      required int? placeId,
      required String? journalEntry,
      String? accept}) {
    final $url = '/diaries/$id';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'event_time': eventTime,
      'mood_id': moodId,
      'activity_id': activityId,
      'place_id': placeId,
      'journal_entry': journalEntry
    };
    final $request =
        Request('PUT', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<DiariesEditResponse, DiariesEditResponse>($request);
  }

  @override
  Future<Response<MyPlacesPinAddMyPersonalityPinResponse>> personalityPinsPost(
      {required String? address,
      required String? latitude,
      required String? longitude,
      required String? describe,
      required int? pinColor,
      String? accept}) {
    final $url = '/personality-pins';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $body = <String, dynamic>{
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'describe': describe,
      'pin_color': pinColor
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<MyPlacesPinAddMyPersonalityPinResponse,
        MyPlacesPinAddMyPersonalityPinResponse>($request);
  }

  @override
  Future<Response<MyPlacesPinListResponse>> personalityPinsGet(
      {int? perPage,
      int? page,
      String? describe,
      String? pinColor,
      String? accept}) {
    final $url = '/personality-pins';
    final $params = <String, dynamic>{
      'per_page': perPage,
      'page': page,
      'describe': describe,
      'pin_color': pinColor
    };
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client
        .send<MyPlacesPinListResponse, MyPlacesPinListResponse>($request);
  }

  @override
  Future<Response<NotificationsIndexResponse>> notificationsGet(
      {int? page,
      int? perPage,
      String? xDeviceId,
      String? xDeviceType,
      String? accept}) {
    final $url = '/notifications';
    final $params = <String, dynamic>{'page': page, 'per_page': perPage};
    final $headers = {
      if (xDeviceId != null) 'x-device-id': xDeviceId,
      if (xDeviceType != null) 'x-device-type': xDeviceType,
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client
        .send<NotificationsIndexResponse, NotificationsIndexResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> notificationsDelete(
      {String? accept, String? xDeviceId, String? xDeviceType}) {
    final $url = '/notifications';
    final $headers = {
      if (accept != null) 'Accept': accept,
      if (xDeviceId != null) 'x-device-id': xDeviceId,
      if (xDeviceType != null) 'x-device-type': xDeviceType,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }

  @override
  Future<Response<NotificationsMarkANotificationAsReadResponse>>
      notificationsUuidMarkAsReadPost(
          {String? accept,
          String? xDeviceId,
          String? xDeviceType,
          required String? uuid}) {
    final $url = '/notifications/$uuid/mark-as-read';
    final $headers = {
      if (accept != null) 'Accept': accept,
      if (xDeviceId != null) 'x-device-id': xDeviceId,
      if (xDeviceType != null) 'x-device-type': xDeviceType,
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<NotificationsMarkANotificationAsReadResponse,
        NotificationsMarkANotificationAsReadResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> notificationsUuidDelete(
      {String? accept,
      required int? uuid,
      String? xDeviceId,
      String? xDeviceType}) {
    final $url = '/notifications/$uuid';
    final $headers = {
      if (accept != null) 'Accept': accept,
      if (xDeviceId != null) 'x-device-id': xDeviceId,
      if (xDeviceType != null) 'x-device-type': xDeviceType,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }

  @override
  Future<Response<SuccessResponse>> settingsKeyGet(
      {required String? key, String? accept}) {
    final $url = '/settings/$key';
    final $headers = {
      if (accept != null) 'Accept': accept,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<SuccessResponse, SuccessResponse>($request);
  }
}
