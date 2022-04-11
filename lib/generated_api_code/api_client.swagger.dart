import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

import 'package:chopper/chopper.dart';
import 'package:chopper/chopper.dart' as chopper;

part 'api_client.swagger.chopper.dart';
part 'api_client.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ApiClient extends ChopperService {
  static ApiClient create([ChopperClient? client]) {
    if (client != null) {
      return _$ApiClient(client);
    }

    final newClient = ChopperClient(
        services: [_$ApiClient()],
        converter: $JsonSerializableConverter(),
        baseUrl: 'https://newyourhappyplace.sandbox19.preview.cx/api/v1');
    return _$ApiClient(newClient);
  }

  ///Register
  ///@param Accept `application/json`
  ///@param device_id Unique ID of the device
  ///@param device_type Type of the device `APPLE` or `ANDROID`
  ///@param device_push_token Unique push token for the device
  ///@param first_name First name of the user
  ///@param last_name Last name of the user
  ///@param gender_id Gender id of selected gender
  ///@param age_group Age group
  ///@param email Email address of user
  ///@param address Location of the user
  ///@param latitude Latitude of the location
  ///@param longitude Longitude of the location
  ///@param username username for login
  ///@param password Password. Must be at least 8 characters.
  ///@param password_confirmation Confirm password. Must be at least 8 characters.
  @Post(path: '/register', optionalBody: true)
  Future<chopper.Response<AuthRegisterResponse>> registerPost(
      {@Header('Accept') String? accept,
      @Field('device_id') required String? deviceId,
      @Field('device_type') required String? deviceType,
      @Field('device_push_token') String? devicePushToken,
      @Field('first_name') String? firstName,
      @Field('last_name') String? lastName,
      @Field('gender_id') num? genderId,
      @Field('age_group') String? ageGroup,
      @Field('email') required String? email,
      @Field('address') String? address,
      @Field('latitude') String? latitude,
      @Field('longitude') String? longitude,
      @Field('username') String? username,
      @Field('password') required String? password,
      @Field('password_confirmation') String? passwordConfirmation});

  ///Login
  ///@param Accept `application/json`
  ///@param device_id Unique ID of the device
  ///@param device_type Type of the device `APPLE` or `ANDROID`
  ///@param device_push_token Unique push token for the device
  ///@param email Email
  ///@param password Password
  @Post(path: '/login', optionalBody: true)
  Future<chopper.Response<AuthLoginResponse>> loginPost(
      {@Header('Accept') String? accept,
      @Field('device_id') required String? deviceId,
      @Field('device_type') required String? deviceType,
      @Field('device_push_token') String? devicePushToken,
      @Field('email') required String? email,
      @Field('password') required String? password});

  ///Reset Password
  ///@param Accept `application/json`
  ///@param email Email
  @Post(path: '/password/email', optionalBody: true)
  Future<chopper.Response<SuccessResponse>> passwordEmailPost(
      {@Header('Accept') String? accept,
      @Field('email') required String? email});

  ///Social Login
  ///@param Accept `application/json`
  ///@param provider Provider for social login
  ///@param token Token form social login provider
  @Post(path: '/login/social', optionalBody: true)
  Future<chopper.Response<AuthSocialLoginResponse>> loginSocialPost(
      {@Header('Accept') String? accept,
      @Field('provider') required String? provider,
      @Field('token') required String? token});

  ///Get Settings
  ///@param Accept `application/json`
  @Get(path: '/settings')
  Future<chopper.Response<SettingsGetSettingsResponse>> settingsGet(
      {@Header('Accept') String? accept});

  ///Logout
  ///@param Accept Set to `application/json`
  @Get(path: '/logout')
  Future<chopper.Response<SuccessResponse>> logoutGet(
      {@Header('Accept') String? accept});

  ///My Profile
  ///@param Accept Set to `application/json`
  @Get(path: '/profile')
  Future<chopper.Response<ProfileMyProfileResponse>> profileGet(
      {@Header('Accept') String? accept});

  ///Update My Profile
  ///@param first_name First name
  ///@param last_name Last name
  ///@param email Email
  ///@param phone Phone
  ///@param description Description
  ///@param gender_id 1: Male | 2: Femail | 3: Other
  ///@param age_group ID of the age group returned from age group API
  ///@param address Address
  ///@param latitude latitude
  ///@param longitude longitude
  ///@param username username
  ///@param posts_keep_private Posts keep private setting | 0 for no, 1 for yes
  ///@param posts_with_public Posts share with public setting | 0 for no, 1 for yes
  ///@param posts_with_family Posts share with family setting | 0 for no, 1 for yes
  ///@param posts_with_friends Posts share with friends setting | 0 for no, 1 for yes
  ///@param visible_username username visible  | 0 for no, 1 for yes
  ///@param Accept Set to `application/json`
  @Put(path: '/profile', optionalBody: true)
  Future<chopper.Response<ProfileUpdateMyProfileResponse>> profilePut(
      {@Field('first_name') required String? firstName,
      @Field('last_name') String? lastName,
      @Field('email') required String? email,
      @Field('phone') String? phone,
      @Field('description') String? description,
      @Field('gender_id') required num? genderId,
      @Field('age_group') required String? ageGroup,
      @Field('address') required String? address,
      @Field('latitude') required String? latitude,
      @Field('longitude') required String? longitude,
      @Field('username') required String? username,
      @Field('posts_keep_private') int? postsKeepPrivate,
      @Field('posts_with_public') int? postsWithPublic,
      @Field('posts_with_family') int? postsWithFamily,
      @Field('posts_with_friends') int? postsWithFriends,
      @Field('visible_username') int? visibleUsername,
      @Header('Accept') String? accept});

  ///My Friends
  ///@param Accept Set to `application/json`
  @Get(path: '/friends')
  Future<chopper.Response<ProfileMyFriendsResponse>> friendsGet(
      {@Header('Accept') String? accept});

  ///My Family
  ///@param Accept Set to `application/json`
  @Get(path: '/family')
  Future<chopper.Response<ProfileMyFamilyResponse>> familyGet(
      {@Header('Accept') String? accept});

  ///My Friend Requests
  ///@param Accept Set to `application/json`
  @Get(path: '/friend-requests')
  Future<chopper.Response<ProfileMyFriendRequestsResponse>> friendRequestsGet(
      {@Header('Accept') String? accept});

  ///My Family Requests
  ///@param Accept Set to `application/json`
  @Get(path: '/family-requests')
  Future<chopper.Response<ProfileMyFamilyRequestsResponse>> familyRequestsGet(
      {@Header('Accept') String? accept});

  ///Hide Profile update message
  ///@param Accept Set to `application/json`
  @Put(path: '/profile/complete-profile-remember', optionalBody: true)
  Future<chopper.Response<ProfileHideProfileUpdateMessageResponse>>
      profileCompleteProfileRememberPut({@Header('Accept') String? accept});

  ///Update My Profile Settings
  ///@param posts_keep_private Posts keep private setting | 0 for no, 1 for yes
  ///@param posts_with_public Posts share with public setting | 0 for no, 1 for yes
  ///@param posts_with_family Posts share with family setting | 0 for no, 1 for yes
  ///@param posts_with_friends Posts share with friends setting | 0 for no, 1 for yes
  ///@param visible_username username visible  | 0 for no, 1 for yes
  ///@param Accept Set to `application/json`
  @Put(path: '/profile/settings', optionalBody: true)
  Future<chopper.Response<ProfileUpdateMyProfileSettingsResponse>>
      profileSettingsPut(
          {@Field('posts_keep_private') int? postsKeepPrivate,
          @Field('posts_with_public') int? postsWithPublic,
          @Field('posts_with_family') int? postsWithFamily,
          @Field('posts_with_friends') int? postsWithFriends,
          @Field('visible_username') int? visibleUsername,
          @Header('Accept') String? accept});

  ///Update My Avatar
  ///@param image Image
  ///@param Accept Set to `application/json`
  @Post(path: '/avatar', optionalBody: true)
  Future<chopper.Response<ProfileUpdateMyAvatarResponse>> avatarPost(
      {@Field('image') required List<String>? image,
      @Header('Accept') String? accept});

  ///Update My Cover Image
  ///@param image Image
  ///@param Accept Set to `application/json`
  @Post(path: '/cover', optionalBody: true)
  Future<chopper.Response<ProfileUpdateMyCoverImageResponse>> coverPost(
      {@Field('image') required List<String>? image,
      @Header('Accept') String? accept});

  ///Update Password
  ///@param password Password
  ///@param current_password Current password
  ///@param password_confirmation Password confirmation
  ///@param Accept Set to `application/json`
  @Post(path: '/password/edit', optionalBody: true)
  Future<chopper.Response<SuccessResponse>> passwordEditPost(
      {@Field('password') required String? password,
      @Field('current_password') required String? currentPassword,
      @Field('password_confirmation') required String? passwordConfirmation,
      @Header('Accept') String? accept});

  ///List
  ///@param Accept `application/json`
  @Get(path: '/moods')
  Future<chopper.Response<MoodsListResponse>> moodsGet(
      {@Header('Accept') String? accept});

  ///view
  ///@param Accept `application/json`
  ///@param id ID of the entity
  @Get(path: '/moods/{id}')
  Future<chopper.Response<MoodsViewResponse>> moodsIdGet(
      {@Header('Accept') String? accept, @Path('id') required String? id});

  ///Types
  ///@param Accept `application/json`
  ///@param id Mood Id
  @Get(path: '/moods/{id}/types')
  Future<chopper.Response<MoodsTypesResponse>> moodsIdTypesGet(
      {@Header('Accept') String? accept, @Path('id') required int? id});

  ///List
  ///@param Accept `application/json`
  @Get(path: '/places')
  Future<chopper.Response<PlacesListResponse>> placesGet(
      {@Header('Accept') String? accept});

  ///view
  ///@param Accept `application/json`
  ///@param id ID of the entity
  @Get(path: '/places/{id}')
  Future<chopper.Response<PlacesViewResponse>> placesIdGet(
      {@Header('Accept') String? accept, @Path('id') required String? id});

  ///Types
  ///@param Accept `application/json`
  ///@param id Place Id
  @Get(path: '/places/{id}/types')
  Future<chopper.Response<PlacesTypesResponse>> placesIdTypesGet(
      {@Header('Accept') String? accept, @Path('id') required int? id});

  ///List
  ///@param Accept `application/json`
  @Get(path: '/activities')
  Future<chopper.Response<ActivitiesListResponse>> activitiesGet(
      {@Header('Accept') String? accept});

  ///view
  ///@param Accept `application/json`
  ///@param id ID of the entity
  @Get(path: '/activities/{id}')
  Future<chopper.Response<ActivitiesViewResponse>> activitiesIdGet(
      {@Header('Accept') String? accept, @Path('id') required String? id});

  ///Types
  ///@param Accept `application/json`
  ///@param id Activity Id
  @Get(path: '/activities/{id}/types')
  Future<chopper.Response<ActivitiesTypesResponse>> activitiesIdTypesGet(
      {@Header('Accept') String? accept, @Path('id') required int? id});

  ///List
  ///@param Accept `application/json`
  @Get(path: '/feelings')
  Future<chopper.Response<FeelingsListResponse>> feelingsGet(
      {@Header('Accept') String? accept});

  ///view
  ///@param Accept `application/json`
  ///@param id ID of the entity
  @Get(path: '/feelings/{id}')
  Future<chopper.Response<FeelingsViewResponse>> feelingsIdGet(
      {@Header('Accept') String? accept, @Path('id') required String? id});

  ///Types
  ///@param Accept `application/json`
  ///@param id Feeling Id
  @Get(path: '/feelings/{id}/types')
  Future<chopper.Response<FeelingsTypesResponse>> feelingsIdTypesGet(
      {@Header('Accept') String? accept, @Path('id') required int? id});

  ///List Ratings
  ///@param Accept Set to `application/json`
  @Get(path: '/feeling-ratings')
  Future<chopper.Response<FeelingsListRatingsResponse>> feelingRatingsGet(
      {@Header('Accept') String? accept});

  ///List
  ///@param Accept `application/json`
  ///@param q search by location
  ///@param user_id search by user
  ///@param place_id search by place
  ///@param place_type_id search by place_type
  ///@param feeling_rating search by feeling rating
  ///@param start_date search by date
  ///@param end_date search by date
  ///@param mood_id Id of the mood
  ///@param activity_id Id of the activity
  ///@param longitude longitude of base location to search
  ///@param latitude latitude of base location to search
  ///@param radius Radius to serch - km
  @Get(path: '/visited-places')
  Future<chopper.Response<VisitedPlacesListResponse>> visitedPlacesGet(
      {@Header('Accept') String? accept,
      @Query('q') required String? q,
      @Query('user_id') int? userId,
      @Query('place_id') int? placeId,
      @Query('place_type_id') int? placeTypeId,
      @Query('feeling_rating') int? feelingRating,
      @Query('start_date') String? startDate,
      @Query('end_date') String? endDate,
      @Query('mood_id') String? moodId,
      @Query('activity_id') String? activityId,
      @Query('longitude') String? longitude,
      @Query('latitude') String? latitude,
      @Query('radius') String? radius});

  ///Save
  ///@param Accept `application/json`
  ///@param location address of
  ///@param latitude latitude of the address
  ///@param longitude longitude of the address
  ///@param mood_id ID of selected mood
  ///@param mood_type_id ID of selected mood_type
  ///@param place_id ID of selected place
  ///@param place_type_id ID of selected place_type
  ///@param activity_id ID of selected activity
  ///@param activity_type_id ID of selected activity_type
  ///@param feeling_id ID of selected feeling
  ///@param feeling_type_id ID of selected feeling_type
  ///@param feeling_rating selected rating 1,2,3,4,5
  ///@param feeling_note feeling note
  @Post(path: '/visited-places', optionalBody: true)
  Future<chopper.Response<VisitedPlacesSaveResponse>> visitedPlacesPost(
      {@Header('Accept') String? accept,
      @Field('location') required String? location,
      @Field('latitude') required String? latitude,
      @Field('longitude') required String? longitude,
      @Field('mood_id') required int? moodId,
      @Field('mood_type_id') required int? moodTypeId,
      @Field('place_id') required int? placeId,
      @Field('place_type_id') required int? placeTypeId,
      @Field('activity_id') required int? activityId,
      @Field('activity_type_id') required int? activityTypeId,
      @Field('feeling_id') required int? feelingId,
      @Field('feeling_type_id') int? feelingTypeId,
      @Field('feeling_rating') int? feelingRating,
      @Field('feeling_note') String? feelingNote});

  ///Save Feeling
  ///@param id Visited place ID
  ///@param feeling_rating feeling note
  ///@param feeling_note Feeling Note
  ///@param Accept Set to `application/json`
  @Post(path: '/visited-places/{id}/feelings', optionalBody: true)
  Future<chopper.Response<VisitedPlacesSaveFeelingResponse>>
      visitedPlacesIdFeelingsPost(
          {@Path('id') required int? id,
          @Field('feeling_rating') int? feelingRating,
          @Field('feeling_note') String? feelingNote,
          @Header('Accept') String? accept});

  ///Store Answer
  ///@param question_and_answers Q abd A as json array e.g. [{"question_id":1,"answer":5},{"question_id":2,"answer":3}]
  ///@param Accept Set to `application/json`
  @Post(path: '/answers', optionalBody: true)
  Future<chopper.Response<SuccessResponse>> answersPost(
      {@Field('question_and_answers') required String? questionAndAnswers,
      @Header('Accept') String? accept});

  ///Store My Activity Location
  ///@param activity_id Activity Category ID
  ///@param location Activity Location Address
  ///@param latitude latitude of the Location Address
  ///@param longitude longitude of the Location Address
  ///@param Accept Set to `application/json`
  @Post(path: '/my-activities', optionalBody: true)
  Future<chopper.Response<MyActivitiesStoreMyActivityLocationResponse>>
      myActivitiesPost(
          {@Field('activity_id') required int? activityId,
          @Field('location') required String? location,
          @Field('latitude') required String? latitude,
          @Field('longitude') required String? longitude,
          @Header('Accept') String? accept});

  ///Search
  ///@param activity_id Activity Category ID
  ///@param latitude latitude of the Location Address
  ///@param longitude longitude of the Location Address
  ///@param radius longitude of the Location Address
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param Accept Set to `application/json`
  @Get(path: '/my-activities')
  Future<chopper.Response<MyActivitiesSearchResponse>> myActivitiesGet(
      {@Query('activity_id') int? activityId,
      @Query('latitude') String? latitude,
      @Query('longitude') String? longitude,
      @Query('radius') int? radius,
      @Query('per_page') int? perPage,
      @Query('page') int? page,
      @Header('Accept') String? accept});

  ///List
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param Accept Set to `application/json`
  @Get(path: '/happyness-options')
  Future<chopper.Response<HappynessOptionsListResponse>> happynessOptionsGet(
      {@Query('per_page') int? perPage,
      @Query('page') int? page,
      @Header('Accept') String? accept});

  ///questions
  ///@param id Test ID
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param Accept Set to `application/json`
  @Get(path: '/happyness-tests/{id}/questions')
  Future<chopper.Response<HappynessTestsQuestionsResponse>>
      happynessTestsIdQuestionsGet(
          {@Path('id') required String? id,
          @Query('per_page') int? perPage,
          @Query('page') int? page,
          @Header('Accept') String? accept});

  ///Get BigFive Test Results
  ///@param Accept Set to `application/json`
  @Get(path: '/happyness-tests/bigfive/results')
  Future<chopper.Response<TestResultsGetBigFiveTestResultsResponse>>
      happynessTestsBigfiveResultsGet({@Header('Accept') String? accept});

  ///Get HEXACO Test Results
  ///@param Accept Set to `application/json`
  @Get(path: '/happyness-tests/hexaco/results')
  Future<chopper.Response<TestResultsGetHEXACOTestResultsResponse>>
      happynessTestsHexacoResultsGet({@Header('Accept') String? accept});

  ///Get Happiness Test Results
  ///@param Accept Set to `application/json`
  @Get(path: '/happyness-tests/happiness/results')
  Future<chopper.Response<TestResultsGetHappinessTestResultsResponse>>
      happynessTestsHappinessResultsGet({@Header('Accept') String? accept});

  ///List
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param option_id Option Id
  ///@param Accept Set to `application/json`
  @Get(path: '/happyness-tests')
  Future<chopper.Response<HappynessTestsListResponse>> happynessTestsGet(
      {@Query('per_page') int? perPage,
      @Query('page') int? page,
      @Query('option_id') String? optionId,
      @Header('Accept') String? accept});

  ///Search
  ///@param q Search by user name
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param Accept Set to `application/json`
  @Get(path: '/users')
  Future<chopper.Response<UsersSearchResponse>> usersGet(
      {@Query('q') String? q,
      @Query('per_page') int? perPage,
      @Query('page') int? page,
      @Header('Accept') String? accept});

  ///Age groups
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param Accept Set to `application/json`
  @Get(path: '/users/age-groups')
  Future<chopper.Response<UsersAgeGroupsResponse>> usersAgeGroupsGet(
      {@Query('per_page') int? perPage,
      @Query('page') int? page,
      @Header('Accept') String? accept});

  ///Add friend or family
  ///@param friend_id User id to add as friend or family
  ///@param relation_type 1 : Friend | 2 : Family
  ///@param Accept Set to `application/json`
  @Post(path: '/friend-family', optionalBody: true)
  Future<chopper.Response<FriendAddFriendOrFamilyResponse>> friendFamilyPost(
      {@Field('friend_id') required int? friendId,
      @Field('relation_type') required int? relationType,
      @Header('Accept') String? accept});

  ///Remove friend or family
  ///@param friend_ids comma seperated users ids to remove | ex: 1,2,3,4
  ///@param Accept Set to `application/json`
  @Delete(path: '/friend-family')
  Future<chopper.Response<SuccessResponse>> friendFamilyDelete(
      {@Field('friend_ids') required String? friendIds,
      @Header('Accept') String? accept});

  ///Accept Friend or Family Request
  ///@param user_id Id of the requested friend ID
  ///@param Accept Set to `application/json`
  @Put(path: '/friend-family/accept', optionalBody: true)
  Future<chopper.Response<FriendAcceptFriendOrFamilyRequestResponse>>
      friendFamilyAcceptPut(
          {@Field('user_id') required int? userId,
          @Header('Accept') String? accept});

  ///Reject Friend or Family Request
  ///@param user_id Id of the requested friend ID
  ///@param Accept Set to `application/json`
  @Put(path: '/friend-family/reject', optionalBody: true)
  Future<chopper.Response<FriendRejectFriendOrFamilyRequestResponse>>
      friendFamilyRejectPut(
          {@Field('user_id') required int? userId,
          @Header('Accept') String? accept});

  ///Index - Entries explorer
  ///@param Accept `application/json`
  ///@param page Page Number
  ///@param per_page Items per page
  ///@param lat Location latitude | send current lat as default
  ///@param long Location longitude | send current long as default
  ///@param radius radius from current location in KM | ex : 10 | default is 10
  ///@param explore_by `all` for get all, `my` for get current user's s, `others` to get family and friend's
  ///@param moods mood, feeling, places ids seperated with a comma | ex : 1,23,55,85,23
  @Get(path: '/entires')
  Future<chopper.Response<EntriesIndexEntriesExplorerResponse>> entiresGet(
      {@Header('Accept') String? accept,
      @Query('page') int? page,
      @Query('per_page') int? perPage,
      @Query('lat') String? lat,
      @Query('long') String? long,
      @Query('radius') String? radius,
      @Query('explore_by') String? exploreBy,
      @Query('moods') String? moods});

  ///Store
  ///@param location Location address
  ///@param latitude Latitude of the place
  ///@param longitude Longitude of the place
  ///@param privacy_level Privacy level 1: Private | 2: Public | 3: Friends Only | 4: Family Only | 5: Fiends and family only
  ///@param title Entry title
  ///@param post_date Entry date | ex: 2020-02-28
  ///@param mood_id Mood Id
  ///@param note Description of the post
  ///@param image_paths Json array of image URLs e.g. ["http://localhost/storage/images/1cc.jpg","http://localhost/storage/images/1cc2.jpg"]
  ///@param Accept Set to `application/json`
  @Post(path: '/entires', optionalBody: true)
  Future<chopper.Response<EntriesStoreResponse>> entiresPost(
      {@Field('location') required String? location,
      @Field('latitude') required String? latitude,
      @Field('longitude') required String? longitude,
      @Field('privacy_level') required int? privacyLevel,
      @Field('title') required String? title,
      @Field('post_date') required String? postDate,
      @Field('mood_id') required int? moodId,
      @Field('note') required String? note,
      @Field('image_paths') String? imagePaths,
      @Header('Accept') String? accept});

  ///List
  ///@param filter my|shared_with_me
  ///@param page Page number
  ///@param per_page Items per page
  ///@param longitude longitude of searched location
  ///@param latitude latitude of searched location
  ///@param radius Required radius from KM
  ///@param moods Mood ids seperated with a comma | ex: 1,21,45,56
  ///@param Accept Set to `application/json`
  @Get(path: '/entries')
  Future<chopper.Response<EntriesListResponse>> entriesGet(
      {@Query('filter') String? filter,
      @Query('page') int? page,
      @Query('per_page') int? perPage,
      @Query('longitude') String? longitude,
      @Query('latitude') String? latitude,
      @Query('radius') String? radius,
      @Query('moods') String? moods,
      @Header('Accept') String? accept});

  ///Delete posts
  ///@param id_list comma separated id list to delete posts
  ///@param Accept Set to `application/json`
  @Delete(path: '/entries')
  Future<chopper.Response<SuccessResponse>> entriesDelete(
      {@Field('id_list') required String? idList,
      @Header('Accept') String? accept});

  ///Update
  ///@param id Entry Id to Edit
  ///@param location Location address
  ///@param latitude Latitude of the place
  ///@param longitude Longitude of the place
  ///@param privacy_level Privacy level 1: Private | 2: Public | 3: Friends Only | 4: Family Only | 5: Fiends and family only
  ///@param title Entry title
  ///@param post_date Entry date
  ///@param mood_id Mood Id
  ///@param note Description of the post
  ///@param image_paths Json array of image URLs e.g. ["http://localhost/storage/images/1cc.jpg","http://localhost/storage/images/1cc2.jpg"]
  ///@param Accept Set to `application/json`
  @Put(path: '/entries/{id}', optionalBody: true)
  Future<chopper.Response<EntriesUpdateResponse>> entriesIdPut(
      {@Path('id') required String? id,
      @Field('location') required String? location,
      @Field('latitude') required String? latitude,
      @Field('longitude') required String? longitude,
      @Field('privacy_level') required int? privacyLevel,
      @Field('title') required String? title,
      @Field('post_date') required String? postDate,
      @Field('mood_id') required int? moodId,
      @Field('note') String? note,
      @Field('image_paths') String? imagePaths,
      @Header('Accept') String? accept});

  ///Get Shared Posts
  ///@param page Page number
  ///@param per_page Items per page
  ///@param Accept Set to `application/json`
  @Get(path: '/entries/shared-posts')
  Future<chopper.Response<EntriesGetSharedPostsResponse>> entriesSharedPostsGet(
      {@Query('page') int? page,
      @Query('per_page') int? perPage,
      @Header('Accept') String? accept});

  ///Share a posts
  ///@param shared_to Shared to user ID
  ///@param post_id Id of the entry to share
  ///@param description description
  ///@param Accept Set to `application/json`
  @Post(path: '/entries/share', optionalBody: true)
  Future<chopper.Response<EntriesShareAPostsResponse>> entriesSharePost(
      {@Field('shared_to') required int? sharedTo,
      @Field('post_id') required int? postId,
      @Field('description') required String? description,
      @Header('Accept') String? accept});

  ///Store Image
  ///@param Accept `application/json`
  ///@param image Image file to upload
  @Post(path: '/image', optionalBody: true)
  Future<chopper.Response<ImageStoreImageResponse>> imagePost(
      {@Header('Accept') String? accept,
      @Field('image') required List<String>? image});

  ///Add My Place
  ///@param location Location address
  ///@param latitude Latitude of the place
  ///@param longitude Longitude of the place
  ///@param my_place_category_id Category id of my place
  ///@param my_place_opinion_id Opinion Id of the place
  ///@param note Note for the place
  ///@param Accept Set to `application/json`
  @Post(path: '/my-places', optionalBody: true)
  Future<chopper.Response<MyPlacesAddMyPlaceResponse>> myPlacesPost(
      {@Field('location') required String? location,
      @Field('latitude') required String? latitude,
      @Field('longitude') required String? longitude,
      @Field('my_place_category_id') required int? myPlaceCategoryId,
      @Field('my_place_opinion_id') required int? myPlaceOpinionId,
      @Field('note') required String? note,
      @Header('Accept') String? accept});

  ///List
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param category_id My place category Id to filter
  ///@param opinion_id My place opinion Id to filter
  ///@param place_name Name of the location
  ///@param longitude longitude of searched location
  ///@param latitude latitude of searched location
  ///@param radius Required radius from KM
  ///@param Accept Set to `application/json`
  @Get(path: '/my-places')
  Future<chopper.Response<MyPlacesListResponse>> myPlacesGet(
      {@Query('per_page') int? perPage,
      @Query('page') int? page,
      @Query('category_id') int? categoryId,
      @Query('opinion_id') int? opinionId,
      @Query('place_name') String? placeName,
      @Query('longitude') String? longitude,
      @Query('latitude') String? latitude,
      @Query('radius') String? radius,
      @Header('Accept') String? accept});

  ///My place categories
  ///@param Accept `application/json`
  ///@param page Page number
  ///@param per_page Number of Items per page
  @Get(path: '/my-places/categories')
  Future<chopper.Response<MyPlaceCategoriesMyPlaceCategoriesResponse>>
      myPlacesCategoriesGet(
          {@Header('Accept') String? accept,
          @Query('page') required String? page,
          @Query('per_page') required String? perPage});

  ///My place Opinions
  ///@param Accept `application/json`
  ///@param page Page number
  ///@param per_page Number of Items per page
  @Get(path: '/my-places/opinions')
  Future<chopper.Response<MyPlacesMyPlaceOpinionsResponse>> myPlacesOpinionsGet(
      {@Header('Accept') String? accept,
      @Query('page') required String? page,
      @Query('per_page') required String? perPage});

  ///Store
  ///@param address Location address
  ///@param latitude Latitude of the place
  ///@param longitude Longitude of the place
  ///@param event_time Time of the journal 2021-03-15 23:34:33
  ///@param mood_id Mood Id
  ///@param activity_id Activity Id
  ///@param place_id Id of the selected place
  ///@param journal_entry Journal entry
  ///@param Accept Set to `application/json`
  @Post(path: '/diaries', optionalBody: true)
  Future<chopper.Response<DiariesStoreResponse>> diariesPost(
      {@Field('address') required String? address,
      @Field('latitude') required String? latitude,
      @Field('longitude') required String? longitude,
      @Field('event_time') required String? eventTime,
      @Field('mood_id') required int? moodId,
      @Field('activity_id') required int? activityId,
      @Field('place_id') required int? placeId,
      @Field('journal_entry') required String? journalEntry,
      @Header('Accept') String? accept});

  ///List
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param date_from Date from to start filter diary events
  ///@param date_to End date to filter diary events
  ///@param Accept Set to `application/json`
  @Get(path: '/diaries')
  Future<chopper.Response<DiariesListResponse>> diariesGet(
      {@Query('per_page') int? perPage,
      @Query('page') int? page,
      @Query('date_from') String? dateFrom,
      @Query('date_to') String? dateTo,
      @Header('Accept') String? accept});

  ///Average stats
  ///@param Accept Set to `application/json`
  @Get(path: '/diaries/average-stats')
  Future<chopper.Response<DiariesAverageStatsResponse>> diariesAverageStatsGet(
      {@Header('Accept') String? accept});

  ///Edit
  ///@param id Entity Id
  ///@param address Location address
  ///@param latitude Latitude of the place
  ///@param longitude Longitude of the place
  ///@param event_time Time of the journal 2021-03-15 23:34:33
  ///@param mood_id Mood Id
  ///@param activity_id Activity Id
  ///@param place_id Id of the selected place
  ///@param journal_entry Journal entry
  ///@param Accept Set to `application/json`
  @Put(path: '/diaries/{id}', optionalBody: true)
  Future<chopper.Response<DiariesEditResponse>> diariesIdPut(
      {@Path('id') required int? id,
      @Field('address') required String? address,
      @Field('latitude') required String? latitude,
      @Field('longitude') required String? longitude,
      @Field('event_time') required String? eventTime,
      @Field('mood_id') required int? moodId,
      @Field('activity_id') required int? activityId,
      @Field('place_id') required int? placeId,
      @Field('journal_entry') required String? journalEntry,
      @Header('Accept') String? accept});

  ///Add My Personality Pin
  ///@param address Location address
  ///@param latitude Latitude of the place
  ///@param longitude Longitude of the place
  ///@param describe Describe in a one word
  ///@param pin_color selected color for the pin
  ///@param Accept Set to `application/json`
  @Post(path: '/personality-pins', optionalBody: true)
  Future<chopper.Response<MyPlacesPinAddMyPersonalityPinResponse>>
      personalityPinsPost(
          {@Field('address') required String? address,
          @Field('latitude') required String? latitude,
          @Field('longitude') required String? longitude,
          @Field('describe') required String? describe,
          @Field('pin_color') required int? pinColor,
          @Header('Accept') String? accept});

  ///List
  ///@param per_page Num of items per page
  ///@param page Page Number
  ///@param describe Describe personality in one word
  ///@param pin_color color choose per given one word description
  ///@param Accept Set to `application/json`
  @Get(path: '/personality-pins')
  Future<chopper.Response<MyPlacesPinListResponse>> personalityPinsGet(
      {@Query('per_page') int? perPage,
      @Query('page') int? page,
      @Query('describe') String? describe,
      @Query('pin_color') String? pinColor,
      @Header('Accept') String? accept});

  ///Index
  ///@param page Page number for paginate
  ///@param per_page Number of items per page
  ///@param x-device-id Unique ID of the device
  ///@param x-device-type Type of the device `apple` or `android`
  ///@param Accept Set to `application/json`
  @Get(path: '/notifications')
  Future<chopper.Response<NotificationsIndexResponse>> notificationsGet(
      {@Query('page') int? page,
      @Query('per_page') int? perPage,
      @Header('x-device-id') String? xDeviceId,
      @Header('x-device-type') String? xDeviceType,
      @Header('Accept') String? accept});

  ///Delete All
  ///@param Accept `application/json`
  ///@param x-device-id Unique ID of the device
  ///@param x-device-type Type of the device `apple` or `android`
  @Delete(path: '/notifications')
  Future<chopper.Response<SuccessResponse>> notificationsDelete(
      {@Header('Accept') String? accept,
      @Header('x-device-id') String? xDeviceId,
      @Header('x-device-type') String? xDeviceType});

  ///Mark a Notification as Read
  ///@param Accept `application/json`
  ///@param x-device-id Unique ID of the device
  ///@param x-device-type Type of the device `apple` or `android`
  ///@param uuid Notification Uuid - Sent by the server for the notification
  @Post(path: '/notifications/{uuid}/mark-as-read', optionalBody: true)
  Future<chopper.Response<NotificationsMarkANotificationAsReadResponse>>
      notificationsUuidMarkAsReadPost(
          {@Header('Accept') String? accept,
          @Header('x-device-id') String? xDeviceId,
          @Header('x-device-type') String? xDeviceType,
          @Path('uuid') required String? uuid});

  ///Delete
  ///@param Accept `application/json`
  ///@param uuid notification uuid for delete
  ///@param x-device-id Unique ID of the device
  ///@param x-device-type Type of the device `apple` or `android`
  @Delete(path: '/notifications/{uuid}')
  Future<chopper.Response<SuccessResponse>> notificationsUuidDelete(
      {@Header('Accept') String? accept,
      @Path('uuid') required int? uuid,
      @Header('x-device-id') String? xDeviceId,
      @Header('x-device-type') String? xDeviceType});

  ///Get Setting
  ///@param key Key of the setting
  ///@param Accept Set to `application/json`
  @Get(path: '/settings/{key}')
  Future<chopper.Response<SuccessResponse>> settingsKeyGet(
      {@Path('key') required String? key, @Header('Accept') String? accept});
}

final Map<Type, Object Function(Map<String, dynamic>)>
    ApiClientJsonDecoderMappings = {
  User: User.fromJsonFactory,
  PushNotification: PushNotification.fromJsonFactory,
  Device: Device.fromJsonFactory,
  Setting: Setting.fromJsonFactory,
  Mood: Mood.fromJsonFactory,
  MoodType: MoodType.fromJsonFactory,
  Place: Place.fromJsonFactory,
  PlaceType: PlaceType.fromJsonFactory,
  Activity: Activity.fromJsonFactory,
  Feeling: Feeling.fromJsonFactory,
  FeelingRating: FeelingRating.fromJsonFactory,
  VisitedPlace: VisitedPlace.fromJsonFactory,
  Answer: Answer.fromJsonFactory,
  ActivityLocation: ActivityLocation.fromJsonFactory,
  HappynessOption: HappynessOption.fromJsonFactory,
  Question: Question.fromJsonFactory,
  HappynessTest: HappynessTest.fromJsonFactory,
  Friend: Friend.fromJsonFactory,
  AgeGroup: AgeGroup.fromJsonFactory,
  Entry: Entry.fromJsonFactory,
  PostImage: PostImage.fromJsonFactory,
  DonotShareWithMeRequest: DonotShareWithMeRequest.fromJsonFactory,
  Image: Image.fromJsonFactory,
  MyPlace: MyPlace.fromJsonFactory,
  MyPlaceCategory: MyPlaceCategory.fromJsonFactory,
  MyPlaceOpinion: MyPlaceOpinion.fromJsonFactory,
  Diary: Diary.fromJsonFactory,
  MyPersonalityPin: MyPersonalityPin.fromJsonFactory,
  ActivityType: ActivityType.fromJsonFactory,
  BigFiveTestResult: BigFiveTestResult.fromJsonFactory,
  DiaryStats: DiaryStats.fromJsonFactory,
  FeelingType: FeelingType.fromJsonFactory,
  File: File.fromJsonFactory,
  HappinessTestResult: HappinessTestResult.fromJsonFactory,
  HexacoTestResult: HexacoTestResult.fromJsonFactory,
  IconCategory: IconCategory.fromJsonFactory,
  PushNotificationStatus: PushNotificationStatus.fromJsonFactory,
  Gender: Gender.fromJsonFactory,
  SettingsResponse: SettingsResponse.fromJsonFactory,
  SharedPost: SharedPost.fromJsonFactory,
  SubQuestion: SubQuestion.fromJsonFactory,
  SuccessResponse: SuccessResponse.fromJsonFactory,
  Paginator: Paginator.fromJsonFactory,
  ApiErrorUnauthorized: ApiErrorUnauthorized.fromJsonFactory,
  ApiErrorAccessDenied: ApiErrorAccessDenied.fromJsonFactory,
  ApiError: ApiError.fromJsonFactory,
  AuthRegisterResponse: AuthRegisterResponse.fromJsonFactory,
  AuthLoginResponse: AuthLoginResponse.fromJsonFactory,
  AuthSocialLoginResponse: AuthSocialLoginResponse.fromJsonFactory,
  SettingsGetSettingsResponse: SettingsGetSettingsResponse.fromJsonFactory,
  ProfileMyProfileResponse: ProfileMyProfileResponse.fromJsonFactory,
  ProfileMyFriendsResponse: ProfileMyFriendsResponse.fromJsonFactory,
  ProfileMyFamilyResponse: ProfileMyFamilyResponse.fromJsonFactory,
  ProfileMyFriendRequestsResponse:
      ProfileMyFriendRequestsResponse.fromJsonFactory,
  ProfileMyFamilyRequestsResponse:
      ProfileMyFamilyRequestsResponse.fromJsonFactory,
  ProfileUpdateMyProfileResponse:
      ProfileUpdateMyProfileResponse.fromJsonFactory,
  ProfileHideProfileUpdateMessageResponse:
      ProfileHideProfileUpdateMessageResponse.fromJsonFactory,
  ProfileUpdateMyProfileSettingsResponse:
      ProfileUpdateMyProfileSettingsResponse.fromJsonFactory,
  ProfileUpdateMyAvatarResponse: ProfileUpdateMyAvatarResponse.fromJsonFactory,
  ProfileUpdateMyCoverImageResponse:
      ProfileUpdateMyCoverImageResponse.fromJsonFactory,
  MoodsListResponse: MoodsListResponse.fromJsonFactory,
  MoodsViewResponse: MoodsViewResponse.fromJsonFactory,
  MoodsTypesResponse: MoodsTypesResponse.fromJsonFactory,
  PlacesListResponse: PlacesListResponse.fromJsonFactory,
  PlacesViewResponse: PlacesViewResponse.fromJsonFactory,
  PlacesTypesResponse: PlacesTypesResponse.fromJsonFactory,
  ActivitiesListResponse: ActivitiesListResponse.fromJsonFactory,
  ActivitiesViewResponse: ActivitiesViewResponse.fromJsonFactory,
  ActivitiesTypesResponse: ActivitiesTypesResponse.fromJsonFactory,
  FeelingsListResponse: FeelingsListResponse.fromJsonFactory,
  FeelingsViewResponse: FeelingsViewResponse.fromJsonFactory,
  FeelingsTypesResponse: FeelingsTypesResponse.fromJsonFactory,
  FeelingsListRatingsResponse: FeelingsListRatingsResponse.fromJsonFactory,
  VisitedPlacesListResponse: VisitedPlacesListResponse.fromJsonFactory,
  VisitedPlacesSaveResponse: VisitedPlacesSaveResponse.fromJsonFactory,
  VisitedPlacesSaveFeelingResponse:
      VisitedPlacesSaveFeelingResponse.fromJsonFactory,
  MyActivitiesStoreMyActivityLocationResponse:
      MyActivitiesStoreMyActivityLocationResponse.fromJsonFactory,
  MyActivitiesSearchResponse: MyActivitiesSearchResponse.fromJsonFactory,
  HappynessOptionsListResponse: HappynessOptionsListResponse.fromJsonFactory,
  HappynessTestsQuestionsResponse:
      HappynessTestsQuestionsResponse.fromJsonFactory,
  TestResultsGetBigFiveTestResultsResponse:
      TestResultsGetBigFiveTestResultsResponse.fromJsonFactory,
  TestResultsGetHEXACOTestResultsResponse:
      TestResultsGetHEXACOTestResultsResponse.fromJsonFactory,
  TestResultsGetHappinessTestResultsResponse:
      TestResultsGetHappinessTestResultsResponse.fromJsonFactory,
  HappynessTestsListResponse: HappynessTestsListResponse.fromJsonFactory,
  UsersSearchResponse: UsersSearchResponse.fromJsonFactory,
  UsersAgeGroupsResponse: UsersAgeGroupsResponse.fromJsonFactory,
  FriendAddFriendOrFamilyResponse:
      FriendAddFriendOrFamilyResponse.fromJsonFactory,
  FriendAcceptFriendOrFamilyRequestResponse:
      FriendAcceptFriendOrFamilyRequestResponse.fromJsonFactory,
  FriendRejectFriendOrFamilyRequestResponse:
      FriendRejectFriendOrFamilyRequestResponse.fromJsonFactory,
  EntriesIndexEntriesExplorerResponse:
      EntriesIndexEntriesExplorerResponse.fromJsonFactory,
  EntriesStoreResponse: EntriesStoreResponse.fromJsonFactory,
  EntriesListResponse: EntriesListResponse.fromJsonFactory,
  EntriesUpdateResponse: EntriesUpdateResponse.fromJsonFactory,
  EntriesGetSharedPostsResponse: EntriesGetSharedPostsResponse.fromJsonFactory,
  EntriesShareAPostsResponse: EntriesShareAPostsResponse.fromJsonFactory,
  ImageStoreImageResponse: ImageStoreImageResponse.fromJsonFactory,
  MyPlacesAddMyPlaceResponse: MyPlacesAddMyPlaceResponse.fromJsonFactory,
  MyPlacesListResponse: MyPlacesListResponse.fromJsonFactory,
  MyPlaceCategoriesMyPlaceCategoriesResponse:
      MyPlaceCategoriesMyPlaceCategoriesResponse.fromJsonFactory,
  MyPlacesMyPlaceOpinionsResponse:
      MyPlacesMyPlaceOpinionsResponse.fromJsonFactory,
  DiariesStoreResponse: DiariesStoreResponse.fromJsonFactory,
  DiariesListResponse: DiariesListResponse.fromJsonFactory,
  DiariesAverageStatsResponse: DiariesAverageStatsResponse.fromJsonFactory,
  DiariesEditResponse: DiariesEditResponse.fromJsonFactory,
  MyPlacesPinAddMyPersonalityPinResponse:
      MyPlacesPinAddMyPersonalityPinResponse.fromJsonFactory,
  MyPlacesPinListResponse: MyPlacesPinListResponse.fromJsonFactory,
  NotificationsIndexResponse: NotificationsIndexResponse.fromJsonFactory,
  NotificationsMarkANotificationAsReadResponse:
      NotificationsMarkANotificationAsReadResponse.fromJsonFactory,
};

@JsonSerializable(explicitToJson: true)
class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.coverImageUrl,
    this.description,
    this.email,
    this.avatarUrl,
    this.timezone,
    this.ageGroup,
    this.address,
    this.latitude,
    this.longitude,
    this.genderId,
    this.username,
    this.postsKeepPrivate,
    this.postsWithPublic,
    this.postsWithFamily,
    this.postsWithFriends,
    this.visibleUsername,
    this.completeProfileRemember,
    this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'full_name')
  final String? fullName;
  @JsonKey(name: 'cover_image_url')
  final String? coverImageUrl;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'timezone')
  final String? timezone;
  @JsonKey(name: 'age_group')
  final String? ageGroup;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'gender_id')
  final String? genderId;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'posts_keep_private')
  final String? postsKeepPrivate;
  @JsonKey(name: 'posts_with_public')
  final String? postsWithPublic;
  @JsonKey(name: 'posts_with_family')
  final String? postsWithFamily;
  @JsonKey(name: 'posts_with_friends')
  final String? postsWithFriends;
  @JsonKey(name: 'visible_username')
  final String? visibleUsername;
  @JsonKey(name: 'complete_profile_remember')
  final bool? completeProfileRemember;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  static const fromJsonFactory = _$UserFromJson;
  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.coverImageUrl, coverImageUrl)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.avatarUrl, avatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.avatarUrl, avatarUrl)) &&
            (identical(other.timezone, timezone) ||
                const DeepCollectionEquality()
                    .equals(other.timezone, timezone)) &&
            (identical(other.ageGroup, ageGroup) ||
                const DeepCollectionEquality()
                    .equals(other.ageGroup, ageGroup)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.genderId, genderId) ||
                const DeepCollectionEquality()
                    .equals(other.genderId, genderId)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.postsKeepPrivate, postsKeepPrivate) ||
                const DeepCollectionEquality()
                    .equals(other.postsKeepPrivate, postsKeepPrivate)) &&
            (identical(other.postsWithPublic, postsWithPublic) ||
                const DeepCollectionEquality()
                    .equals(other.postsWithPublic, postsWithPublic)) &&
            (identical(other.postsWithFamily, postsWithFamily) ||
                const DeepCollectionEquality()
                    .equals(other.postsWithFamily, postsWithFamily)) &&
            (identical(other.postsWithFriends, postsWithFriends) ||
                const DeepCollectionEquality()
                    .equals(other.postsWithFriends, postsWithFriends)) &&
            (identical(other.visibleUsername, visibleUsername) ||
                const DeepCollectionEquality()
                    .equals(other.visibleUsername, visibleUsername)) &&
            (identical(other.completeProfileRemember, completeProfileRemember) ||
                const DeepCollectionEquality().equals(
                    other.completeProfileRemember, completeProfileRemember)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(coverImageUrl) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(avatarUrl) ^
      const DeepCollectionEquality().hash(timezone) ^
      const DeepCollectionEquality().hash(ageGroup) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(genderId) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(postsKeepPrivate) ^
      const DeepCollectionEquality().hash(postsWithPublic) ^
      const DeepCollectionEquality().hash(postsWithFamily) ^
      const DeepCollectionEquality().hash(postsWithFriends) ^
      const DeepCollectionEquality().hash(visibleUsername) ^
      const DeepCollectionEquality().hash(completeProfileRemember) ^
      const DeepCollectionEquality().hash(accessToken) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      String? fullName,
      String? coverImageUrl,
      String? description,
      String? email,
      String? avatarUrl,
      String? timezone,
      String? ageGroup,
      String? address,
      String? latitude,
      String? longitude,
      String? genderId,
      String? username,
      String? postsKeepPrivate,
      String? postsWithPublic,
      String? postsWithFamily,
      String? postsWithFriends,
      String? visibleUsername,
      bool? completeProfileRemember,
      String? accessToken}) {
    return User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fullName: fullName ?? this.fullName,
        coverImageUrl: coverImageUrl ?? this.coverImageUrl,
        description: description ?? this.description,
        email: email ?? this.email,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        timezone: timezone ?? this.timezone,
        ageGroup: ageGroup ?? this.ageGroup,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        genderId: genderId ?? this.genderId,
        username: username ?? this.username,
        postsKeepPrivate: postsKeepPrivate ?? this.postsKeepPrivate,
        postsWithPublic: postsWithPublic ?? this.postsWithPublic,
        postsWithFamily: postsWithFamily ?? this.postsWithFamily,
        postsWithFriends: postsWithFriends ?? this.postsWithFriends,
        visibleUsername: visibleUsername ?? this.visibleUsername,
        completeProfileRemember:
            completeProfileRemember ?? this.completeProfileRemember,
        accessToken: accessToken ?? this.accessToken);
  }
}

@JsonSerializable(explicitToJson: true)
class PushNotification {
  PushNotification({
    this.id,
    this.uuid,
    this.title,
    this.message,
    this.badgeCount,
    this.data,
    this.scheduledAt,
    this.scheduledTimezone,
    this.sentAt,
    this.readAt,
    this.notifiableType,
    this.notifiableId,
    this.topic,
    this.apnsConfig,
    this.androidConfig,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory PushNotification.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'uuid')
  final String? uuid;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'badge_count')
  final int? badgeCount;
  @JsonKey(name: 'data')
  final String? data;
  @JsonKey(name: 'scheduled_at')
  final String? scheduledAt;
  @JsonKey(name: 'scheduled_timezone')
  final String? scheduledTimezone;
  @JsonKey(name: 'sent_at')
  final String? sentAt;
  @JsonKey(name: 'read_at')
  final String? readAt;
  @JsonKey(name: 'notifiable_type')
  final String? notifiableType;
  @JsonKey(name: 'notifiable_id')
  final String? notifiableId;
  @JsonKey(name: 'topic')
  final String? topic;
  @JsonKey(name: 'apns_config')
  final String? apnsConfig;
  @JsonKey(name: 'android_config')
  final String? androidConfig;
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  static const fromJsonFactory = _$PushNotificationFromJson;
  static const toJsonFactory = _$PushNotificationToJson;
  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PushNotification &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.uuid, uuid) ||
                const DeepCollectionEquality().equals(other.uuid, uuid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.badgeCount, badgeCount) ||
                const DeepCollectionEquality()
                    .equals(other.badgeCount, badgeCount)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.scheduledAt, scheduledAt) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledAt, scheduledAt)) &&
            (identical(other.scheduledTimezone, scheduledTimezone) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledTimezone, scheduledTimezone)) &&
            (identical(other.sentAt, sentAt) ||
                const DeepCollectionEquality().equals(other.sentAt, sentAt)) &&
            (identical(other.readAt, readAt) ||
                const DeepCollectionEquality().equals(other.readAt, readAt)) &&
            (identical(other.notifiableType, notifiableType) ||
                const DeepCollectionEquality()
                    .equals(other.notifiableType, notifiableType)) &&
            (identical(other.notifiableId, notifiableId) ||
                const DeepCollectionEquality()
                    .equals(other.notifiableId, notifiableId)) &&
            (identical(other.topic, topic) ||
                const DeepCollectionEquality().equals(other.topic, topic)) &&
            (identical(other.apnsConfig, apnsConfig) ||
                const DeepCollectionEquality()
                    .equals(other.apnsConfig, apnsConfig)) &&
            (identical(other.androidConfig, androidConfig) ||
                const DeepCollectionEquality()
                    .equals(other.androidConfig, androidConfig)) &&
            (identical(other.deletedAt, deletedAt) ||
                const DeepCollectionEquality()
                    .equals(other.deletedAt, deletedAt)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(uuid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(badgeCount) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(scheduledAt) ^
      const DeepCollectionEquality().hash(scheduledTimezone) ^
      const DeepCollectionEquality().hash(sentAt) ^
      const DeepCollectionEquality().hash(readAt) ^
      const DeepCollectionEquality().hash(notifiableType) ^
      const DeepCollectionEquality().hash(notifiableId) ^
      const DeepCollectionEquality().hash(topic) ^
      const DeepCollectionEquality().hash(apnsConfig) ^
      const DeepCollectionEquality().hash(androidConfig) ^
      const DeepCollectionEquality().hash(deletedAt) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      runtimeType.hashCode;
}

extension $PushNotificationExtension on PushNotification {
  PushNotification copyWith(
      {int? id,
      String? uuid,
      String? title,
      String? message,
      int? badgeCount,
      String? data,
      String? scheduledAt,
      String? scheduledTimezone,
      String? sentAt,
      String? readAt,
      String? notifiableType,
      String? notifiableId,
      String? topic,
      String? apnsConfig,
      String? androidConfig,
      String? deletedAt,
      String? createdAt,
      String? updatedAt}) {
    return PushNotification(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        message: message ?? this.message,
        badgeCount: badgeCount ?? this.badgeCount,
        data: data ?? this.data,
        scheduledAt: scheduledAt ?? this.scheduledAt,
        scheduledTimezone: scheduledTimezone ?? this.scheduledTimezone,
        sentAt: sentAt ?? this.sentAt,
        readAt: readAt ?? this.readAt,
        notifiableType: notifiableType ?? this.notifiableType,
        notifiableId: notifiableId ?? this.notifiableId,
        topic: topic ?? this.topic,
        apnsConfig: apnsConfig ?? this.apnsConfig,
        androidConfig: androidConfig ?? this.androidConfig,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }
}

@JsonSerializable(explicitToJson: true)
class Device {
  Device({
    this.id,
    this.userId,
    this.deviceId,
    this.deviceType,
    this.devicePushToken,
    this.accessToken,
    this.accessTokenExpiresAt,
    this.latestIpAddress,
    this.createdAt,
    this.updatedAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'device_id')
  final String? deviceId;
  @JsonKey(name: 'device_type')
  final String? deviceType;
  @JsonKey(name: 'device_push_token')
  final String? devicePushToken;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'access_token_expires_at')
  final String? accessTokenExpiresAt;
  @JsonKey(name: 'latest_ip_address')
  final String? latestIpAddress;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  static const fromJsonFactory = _$DeviceFromJson;
  static const toJsonFactory = _$DeviceToJson;
  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Device &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.deviceType, deviceType) ||
                const DeepCollectionEquality()
                    .equals(other.deviceType, deviceType)) &&
            (identical(other.devicePushToken, devicePushToken) ||
                const DeepCollectionEquality()
                    .equals(other.devicePushToken, devicePushToken)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.accessTokenExpiresAt, accessTokenExpiresAt) ||
                const DeepCollectionEquality().equals(
                    other.accessTokenExpiresAt, accessTokenExpiresAt)) &&
            (identical(other.latestIpAddress, latestIpAddress) ||
                const DeepCollectionEquality()
                    .equals(other.latestIpAddress, latestIpAddress)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(deviceType) ^
      const DeepCollectionEquality().hash(devicePushToken) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(accessTokenExpiresAt) ^
      const DeepCollectionEquality().hash(latestIpAddress) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      runtimeType.hashCode;
}

extension $DeviceExtension on Device {
  Device copyWith(
      {String? id,
      String? userId,
      String? deviceId,
      String? deviceType,
      String? devicePushToken,
      String? accessToken,
      String? accessTokenExpiresAt,
      String? latestIpAddress,
      String? createdAt,
      String? updatedAt}) {
    return Device(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        deviceId: deviceId ?? this.deviceId,
        deviceType: deviceType ?? this.deviceType,
        devicePushToken: devicePushToken ?? this.devicePushToken,
        accessToken: accessToken ?? this.accessToken,
        accessTokenExpiresAt: accessTokenExpiresAt ?? this.accessTokenExpiresAt,
        latestIpAddress: latestIpAddress ?? this.latestIpAddress,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }
}

@JsonSerializable(explicitToJson: true)
class Setting {
  Setting({
    this.id,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'key')
  final String? key;
  @JsonKey(name: 'value')
  final String? value;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  static const fromJsonFactory = _$SettingFromJson;
  static const toJsonFactory = _$SettingToJson;
  Map<String, dynamic> toJson() => _$SettingToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Setting &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      runtimeType.hashCode;
}

extension $SettingExtension on Setting {
  Setting copyWith(
      {int? id,
      String? key,
      String? value,
      String? createdAt,
      String? updatedAt}) {
    return Setting(
        id: id ?? this.id,
        key: key ?? this.key,
        value: value ?? this.value,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }
}

@JsonSerializable(explicitToJson: true)
class Mood {
  Mood({
    this.id,
    this.name,
    this.imageUrl,
    this.moodTypes,
  });

  factory Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'moodTypes', defaultValue: <MoodType>[])
  final List<MoodType>? moodTypes;
  static const fromJsonFactory = _$MoodFromJson;
  static const toJsonFactory = _$MoodToJson;
  Map<String, dynamic> toJson() => _$MoodToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Mood &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.moodTypes, moodTypes) ||
                const DeepCollectionEquality()
                    .equals(other.moodTypes, moodTypes)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(moodTypes) ^
      runtimeType.hashCode;
}

extension $MoodExtension on Mood {
  Mood copyWith(
      {int? id, String? name, String? imageUrl, List<MoodType>? moodTypes}) {
    return Mood(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        moodTypes: moodTypes ?? this.moodTypes);
  }
}

@JsonSerializable(explicitToJson: true)
class MoodType {
  MoodType({
    this.id,
    this.moodId,
    this.name,
    this.colour,
  });

  factory MoodType.fromJson(Map<String, dynamic> json) =>
      _$MoodTypeFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'mood_id')
  final int? moodId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'colour')
  final String? colour;
  static const fromJsonFactory = _$MoodTypeFromJson;
  static const toJsonFactory = _$MoodTypeToJson;
  Map<String, dynamic> toJson() => _$MoodTypeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MoodType &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.moodId, moodId) ||
                const DeepCollectionEquality().equals(other.moodId, moodId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.colour, colour) ||
                const DeepCollectionEquality().equals(other.colour, colour)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(moodId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(colour) ^
      runtimeType.hashCode;
}

extension $MoodTypeExtension on MoodType {
  MoodType copyWith({int? id, int? moodId, String? name, String? colour}) {
    return MoodType(
        id: id ?? this.id,
        moodId: moodId ?? this.moodId,
        name: name ?? this.name,
        colour: colour ?? this.colour);
  }
}

@JsonSerializable(explicitToJson: true)
class Place {
  Place({
    this.id,
    this.name,
    this.imageUrl,
    this.placeTypes,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'placeTypes', defaultValue: <PlaceType>[])
  final List<PlaceType>? placeTypes;
  static const fromJsonFactory = _$PlaceFromJson;
  static const toJsonFactory = _$PlaceToJson;
  Map<String, dynamic> toJson() => _$PlaceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Place &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.placeTypes, placeTypes) ||
                const DeepCollectionEquality()
                    .equals(other.placeTypes, placeTypes)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(placeTypes) ^
      runtimeType.hashCode;
}

extension $PlaceExtension on Place {
  Place copyWith(
      {int? id, String? name, String? imageUrl, List<PlaceType>? placeTypes}) {
    return Place(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        placeTypes: placeTypes ?? this.placeTypes);
  }
}

@JsonSerializable(explicitToJson: true)
class PlaceType {
  PlaceType({
    this.id,
    this.placeId,
    this.name,
    this.colour,
  });

  factory PlaceType.fromJson(Map<String, dynamic> json) =>
      _$PlaceTypeFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'place_id')
  final int? placeId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'colour')
  final String? colour;
  static const fromJsonFactory = _$PlaceTypeFromJson;
  static const toJsonFactory = _$PlaceTypeToJson;
  Map<String, dynamic> toJson() => _$PlaceTypeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlaceType &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.colour, colour) ||
                const DeepCollectionEquality().equals(other.colour, colour)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(colour) ^
      runtimeType.hashCode;
}

extension $PlaceTypeExtension on PlaceType {
  PlaceType copyWith({int? id, int? placeId, String? name, String? colour}) {
    return PlaceType(
        id: id ?? this.id,
        placeId: placeId ?? this.placeId,
        name: name ?? this.name,
        colour: colour ?? this.colour);
  }
}

@JsonSerializable(explicitToJson: true)
class Activity {
  Activity({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  static const fromJsonFactory = _$ActivityFromJson;
  static const toJsonFactory = _$ActivityToJson;
  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Activity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      runtimeType.hashCode;
}

extension $ActivityExtension on Activity {
  Activity copyWith({String? id, String? name, String? imageUrl}) {
    return Activity(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl);
  }
}

@JsonSerializable(explicitToJson: true)
class Feeling {
  Feeling({
    this.id,
    this.name,
    this.imageUrl,
    this.feelingTypes,
  });

  factory Feeling.fromJson(Map<String, dynamic> json) =>
      _$FeelingFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'feelingTypes', defaultValue: <FeelingType>[])
  final List<FeelingType>? feelingTypes;
  static const fromJsonFactory = _$FeelingFromJson;
  static const toJsonFactory = _$FeelingToJson;
  Map<String, dynamic> toJson() => _$FeelingToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Feeling &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.feelingTypes, feelingTypes) ||
                const DeepCollectionEquality()
                    .equals(other.feelingTypes, feelingTypes)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(feelingTypes) ^
      runtimeType.hashCode;
}

extension $FeelingExtension on Feeling {
  Feeling copyWith(
      {int? id,
      String? name,
      String? imageUrl,
      List<FeelingType>? feelingTypes}) {
    return Feeling(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        feelingTypes: feelingTypes ?? this.feelingTypes);
  }
}

@JsonSerializable(explicitToJson: true)
class FeelingRating {
  FeelingRating({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
  });

  factory FeelingRating.fromJson(Map<String, dynamic> json) =>
      _$FeelingRatingFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'title')
  final String? title;
  static const fromJsonFactory = _$FeelingRatingFromJson;
  static const toJsonFactory = _$FeelingRatingToJson;
  Map<String, dynamic> toJson() => _$FeelingRatingToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FeelingRating &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(title) ^
      runtimeType.hashCode;
}

extension $FeelingRatingExtension on FeelingRating {
  FeelingRating copyWith(
      {String? id, String? createdAt, String? updatedAt, String? title}) {
    return FeelingRating(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        title: title ?? this.title);
  }
}

@JsonSerializable(explicitToJson: true)
class VisitedPlace {
  VisitedPlace({
    this.id,
    this.userId,
    this.location,
    this.latitude,
    this.longitude,
    this.moodId,
    this.moodTypeId,
    this.placeId,
    this.placeTypeId,
    this.activityId,
    this.activityTypeId,
    this.feelingId,
    this.feelingRating,
    this.feelingNote,
    this.flag,
    this.createdAt,
    this.updatedAt,
    this.feelingTypeId,
    this.mood,
    this.moodType,
    this.place,
    this.placeType,
    this.activity,
    this.activityType,
    this.feeling,
    this.feelingType,
  });

  factory VisitedPlace.fromJson(Map<String, dynamic> json) =>
      _$VisitedPlaceFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'mood_id')
  final int? moodId;
  @JsonKey(name: 'mood_type_id')
  final int? moodTypeId;
  @JsonKey(name: 'place_id')
  final int? placeId;
  @JsonKey(name: 'place_type_id')
  final int? placeTypeId;
  @JsonKey(name: 'activity_id')
  final int? activityId;
  @JsonKey(name: 'activity_type_id')
  final int? activityTypeId;
  @JsonKey(name: 'feeling_id')
  final int? feelingId;
  @JsonKey(name: 'feeling_rating')
  final int? feelingRating;
  @JsonKey(name: 'feeling_note')
  final String? feelingNote;
  @JsonKey(name: 'flag')
  final String? flag;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'feeling_type_id')
  final int? feelingTypeId;
  @JsonKey(name: 'mood')
  final Mood? mood;
  @JsonKey(name: 'mood_type')
  final MoodType? moodType;
  @JsonKey(name: 'place')
  final Place? place;
  @JsonKey(name: 'place_type')
  final PlaceType? placeType;
  @JsonKey(name: 'activity')
  final Activity? activity;
  @JsonKey(name: 'activity_type')
  final ActivityType? activityType;
  @JsonKey(name: 'feeling')
  final Feeling? feeling;
  @JsonKey(name: 'feeling_type')
  final FeelingType? feelingType;
  static const fromJsonFactory = _$VisitedPlaceFromJson;
  static const toJsonFactory = _$VisitedPlaceToJson;
  Map<String, dynamic> toJson() => _$VisitedPlaceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisitedPlace &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.moodId, moodId) ||
                const DeepCollectionEquality().equals(other.moodId, moodId)) &&
            (identical(other.moodTypeId, moodTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.moodTypeId, moodTypeId)) &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.placeTypeId, placeTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeTypeId, placeTypeId)) &&
            (identical(other.activityId, activityId) ||
                const DeepCollectionEquality()
                    .equals(other.activityId, activityId)) &&
            (identical(other.activityTypeId, activityTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.activityTypeId, activityTypeId)) &&
            (identical(other.feelingId, feelingId) ||
                const DeepCollectionEquality()
                    .equals(other.feelingId, feelingId)) &&
            (identical(other.feelingRating, feelingRating) ||
                const DeepCollectionEquality()
                    .equals(other.feelingRating, feelingRating)) &&
            (identical(other.feelingNote, feelingNote) ||
                const DeepCollectionEquality()
                    .equals(other.feelingNote, feelingNote)) &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.feelingTypeId, feelingTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.feelingTypeId, feelingTypeId)) &&
            (identical(other.mood, mood) ||
                const DeepCollectionEquality().equals(other.mood, mood)) &&
            (identical(other.moodType, moodType) ||
                const DeepCollectionEquality()
                    .equals(other.moodType, moodType)) &&
            (identical(other.place, place) ||
                const DeepCollectionEquality().equals(other.place, place)) &&
            (identical(other.placeType, placeType) ||
                const DeepCollectionEquality()
                    .equals(other.placeType, placeType)) &&
            (identical(other.activity, activity) ||
                const DeepCollectionEquality()
                    .equals(other.activity, activity)) &&
            (identical(other.activityType, activityType) ||
                const DeepCollectionEquality()
                    .equals(other.activityType, activityType)) &&
            (identical(other.feeling, feeling) ||
                const DeepCollectionEquality().equals(other.feeling, feeling)) &&
            (identical(other.feelingType, feelingType) || const DeepCollectionEquality().equals(other.feelingType, feelingType)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(moodId) ^
      const DeepCollectionEquality().hash(moodTypeId) ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(placeTypeId) ^
      const DeepCollectionEquality().hash(activityId) ^
      const DeepCollectionEquality().hash(activityTypeId) ^
      const DeepCollectionEquality().hash(feelingId) ^
      const DeepCollectionEquality().hash(feelingRating) ^
      const DeepCollectionEquality().hash(feelingNote) ^
      const DeepCollectionEquality().hash(flag) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(feelingTypeId) ^
      const DeepCollectionEquality().hash(mood) ^
      const DeepCollectionEquality().hash(moodType) ^
      const DeepCollectionEquality().hash(place) ^
      const DeepCollectionEquality().hash(placeType) ^
      const DeepCollectionEquality().hash(activity) ^
      const DeepCollectionEquality().hash(activityType) ^
      const DeepCollectionEquality().hash(feeling) ^
      const DeepCollectionEquality().hash(feelingType) ^
      runtimeType.hashCode;
}

extension $VisitedPlaceExtension on VisitedPlace {
  VisitedPlace copyWith(
      {int? id,
      int? userId,
      String? location,
      String? latitude,
      String? longitude,
      int? moodId,
      int? moodTypeId,
      int? placeId,
      int? placeTypeId,
      int? activityId,
      int? activityTypeId,
      int? feelingId,
      int? feelingRating,
      String? feelingNote,
      String? flag,
      String? createdAt,
      String? updatedAt,
      int? feelingTypeId,
      Mood? mood,
      MoodType? moodType,
      Place? place,
      PlaceType? placeType,
      Activity? activity,
      ActivityType? activityType,
      Feeling? feeling,
      FeelingType? feelingType}) {
    return VisitedPlace(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        location: location ?? this.location,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        moodId: moodId ?? this.moodId,
        moodTypeId: moodTypeId ?? this.moodTypeId,
        placeId: placeId ?? this.placeId,
        placeTypeId: placeTypeId ?? this.placeTypeId,
        activityId: activityId ?? this.activityId,
        activityTypeId: activityTypeId ?? this.activityTypeId,
        feelingId: feelingId ?? this.feelingId,
        feelingRating: feelingRating ?? this.feelingRating,
        feelingNote: feelingNote ?? this.feelingNote,
        flag: flag ?? this.flag,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        feelingTypeId: feelingTypeId ?? this.feelingTypeId,
        mood: mood ?? this.mood,
        moodType: moodType ?? this.moodType,
        place: place ?? this.place,
        placeType: placeType ?? this.placeType,
        activity: activity ?? this.activity,
        activityType: activityType ?? this.activityType,
        feeling: feeling ?? this.feeling,
        feelingType: feelingType ?? this.feelingType);
  }
}

@JsonSerializable(explicitToJson: true)
class Answer {
  Answer({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.questionId,
    this.userId,
    this.answer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'question_id')
  final String? questionId;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'answer')
  final double? answer;
  static const fromJsonFactory = _$AnswerFromJson;
  static const toJsonFactory = _$AnswerToJson;
  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Answer &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.questionId, questionId) ||
                const DeepCollectionEquality()
                    .equals(other.questionId, questionId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(questionId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(answer) ^
      runtimeType.hashCode;
}

extension $AnswerExtension on Answer {
  Answer copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? questionId,
      String? userId,
      double? answer}) {
    return Answer(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        questionId: questionId ?? this.questionId,
        userId: userId ?? this.userId,
        answer: answer ?? this.answer);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivityLocation {
  ActivityLocation({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.activityId,
    this.userId,
    this.location,
    this.latitude,
    this.longitude,
  });

  factory ActivityLocation.fromJson(Map<String, dynamic> json) =>
      _$ActivityLocationFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'activity_id')
  final int? activityId;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  static const fromJsonFactory = _$ActivityLocationFromJson;
  static const toJsonFactory = _$ActivityLocationToJson;
  Map<String, dynamic> toJson() => _$ActivityLocationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivityLocation &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.activityId, activityId) ||
                const DeepCollectionEquality()
                    .equals(other.activityId, activityId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(activityId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      runtimeType.hashCode;
}

extension $ActivityLocationExtension on ActivityLocation {
  ActivityLocation copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      int? activityId,
      String? userId,
      String? location,
      String? latitude,
      String? longitude}) {
    return ActivityLocation(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        activityId: activityId ?? this.activityId,
        userId: userId ?? this.userId,
        location: location ?? this.location,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude);
  }
}

@JsonSerializable(explicitToJson: true)
class HappynessOption {
  HappynessOption({
    this.title,
    this.id,
    this.description,
  });

  factory HappynessOption.fromJson(Map<String, dynamic> json) =>
      _$HappynessOptionFromJson(json);

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'description')
  final String? description;
  static const fromJsonFactory = _$HappynessOptionFromJson;
  static const toJsonFactory = _$HappynessOptionToJson;
  Map<String, dynamic> toJson() => _$HappynessOptionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HappynessOption &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $HappynessOptionExtension on HappynessOption {
  HappynessOption copyWith({String? title, String? id, String? description}) {
    return HappynessOption(
        title: title ?? this.title,
        id: id ?? this.id,
        description: description ?? this.description);
  }
}

@JsonSerializable(explicitToJson: true)
class Question {
  Question({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.happynessTestId,
    this.title,
    this.parentQuestionId,
    this.description,
    this.bottomEndNote,
    this.topEndNote,
    this.orderNumber,
    this.happynessOptionId,
    this.subQuestions,
    this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'happyness_test_id')
  final String? happynessTestId;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'parent_question_id')
  final String? parentQuestionId;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'bottom_end_note')
  final String? bottomEndNote;
  @JsonKey(name: 'top_end_note')
  final String? topEndNote;
  @JsonKey(name: 'order_number')
  final int? orderNumber;
  @JsonKey(name: 'happyness_option_id')
  final String? happynessOptionId;
  @JsonKey(name: 'sub_questions', defaultValue: <SubQuestion>[])
  final List<SubQuestion>? subQuestions;
  @JsonKey(name: 'answer')
  final Answer? answer;
  static const fromJsonFactory = _$QuestionFromJson;
  static const toJsonFactory = _$QuestionToJson;
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Question &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.happynessTestId, happynessTestId) ||
                const DeepCollectionEquality()
                    .equals(other.happynessTestId, happynessTestId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.parentQuestionId, parentQuestionId) ||
                const DeepCollectionEquality()
                    .equals(other.parentQuestionId, parentQuestionId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.bottomEndNote, bottomEndNote) ||
                const DeepCollectionEquality()
                    .equals(other.bottomEndNote, bottomEndNote)) &&
            (identical(other.topEndNote, topEndNote) ||
                const DeepCollectionEquality()
                    .equals(other.topEndNote, topEndNote)) &&
            (identical(other.orderNumber, orderNumber) ||
                const DeepCollectionEquality()
                    .equals(other.orderNumber, orderNumber)) &&
            (identical(other.happynessOptionId, happynessOptionId) ||
                const DeepCollectionEquality()
                    .equals(other.happynessOptionId, happynessOptionId)) &&
            (identical(other.subQuestions, subQuestions) ||
                const DeepCollectionEquality()
                    .equals(other.subQuestions, subQuestions)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(happynessTestId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(parentQuestionId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(bottomEndNote) ^
      const DeepCollectionEquality().hash(topEndNote) ^
      const DeepCollectionEquality().hash(orderNumber) ^
      const DeepCollectionEquality().hash(happynessOptionId) ^
      const DeepCollectionEquality().hash(subQuestions) ^
      const DeepCollectionEquality().hash(answer) ^
      runtimeType.hashCode;
}

extension $QuestionExtension on Question {
  Question copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? happynessTestId,
      String? title,
      String? parentQuestionId,
      String? description,
      String? bottomEndNote,
      String? topEndNote,
      int? orderNumber,
      String? happynessOptionId,
      List<SubQuestion>? subQuestions,
      Answer? answer}) {
    return Question(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        happynessTestId: happynessTestId ?? this.happynessTestId,
        title: title ?? this.title,
        parentQuestionId: parentQuestionId ?? this.parentQuestionId,
        description: description ?? this.description,
        bottomEndNote: bottomEndNote ?? this.bottomEndNote,
        topEndNote: topEndNote ?? this.topEndNote,
        orderNumber: orderNumber ?? this.orderNumber,
        happynessOptionId: happynessOptionId ?? this.happynessOptionId,
        subQuestions: subQuestions ?? this.subQuestions,
        answer: answer ?? this.answer);
  }
}

@JsonSerializable(explicitToJson: true)
class HappynessTest {
  HappynessTest({
    this.id,
    this.happynessOptionId,
    this.name,
    this.shortIntro,
    this.detailIntro,
  });

  factory HappynessTest.fromJson(Map<String, dynamic> json) =>
      _$HappynessTestFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'happyness_option_id')
  final String? happynessOptionId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'short_intro')
  final String? shortIntro;
  @JsonKey(name: 'detail_intro')
  final String? detailIntro;
  static const fromJsonFactory = _$HappynessTestFromJson;
  static const toJsonFactory = _$HappynessTestToJson;
  Map<String, dynamic> toJson() => _$HappynessTestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HappynessTest &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.happynessOptionId, happynessOptionId) ||
                const DeepCollectionEquality()
                    .equals(other.happynessOptionId, happynessOptionId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.shortIntro, shortIntro) ||
                const DeepCollectionEquality()
                    .equals(other.shortIntro, shortIntro)) &&
            (identical(other.detailIntro, detailIntro) ||
                const DeepCollectionEquality()
                    .equals(other.detailIntro, detailIntro)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(happynessOptionId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(shortIntro) ^
      const DeepCollectionEquality().hash(detailIntro) ^
      runtimeType.hashCode;
}

extension $HappynessTestExtension on HappynessTest {
  HappynessTest copyWith(
      {String? id,
      String? happynessOptionId,
      String? name,
      String? shortIntro,
      String? detailIntro}) {
    return HappynessTest(
        id: id ?? this.id,
        happynessOptionId: happynessOptionId ?? this.happynessOptionId,
        name: name ?? this.name,
        shortIntro: shortIntro ?? this.shortIntro,
        detailIntro: detailIntro ?? this.detailIntro);
  }
}

@JsonSerializable(explicitToJson: true)
class Friend {
  Friend({
    this.id,
    this.userId,
    this.friendId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isAccepted,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'friend_id')
  final String? friendId;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'is_accepted')
  final int? isAccepted;
  static const fromJsonFactory = _$FriendFromJson;
  static const toJsonFactory = _$FriendToJson;
  Map<String, dynamic> toJson() => _$FriendToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Friend &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.friendId, friendId) ||
                const DeepCollectionEquality()
                    .equals(other.friendId, friendId)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.isAccepted, isAccepted) ||
                const DeepCollectionEquality()
                    .equals(other.isAccepted, isAccepted)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(friendId) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(isAccepted) ^
      runtimeType.hashCode;
}

extension $FriendExtension on Friend {
  Friend copyWith(
      {String? id,
      String? userId,
      String? friendId,
      String? status,
      String? createdAt,
      String? updatedAt,
      int? isAccepted}) {
    return Friend(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        friendId: friendId ?? this.friendId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isAccepted: isAccepted ?? this.isAccepted);
  }
}

@JsonSerializable(explicitToJson: true)
class AgeGroup {
  AgeGroup({
    this.id,
    this.title,
  });

  factory AgeGroup.fromJson(Map<String, dynamic> json) =>
      _$AgeGroupFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  static const fromJsonFactory = _$AgeGroupFromJson;
  static const toJsonFactory = _$AgeGroupToJson;
  Map<String, dynamic> toJson() => _$AgeGroupToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AgeGroup &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      runtimeType.hashCode;
}

extension $AgeGroupExtension on AgeGroup {
  AgeGroup copyWith({String? id, String? title}) {
    return AgeGroup(id: id ?? this.id, title: title ?? this.title);
  }
}

@JsonSerializable(explicitToJson: true)
class Entry {
  Entry({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.location,
    this.latitude,
    this.longitude,
    this.privacyLevel,
    this.title,
    this.postDate,
    this.moodId,
    this.note,
    this.images,
    this.mood,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'privacy_level')
  final String? privacyLevel;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'post_date')
  final String? postDate;
  @JsonKey(name: 'mood_id')
  final int? moodId;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'images', defaultValue: <PostImage>[])
  final List<PostImage>? images;
  @JsonKey(name: 'mood')
  final Mood? mood;
  static const fromJsonFactory = _$EntryFromJson;
  static const toJsonFactory = _$EntryToJson;
  Map<String, dynamic> toJson() => _$EntryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Entry &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.privacyLevel, privacyLevel) ||
                const DeepCollectionEquality()
                    .equals(other.privacyLevel, privacyLevel)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.postDate, postDate) ||
                const DeepCollectionEquality()
                    .equals(other.postDate, postDate)) &&
            (identical(other.moodId, moodId) ||
                const DeepCollectionEquality().equals(other.moodId, moodId)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)) &&
            (identical(other.mood, mood) ||
                const DeepCollectionEquality().equals(other.mood, mood)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(privacyLevel) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(postDate) ^
      const DeepCollectionEquality().hash(moodId) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(images) ^
      const DeepCollectionEquality().hash(mood) ^
      runtimeType.hashCode;
}

extension $EntryExtension on Entry {
  Entry copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? userId,
      String? location,
      String? latitude,
      String? longitude,
      String? privacyLevel,
      String? title,
      String? postDate,
      int? moodId,
      String? note,
      List<PostImage>? images,
      Mood? mood}) {
    return Entry(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        location: location ?? this.location,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        privacyLevel: privacyLevel ?? this.privacyLevel,
        title: title ?? this.title,
        postDate: postDate ?? this.postDate,
        moodId: moodId ?? this.moodId,
        note: note ?? this.note,
        images: images ?? this.images,
        mood: mood ?? this.mood);
  }
}

@JsonSerializable(explicitToJson: true)
class PostImage {
  PostImage({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.postId,
    this.imagePath,
  });

  factory PostImage.fromJson(Map<String, dynamic> json) =>
      _$PostImageFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'post_id')
  final String? postId;
  @JsonKey(name: 'image_path')
  final String? imagePath;
  static const fromJsonFactory = _$PostImageFromJson;
  static const toJsonFactory = _$PostImageToJson;
  Map<String, dynamic> toJson() => _$PostImageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PostImage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(imagePath) ^
      runtimeType.hashCode;
}

extension $PostImageExtension on PostImage {
  PostImage copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? postId,
      String? imagePath}) {
    return PostImage(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        postId: postId ?? this.postId,
        imagePath: imagePath ?? this.imagePath);
  }
}

@JsonSerializable(explicitToJson: true)
class DonotShareWithMeRequest {
  DonotShareWithMeRequest({
    this.id,
    this.userId,
    this.postId,
  });

  factory DonotShareWithMeRequest.fromJson(Map<String, dynamic> json) =>
      _$DonotShareWithMeRequestFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'post_id')
  final String? postId;
  static const fromJsonFactory = _$DonotShareWithMeRequestFromJson;
  static const toJsonFactory = _$DonotShareWithMeRequestToJson;
  Map<String, dynamic> toJson() => _$DonotShareWithMeRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DonotShareWithMeRequest &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(postId) ^
      runtimeType.hashCode;
}

extension $DonotShareWithMeRequestExtension on DonotShareWithMeRequest {
  DonotShareWithMeRequest copyWith(
      {String? id, String? userId, String? postId}) {
    return DonotShareWithMeRequest(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        postId: postId ?? this.postId);
  }
}

@JsonSerializable(explicitToJson: true)
class Image {
  Image({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.localPath,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'local_path')
  final String? localPath;
  static const fromJsonFactory = _$ImageFromJson;
  static const toJsonFactory = _$ImageToJson;
  Map<String, dynamic> toJson() => _$ImageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Image &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.localPath, localPath) ||
                const DeepCollectionEquality()
                    .equals(other.localPath, localPath)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(localPath) ^
      runtimeType.hashCode;
}

extension $ImageExtension on Image {
  Image copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? url,
      String? localPath}) {
    return Image(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        url: url ?? this.url,
        localPath: localPath ?? this.localPath);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlace {
  MyPlace({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.location,
    this.latitude,
    this.longitude,
    this.myPlaceCategoryId,
    this.myPlaceOpinionId,
    this.note,
  });

  factory MyPlace.fromJson(Map<String, dynamic> json) =>
      _$MyPlaceFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'my_place_category_id')
  final String? myPlaceCategoryId;
  @JsonKey(name: 'my_place_opinion_id')
  final String? myPlaceOpinionId;
  @JsonKey(name: 'note')
  final String? note;
  static const fromJsonFactory = _$MyPlaceFromJson;
  static const toJsonFactory = _$MyPlaceToJson;
  Map<String, dynamic> toJson() => _$MyPlaceToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlace &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.myPlaceCategoryId, myPlaceCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.myPlaceCategoryId, myPlaceCategoryId)) &&
            (identical(other.myPlaceOpinionId, myPlaceOpinionId) ||
                const DeepCollectionEquality()
                    .equals(other.myPlaceOpinionId, myPlaceOpinionId)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(myPlaceCategoryId) ^
      const DeepCollectionEquality().hash(myPlaceOpinionId) ^
      const DeepCollectionEquality().hash(note) ^
      runtimeType.hashCode;
}

extension $MyPlaceExtension on MyPlace {
  MyPlace copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? userId,
      String? location,
      String? latitude,
      String? longitude,
      String? myPlaceCategoryId,
      String? myPlaceOpinionId,
      String? note}) {
    return MyPlace(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        location: location ?? this.location,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        myPlaceCategoryId: myPlaceCategoryId ?? this.myPlaceCategoryId,
        myPlaceOpinionId: myPlaceOpinionId ?? this.myPlaceOpinionId,
        note: note ?? this.note);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlaceCategory {
  MyPlaceCategory({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.latitude,
    this.longitude,
    this.userId,
    this.myPlaceCategoryId,
    this.myPlaceOpinionId,
  });

  factory MyPlaceCategory.fromJson(Map<String, dynamic> json) =>
      _$MyPlaceCategoryFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'my_place_category_id')
  final String? myPlaceCategoryId;
  @JsonKey(name: 'my_place_opinion_id')
  final String? myPlaceOpinionId;
  static const fromJsonFactory = _$MyPlaceCategoryFromJson;
  static const toJsonFactory = _$MyPlaceCategoryToJson;
  Map<String, dynamic> toJson() => _$MyPlaceCategoryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlaceCategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.myPlaceCategoryId, myPlaceCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.myPlaceCategoryId, myPlaceCategoryId)) &&
            (identical(other.myPlaceOpinionId, myPlaceOpinionId) ||
                const DeepCollectionEquality()
                    .equals(other.myPlaceOpinionId, myPlaceOpinionId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(myPlaceCategoryId) ^
      const DeepCollectionEquality().hash(myPlaceOpinionId) ^
      runtimeType.hashCode;
}

extension $MyPlaceCategoryExtension on MyPlaceCategory {
  MyPlaceCategory copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? name,
      String? latitude,
      String? longitude,
      String? userId,
      String? myPlaceCategoryId,
      String? myPlaceOpinionId}) {
    return MyPlaceCategory(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        userId: userId ?? this.userId,
        myPlaceCategoryId: myPlaceCategoryId ?? this.myPlaceCategoryId,
        myPlaceOpinionId: myPlaceOpinionId ?? this.myPlaceOpinionId);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlaceOpinion {
  MyPlaceOpinion({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
  });

  factory MyPlaceOpinion.fromJson(Map<String, dynamic> json) =>
      _$MyPlaceOpinionFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'title')
  final String? title;
  static const fromJsonFactory = _$MyPlaceOpinionFromJson;
  static const toJsonFactory = _$MyPlaceOpinionToJson;
  Map<String, dynamic> toJson() => _$MyPlaceOpinionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlaceOpinion &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(title) ^
      runtimeType.hashCode;
}

extension $MyPlaceOpinionExtension on MyPlaceOpinion {
  MyPlaceOpinion copyWith(
      {String? id, String? createdAt, String? updatedAt, String? title}) {
    return MyPlaceOpinion(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        title: title ?? this.title);
  }
}

@JsonSerializable(explicitToJson: true)
class Diary {
  Diary({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.address,
    this.latitude,
    this.longitude,
    this.eventTime,
    this.moodId,
    this.activityId,
    this.placeId,
    this.journalEntry,
  });

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'event_time')
  final String? eventTime;
  @JsonKey(name: 'mood_id')
  final String? moodId;
  @JsonKey(name: 'activity_id')
  final String? activityId;
  @JsonKey(name: 'place_id')
  final String? placeId;
  @JsonKey(name: 'journal_entry')
  final String? journalEntry;
  static const fromJsonFactory = _$DiaryFromJson;
  static const toJsonFactory = _$DiaryToJson;
  Map<String, dynamic> toJson() => _$DiaryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Diary &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.eventTime, eventTime) ||
                const DeepCollectionEquality()
                    .equals(other.eventTime, eventTime)) &&
            (identical(other.moodId, moodId) ||
                const DeepCollectionEquality().equals(other.moodId, moodId)) &&
            (identical(other.activityId, activityId) ||
                const DeepCollectionEquality()
                    .equals(other.activityId, activityId)) &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.journalEntry, journalEntry) ||
                const DeepCollectionEquality()
                    .equals(other.journalEntry, journalEntry)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(eventTime) ^
      const DeepCollectionEquality().hash(moodId) ^
      const DeepCollectionEquality().hash(activityId) ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(journalEntry) ^
      runtimeType.hashCode;
}

extension $DiaryExtension on Diary {
  Diary copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? userId,
      String? address,
      String? latitude,
      String? longitude,
      String? eventTime,
      String? moodId,
      String? activityId,
      String? placeId,
      String? journalEntry}) {
    return Diary(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        eventTime: eventTime ?? this.eventTime,
        moodId: moodId ?? this.moodId,
        activityId: activityId ?? this.activityId,
        placeId: placeId ?? this.placeId,
        journalEntry: journalEntry ?? this.journalEntry);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPersonalityPin {
  MyPersonalityPin({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.describe,
    this.address,
    this.latitude,
    this.longitude,
    this.pinColor,
    this.userId,
  });

  factory MyPersonalityPin.fromJson(Map<String, dynamic> json) =>
      _$MyPersonalityPinFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'describe')
  final String? describe;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'pin_color')
  final String? pinColor;
  @JsonKey(name: 'user_id')
  final String? userId;
  static const fromJsonFactory = _$MyPersonalityPinFromJson;
  static const toJsonFactory = _$MyPersonalityPinToJson;
  Map<String, dynamic> toJson() => _$MyPersonalityPinToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPersonalityPin &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.describe, describe) ||
                const DeepCollectionEquality()
                    .equals(other.describe, describe)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.pinColor, pinColor) ||
                const DeepCollectionEquality()
                    .equals(other.pinColor, pinColor)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(describe) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(pinColor) ^
      const DeepCollectionEquality().hash(userId) ^
      runtimeType.hashCode;
}

extension $MyPersonalityPinExtension on MyPersonalityPin {
  MyPersonalityPin copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? describe,
      String? address,
      String? latitude,
      String? longitude,
      String? pinColor,
      String? userId}) {
    return MyPersonalityPin(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        describe: describe ?? this.describe,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        pinColor: pinColor ?? this.pinColor,
        userId: userId ?? this.userId);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivityType {
  ActivityType({
    this.id,
    this.activityId,
    this.name,
    this.colour,
  });

  factory ActivityType.fromJson(Map<String, dynamic> json) =>
      _$ActivityTypeFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'activity_id')
  final int? activityId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'colour')
  final String? colour;
  static const fromJsonFactory = _$ActivityTypeFromJson;
  static const toJsonFactory = _$ActivityTypeToJson;
  Map<String, dynamic> toJson() => _$ActivityTypeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivityType &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.activityId, activityId) ||
                const DeepCollectionEquality()
                    .equals(other.activityId, activityId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.colour, colour) ||
                const DeepCollectionEquality().equals(other.colour, colour)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(activityId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(colour) ^
      runtimeType.hashCode;
}

extension $ActivityTypeExtension on ActivityType {
  ActivityType copyWith(
      {int? id, int? activityId, String? name, String? colour}) {
    return ActivityType(
        id: id ?? this.id,
        activityId: activityId ?? this.activityId,
        name: name ?? this.name,
        colour: colour ?? this.colour);
  }
}

@JsonSerializable(explicitToJson: true)
class BigFiveTestResult {
  BigFiveTestResult({
    this.question,
    this.letter,
    this.score,
    this.description,
  });

  factory BigFiveTestResult.fromJson(Map<String, dynamic> json) =>
      _$BigFiveTestResultFromJson(json);

  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'letter')
  final String? letter;
  @JsonKey(name: 'score')
  final int? score;
  @JsonKey(name: 'description')
  final String? description;
  static const fromJsonFactory = _$BigFiveTestResultFromJson;
  static const toJsonFactory = _$BigFiveTestResultToJson;
  Map<String, dynamic> toJson() => _$BigFiveTestResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BigFiveTestResult &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.letter, letter) ||
                const DeepCollectionEquality().equals(other.letter, letter)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(letter) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $BigFiveTestResultExtension on BigFiveTestResult {
  BigFiveTestResult copyWith(
      {String? question, String? letter, int? score, String? description}) {
    return BigFiveTestResult(
        question: question ?? this.question,
        letter: letter ?? this.letter,
        score: score ?? this.score,
        description: description ?? this.description);
  }
}

@JsonSerializable(explicitToJson: true)
class DiaryStats {
  DiaryStats({
    this.avarageMode,
    this.avarageActivity,
    this.avaragePlaces,
  });

  factory DiaryStats.fromJson(Map<String, dynamic> json) =>
      _$DiaryStatsFromJson(json);

  @JsonKey(name: 'avarage_mode')
  final Mood? avarageMode;
  @JsonKey(name: 'avarage_activity')
  final Activity? avarageActivity;
  @JsonKey(name: 'avarage_places')
  final Place? avaragePlaces;
  static const fromJsonFactory = _$DiaryStatsFromJson;
  static const toJsonFactory = _$DiaryStatsToJson;
  Map<String, dynamic> toJson() => _$DiaryStatsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiaryStats &&
            (identical(other.avarageMode, avarageMode) ||
                const DeepCollectionEquality()
                    .equals(other.avarageMode, avarageMode)) &&
            (identical(other.avarageActivity, avarageActivity) ||
                const DeepCollectionEquality()
                    .equals(other.avarageActivity, avarageActivity)) &&
            (identical(other.avaragePlaces, avaragePlaces) ||
                const DeepCollectionEquality()
                    .equals(other.avaragePlaces, avaragePlaces)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(avarageMode) ^
      const DeepCollectionEquality().hash(avarageActivity) ^
      const DeepCollectionEquality().hash(avaragePlaces) ^
      runtimeType.hashCode;
}

extension $DiaryStatsExtension on DiaryStats {
  DiaryStats copyWith(
      {Mood? avarageMode, Activity? avarageActivity, Place? avaragePlaces}) {
    return DiaryStats(
        avarageMode: avarageMode ?? this.avarageMode,
        avarageActivity: avarageActivity ?? this.avarageActivity,
        avaragePlaces: avaragePlaces ?? this.avaragePlaces);
  }
}

@JsonSerializable(explicitToJson: true)
class FeelingType {
  FeelingType({
    this.id,
    this.feelingId,
    this.name,
    this.colour,
  });

  factory FeelingType.fromJson(Map<String, dynamic> json) =>
      _$FeelingTypeFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'feeling_id')
  final int? feelingId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'colour')
  final String? colour;
  static const fromJsonFactory = _$FeelingTypeFromJson;
  static const toJsonFactory = _$FeelingTypeToJson;
  Map<String, dynamic> toJson() => _$FeelingTypeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FeelingType &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.feelingId, feelingId) ||
                const DeepCollectionEquality()
                    .equals(other.feelingId, feelingId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.colour, colour) ||
                const DeepCollectionEquality().equals(other.colour, colour)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(feelingId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(colour) ^
      runtimeType.hashCode;
}

extension $FeelingTypeExtension on FeelingType {
  FeelingType copyWith(
      {int? id, int? feelingId, String? name, String? colour}) {
    return FeelingType(
        id: id ?? this.id,
        feelingId: feelingId ?? this.feelingId,
        name: name ?? this.name,
        colour: colour ?? this.colour);
  }
}

@JsonSerializable(explicitToJson: true)
class File {
  File({
    this.uuid,
    this.key,
    this.originalFilename,
    this.publicUrl,
    this.permalink,
  });

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  @JsonKey(name: 'uuid')
  final String? uuid;
  @JsonKey(name: 'key')
  final String? key;
  @JsonKey(name: 'original_filename')
  final String? originalFilename;
  @JsonKey(name: 'public_url')
  final String? publicUrl;
  @JsonKey(name: 'permalink')
  final String? permalink;
  static const fromJsonFactory = _$FileFromJson;
  static const toJsonFactory = _$FileToJson;
  Map<String, dynamic> toJson() => _$FileToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is File &&
            (identical(other.uuid, uuid) ||
                const DeepCollectionEquality().equals(other.uuid, uuid)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.originalFilename, originalFilename) ||
                const DeepCollectionEquality()
                    .equals(other.originalFilename, originalFilename)) &&
            (identical(other.publicUrl, publicUrl) ||
                const DeepCollectionEquality()
                    .equals(other.publicUrl, publicUrl)) &&
            (identical(other.permalink, permalink) ||
                const DeepCollectionEquality()
                    .equals(other.permalink, permalink)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uuid) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(originalFilename) ^
      const DeepCollectionEquality().hash(publicUrl) ^
      const DeepCollectionEquality().hash(permalink) ^
      runtimeType.hashCode;
}

extension $FileExtension on File {
  File copyWith(
      {String? uuid,
      String? key,
      String? originalFilename,
      String? publicUrl,
      String? permalink}) {
    return File(
        uuid: uuid ?? this.uuid,
        key: key ?? this.key,
        originalFilename: originalFilename ?? this.originalFilename,
        publicUrl: publicUrl ?? this.publicUrl,
        permalink: permalink ?? this.permalink);
  }
}

@JsonSerializable(explicitToJson: true)
class HappinessTestResult {
  HappinessTestResult({
    this.date,
    this.score,
  });

  factory HappinessTestResult.fromJson(Map<String, dynamic> json) =>
      _$HappinessTestResultFromJson(json);

  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'score')
  final String? score;
  static const fromJsonFactory = _$HappinessTestResultFromJson;
  static const toJsonFactory = _$HappinessTestResultToJson;
  Map<String, dynamic> toJson() => _$HappinessTestResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HappinessTestResult &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(score) ^
      runtimeType.hashCode;
}

extension $HappinessTestResultExtension on HappinessTestResult {
  HappinessTestResult copyWith({String? date, String? score}) {
    return HappinessTestResult(
        date: date ?? this.date, score: score ?? this.score);
  }
}

@JsonSerializable(explicitToJson: true)
class HexacoTestResult {
  HexacoTestResult({
    this.title,
    this.score,
    this.result,
  });

  factory HexacoTestResult.fromJson(Map<String, dynamic> json) =>
      _$HexacoTestResultFromJson(json);

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'score')
  final String? score;
  @JsonKey(name: 'result')
  final String? result;
  static const fromJsonFactory = _$HexacoTestResultFromJson;
  static const toJsonFactory = _$HexacoTestResultToJson;
  Map<String, dynamic> toJson() => _$HexacoTestResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HexacoTestResult &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(result) ^
      runtimeType.hashCode;
}

extension $HexacoTestResultExtension on HexacoTestResult {
  HexacoTestResult copyWith({String? title, String? score, String? result}) {
    return HexacoTestResult(
        title: title ?? this.title,
        score: score ?? this.score,
        result: result ?? this.result);
  }
}

@JsonSerializable(explicitToJson: true)
class IconCategory {
  IconCategory({
    this.id,
    this.name,
  });

  factory IconCategory.fromJson(Map<String, dynamic> json) =>
      _$IconCategoryFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$IconCategoryFromJson;
  static const toJsonFactory = _$IconCategoryToJson;
  Map<String, dynamic> toJson() => _$IconCategoryToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IconCategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $IconCategoryExtension on IconCategory {
  IconCategory copyWith({String? id, String? name}) {
    return IconCategory(id: id ?? this.id, name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class PushNotificationStatus {
  PushNotificationStatus({
    this.id,
    this.pushNotificationId,
    this.deviceId,
    this.seenAt,
    this.readAt,
  });

  factory PushNotificationStatus.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationStatusFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'push_notification_id')
  final int? pushNotificationId;
  @JsonKey(name: 'device_id')
  final int? deviceId;
  @JsonKey(name: 'seen_at')
  final String? seenAt;
  @JsonKey(name: 'read_at')
  final String? readAt;
  static const fromJsonFactory = _$PushNotificationStatusFromJson;
  static const toJsonFactory = _$PushNotificationStatusToJson;
  Map<String, dynamic> toJson() => _$PushNotificationStatusToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PushNotificationStatus &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.pushNotificationId, pushNotificationId) ||
                const DeepCollectionEquality()
                    .equals(other.pushNotificationId, pushNotificationId)) &&
            (identical(other.deviceId, deviceId) ||
                const DeepCollectionEquality()
                    .equals(other.deviceId, deviceId)) &&
            (identical(other.seenAt, seenAt) ||
                const DeepCollectionEquality().equals(other.seenAt, seenAt)) &&
            (identical(other.readAt, readAt) ||
                const DeepCollectionEquality().equals(other.readAt, readAt)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(pushNotificationId) ^
      const DeepCollectionEquality().hash(deviceId) ^
      const DeepCollectionEquality().hash(seenAt) ^
      const DeepCollectionEquality().hash(readAt) ^
      runtimeType.hashCode;
}

extension $PushNotificationStatusExtension on PushNotificationStatus {
  PushNotificationStatus copyWith(
      {int? id,
      int? pushNotificationId,
      int? deviceId,
      String? seenAt,
      String? readAt}) {
    return PushNotificationStatus(
        id: id ?? this.id,
        pushNotificationId: pushNotificationId ?? this.pushNotificationId,
        deviceId: deviceId ?? this.deviceId,
        seenAt: seenAt ?? this.seenAt,
        readAt: readAt ?? this.readAt);
  }
}

@JsonSerializable(explicitToJson: true)
class Gender {
  Gender({
    this.id,
    this.name,
    this.description,
    this.flag,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);

  @JsonKey(name: 'id')
  final bool? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'flag')
  final String? flag;
  static const fromJsonFactory = _$GenderFromJson;
  static const toJsonFactory = _$GenderToJson;
  Map<String, dynamic> toJson() => _$GenderToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Gender &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(flag) ^
      runtimeType.hashCode;
}

extension $GenderExtension on Gender {
  Gender copyWith({bool? id, String? name, String? description, String? flag}) {
    return Gender(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        flag: flag ?? this.flag);
  }
}

@JsonSerializable(explicitToJson: true)
class SettingsResponse {
  SettingsResponse({
    this.genders,
  });

  factory SettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsResponseFromJson(json);

  @JsonKey(name: 'genders', defaultValue: <Gender>[])
  final List<Gender>? genders;
  static const fromJsonFactory = _$SettingsResponseFromJson;
  static const toJsonFactory = _$SettingsResponseToJson;
  Map<String, dynamic> toJson() => _$SettingsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SettingsResponse &&
            (identical(other.genders, genders) ||
                const DeepCollectionEquality().equals(other.genders, genders)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(genders) ^ runtimeType.hashCode;
}

extension $SettingsResponseExtension on SettingsResponse {
  SettingsResponse copyWith({List<Gender>? genders}) {
    return SettingsResponse(genders: genders ?? this.genders);
  }
}

@JsonSerializable(explicitToJson: true)
class SharedPost {
  SharedPost({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.sharedTo,
    this.postId,
    this.description,
    this.user,
    this.sharedToUser,
    this.entry,
  });

  factory SharedPost.fromJson(Map<String, dynamic> json) =>
      _$SharedPostFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'shared_to')
  final String? sharedTo;
  @JsonKey(name: 'post_id')
  final String? postId;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'user')
  final User? user;
  @JsonKey(name: 'shared_to_user')
  final User? sharedToUser;
  @JsonKey(name: 'entry')
  final Entry? entry;
  static const fromJsonFactory = _$SharedPostFromJson;
  static const toJsonFactory = _$SharedPostToJson;
  Map<String, dynamic> toJson() => _$SharedPostToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SharedPost &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.sharedTo, sharedTo) ||
                const DeepCollectionEquality()
                    .equals(other.sharedTo, sharedTo)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.sharedToUser, sharedToUser) ||
                const DeepCollectionEquality()
                    .equals(other.sharedToUser, sharedToUser)) &&
            (identical(other.entry, entry) ||
                const DeepCollectionEquality().equals(other.entry, entry)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(sharedTo) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(sharedToUser) ^
      const DeepCollectionEquality().hash(entry) ^
      runtimeType.hashCode;
}

extension $SharedPostExtension on SharedPost {
  SharedPost copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? userId,
      String? sharedTo,
      String? postId,
      String? description,
      User? user,
      User? sharedToUser,
      Entry? entry}) {
    return SharedPost(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        sharedTo: sharedTo ?? this.sharedTo,
        postId: postId ?? this.postId,
        description: description ?? this.description,
        user: user ?? this.user,
        sharedToUser: sharedToUser ?? this.sharedToUser,
        entry: entry ?? this.entry);
  }
}

@JsonSerializable(explicitToJson: true)
class SubQuestion {
  SubQuestion({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.happynessTestId,
    this.title,
    this.parentQuestionId,
    this.description,
    this.bottomEndNote,
    this.topEndNote,
    this.orderNumber,
    this.answer,
  });

  factory SubQuestion.fromJson(Map<String, dynamic> json) =>
      _$SubQuestionFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'happyness_test_id')
  final String? happynessTestId;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'parent_question_id')
  final String? parentQuestionId;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'bottom_end_note')
  final String? bottomEndNote;
  @JsonKey(name: 'top_end_note')
  final String? topEndNote;
  @JsonKey(name: 'order_number')
  final int? orderNumber;
  @JsonKey(name: 'answer')
  final Answer? answer;
  static const fromJsonFactory = _$SubQuestionFromJson;
  static const toJsonFactory = _$SubQuestionToJson;
  Map<String, dynamic> toJson() => _$SubQuestionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubQuestion &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.happynessTestId, happynessTestId) ||
                const DeepCollectionEquality()
                    .equals(other.happynessTestId, happynessTestId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.parentQuestionId, parentQuestionId) ||
                const DeepCollectionEquality()
                    .equals(other.parentQuestionId, parentQuestionId)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.bottomEndNote, bottomEndNote) ||
                const DeepCollectionEquality()
                    .equals(other.bottomEndNote, bottomEndNote)) &&
            (identical(other.topEndNote, topEndNote) ||
                const DeepCollectionEquality()
                    .equals(other.topEndNote, topEndNote)) &&
            (identical(other.orderNumber, orderNumber) ||
                const DeepCollectionEquality()
                    .equals(other.orderNumber, orderNumber)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(happynessTestId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(parentQuestionId) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(bottomEndNote) ^
      const DeepCollectionEquality().hash(topEndNote) ^
      const DeepCollectionEquality().hash(orderNumber) ^
      const DeepCollectionEquality().hash(answer) ^
      runtimeType.hashCode;
}

extension $SubQuestionExtension on SubQuestion {
  SubQuestion copyWith(
      {String? id,
      String? createdAt,
      String? updatedAt,
      String? happynessTestId,
      String? title,
      String? parentQuestionId,
      String? description,
      String? bottomEndNote,
      String? topEndNote,
      int? orderNumber,
      Answer? answer}) {
    return SubQuestion(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        happynessTestId: happynessTestId ?? this.happynessTestId,
        title: title ?? this.title,
        parentQuestionId: parentQuestionId ?? this.parentQuestionId,
        description: description ?? this.description,
        bottomEndNote: bottomEndNote ?? this.bottomEndNote,
        topEndNote: topEndNote ?? this.topEndNote,
        orderNumber: orderNumber ?? this.orderNumber,
        answer: answer ?? this.answer);
  }
}

@JsonSerializable(explicitToJson: true)
class SuccessResponse {
  SuccessResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Object? payload;
  static const fromJsonFactory = _$SuccessResponseFromJson;
  static const toJsonFactory = _$SuccessResponseToJson;
  Map<String, dynamic> toJson() => _$SuccessResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SuccessResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $SuccessResponseExtension on SuccessResponse {
  SuccessResponse copyWith({String? message, bool? result, Object? payload}) {
    return SuccessResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class Paginator {
  Paginator({
    this.currentPage,
    this.perPage,
    this.from,
    this.to,
    this.total,
    this.lastPage,
  });

  factory Paginator.fromJson(Map<String, dynamic> json) =>
      _$PaginatorFromJson(json);

  @JsonKey(name: 'current_page')
  final double? currentPage;
  @JsonKey(name: 'per_page')
  final double? perPage;
  @JsonKey(name: 'from')
  final double? from;
  @JsonKey(name: 'to')
  final double? to;
  @JsonKey(name: 'total')
  final double? total;
  @JsonKey(name: 'last_page')
  final double? lastPage;
  static const fromJsonFactory = _$PaginatorFromJson;
  static const toJsonFactory = _$PaginatorToJson;
  Map<String, dynamic> toJson() => _$PaginatorToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Paginator &&
            (identical(other.currentPage, currentPage) ||
                const DeepCollectionEquality()
                    .equals(other.currentPage, currentPage)) &&
            (identical(other.perPage, perPage) ||
                const DeepCollectionEquality()
                    .equals(other.perPage, perPage)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.lastPage, lastPage) ||
                const DeepCollectionEquality()
                    .equals(other.lastPage, lastPage)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(currentPage) ^
      const DeepCollectionEquality().hash(perPage) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(lastPage) ^
      runtimeType.hashCode;
}

extension $PaginatorExtension on Paginator {
  Paginator copyWith(
      {double? currentPage,
      double? perPage,
      double? from,
      double? to,
      double? total,
      double? lastPage}) {
    return Paginator(
        currentPage: currentPage ?? this.currentPage,
        perPage: perPage ?? this.perPage,
        from: from ?? this.from,
        to: to ?? this.to,
        total: total ?? this.total,
        lastPage: lastPage ?? this.lastPage);
  }
}

@JsonSerializable(explicitToJson: true)
class ApiErrorUnauthorized {
  ApiErrorUnauthorized({
    this.message,
    this.result,
    this.payload,
  });

  factory ApiErrorUnauthorized.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorUnauthorizedFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Object? payload;
  static const fromJsonFactory = _$ApiErrorUnauthorizedFromJson;
  static const toJsonFactory = _$ApiErrorUnauthorizedToJson;
  Map<String, dynamic> toJson() => _$ApiErrorUnauthorizedToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiErrorUnauthorized &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ApiErrorUnauthorizedExtension on ApiErrorUnauthorized {
  ApiErrorUnauthorized copyWith(
      {String? message, bool? result, Object? payload}) {
    return ApiErrorUnauthorized(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ApiErrorAccessDenied {
  ApiErrorAccessDenied({
    this.message,
    this.result,
    this.payload,
  });

  factory ApiErrorAccessDenied.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorAccessDeniedFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Object? payload;
  static const fromJsonFactory = _$ApiErrorAccessDeniedFromJson;
  static const toJsonFactory = _$ApiErrorAccessDeniedToJson;
  Map<String, dynamic> toJson() => _$ApiErrorAccessDeniedToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiErrorAccessDenied &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ApiErrorAccessDeniedExtension on ApiErrorAccessDenied {
  ApiErrorAccessDenied copyWith(
      {String? message, bool? result, Object? payload}) {
    return ApiErrorAccessDenied(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ApiError {
  ApiError({
    this.message,
    this.result,
    this.payload,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Object? payload;
  static const fromJsonFactory = _$ApiErrorFromJson;
  static const toJsonFactory = _$ApiErrorToJson;
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApiError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ApiErrorExtension on ApiError {
  ApiError copyWith({String? message, bool? result, Object? payload}) {
    return ApiError(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class AuthRegisterResponse {
  AuthRegisterResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory AuthRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthRegisterResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory = _$AuthRegisterResponseFromJson;
  static const toJsonFactory = _$AuthRegisterResponseToJson;
  Map<String, dynamic> toJson() => _$AuthRegisterResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthRegisterResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $AuthRegisterResponseExtension on AuthRegisterResponse {
  AuthRegisterResponse copyWith(
      {String? message, bool? result, User? payload}) {
    return AuthRegisterResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class AuthLoginResponse {
  AuthLoginResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory AuthLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory = _$AuthLoginResponseFromJson;
  static const toJsonFactory = _$AuthLoginResponseToJson;
  Map<String, dynamic> toJson() => _$AuthLoginResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthLoginResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $AuthLoginResponseExtension on AuthLoginResponse {
  AuthLoginResponse copyWith({String? message, bool? result, User? payload}) {
    return AuthLoginResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class AuthSocialLoginResponse {
  AuthSocialLoginResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory AuthSocialLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthSocialLoginResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory = _$AuthSocialLoginResponseFromJson;
  static const toJsonFactory = _$AuthSocialLoginResponseToJson;
  Map<String, dynamic> toJson() => _$AuthSocialLoginResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthSocialLoginResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $AuthSocialLoginResponseExtension on AuthSocialLoginResponse {
  AuthSocialLoginResponse copyWith(
      {String? message, bool? result, User? payload}) {
    return AuthSocialLoginResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class SettingsGetSettingsResponse {
  SettingsGetSettingsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory SettingsGetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsGetSettingsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Setting>[])
  final List<Setting>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$SettingsGetSettingsResponseFromJson;
  static const toJsonFactory = _$SettingsGetSettingsResponseToJson;
  Map<String, dynamic> toJson() => _$SettingsGetSettingsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SettingsGetSettingsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $SettingsGetSettingsResponseExtension on SettingsGetSettingsResponse {
  SettingsGetSettingsResponse copyWith(
      {String? message,
      bool? result,
      List<Setting>? payload,
      Paginator? paginator}) {
    return SettingsGetSettingsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileMyProfileResponse {
  ProfileMyProfileResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory ProfileMyProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileMyProfileResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory = _$ProfileMyProfileResponseFromJson;
  static const toJsonFactory = _$ProfileMyProfileResponseToJson;
  Map<String, dynamic> toJson() => _$ProfileMyProfileResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileMyProfileResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ProfileMyProfileResponseExtension on ProfileMyProfileResponse {
  ProfileMyProfileResponse copyWith(
      {String? message, bool? result, User? payload}) {
    return ProfileMyProfileResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileMyFriendsResponse {
  ProfileMyFriendsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory ProfileMyFriendsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileMyFriendsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <User>[])
  final List<User>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$ProfileMyFriendsResponseFromJson;
  static const toJsonFactory = _$ProfileMyFriendsResponseToJson;
  Map<String, dynamic> toJson() => _$ProfileMyFriendsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileMyFriendsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $ProfileMyFriendsResponseExtension on ProfileMyFriendsResponse {
  ProfileMyFriendsResponse copyWith(
      {String? message,
      bool? result,
      List<User>? payload,
      Paginator? paginator}) {
    return ProfileMyFriendsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileMyFamilyResponse {
  ProfileMyFamilyResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory ProfileMyFamilyResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileMyFamilyResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <User>[])
  final List<User>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$ProfileMyFamilyResponseFromJson;
  static const toJsonFactory = _$ProfileMyFamilyResponseToJson;
  Map<String, dynamic> toJson() => _$ProfileMyFamilyResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileMyFamilyResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $ProfileMyFamilyResponseExtension on ProfileMyFamilyResponse {
  ProfileMyFamilyResponse copyWith(
      {String? message,
      bool? result,
      List<User>? payload,
      Paginator? paginator}) {
    return ProfileMyFamilyResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileMyFriendRequestsResponse {
  ProfileMyFriendRequestsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory ProfileMyFriendRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileMyFriendRequestsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <User>[])
  final List<User>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$ProfileMyFriendRequestsResponseFromJson;
  static const toJsonFactory = _$ProfileMyFriendRequestsResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ProfileMyFriendRequestsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileMyFriendRequestsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $ProfileMyFriendRequestsResponseExtension
    on ProfileMyFriendRequestsResponse {
  ProfileMyFriendRequestsResponse copyWith(
      {String? message,
      bool? result,
      List<User>? payload,
      Paginator? paginator}) {
    return ProfileMyFriendRequestsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileMyFamilyRequestsResponse {
  ProfileMyFamilyRequestsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory ProfileMyFamilyRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileMyFamilyRequestsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <User>[])
  final List<User>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$ProfileMyFamilyRequestsResponseFromJson;
  static const toJsonFactory = _$ProfileMyFamilyRequestsResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ProfileMyFamilyRequestsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileMyFamilyRequestsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $ProfileMyFamilyRequestsResponseExtension
    on ProfileMyFamilyRequestsResponse {
  ProfileMyFamilyRequestsResponse copyWith(
      {String? message,
      bool? result,
      List<User>? payload,
      Paginator? paginator}) {
    return ProfileMyFamilyRequestsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileUpdateMyProfileResponse {
  ProfileUpdateMyProfileResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory ProfileUpdateMyProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateMyProfileResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory = _$ProfileUpdateMyProfileResponseFromJson;
  static const toJsonFactory = _$ProfileUpdateMyProfileResponseToJson;
  Map<String, dynamic> toJson() => _$ProfileUpdateMyProfileResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileUpdateMyProfileResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ProfileUpdateMyProfileResponseExtension
    on ProfileUpdateMyProfileResponse {
  ProfileUpdateMyProfileResponse copyWith(
      {String? message, bool? result, User? payload}) {
    return ProfileUpdateMyProfileResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileHideProfileUpdateMessageResponse {
  ProfileHideProfileUpdateMessageResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory ProfileHideProfileUpdateMessageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ProfileHideProfileUpdateMessageResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory =
      _$ProfileHideProfileUpdateMessageResponseFromJson;
  static const toJsonFactory = _$ProfileHideProfileUpdateMessageResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ProfileHideProfileUpdateMessageResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileHideProfileUpdateMessageResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ProfileHideProfileUpdateMessageResponseExtension
    on ProfileHideProfileUpdateMessageResponse {
  ProfileHideProfileUpdateMessageResponse copyWith(
      {String? message, bool? result, User? payload}) {
    return ProfileHideProfileUpdateMessageResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileUpdateMyProfileSettingsResponse {
  ProfileUpdateMyProfileSettingsResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory ProfileUpdateMyProfileSettingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ProfileUpdateMyProfileSettingsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory =
      _$ProfileUpdateMyProfileSettingsResponseFromJson;
  static const toJsonFactory = _$ProfileUpdateMyProfileSettingsResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ProfileUpdateMyProfileSettingsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileUpdateMyProfileSettingsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ProfileUpdateMyProfileSettingsResponseExtension
    on ProfileUpdateMyProfileSettingsResponse {
  ProfileUpdateMyProfileSettingsResponse copyWith(
      {String? message, bool? result, User? payload}) {
    return ProfileUpdateMyProfileSettingsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileUpdateMyAvatarResponse {
  ProfileUpdateMyAvatarResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory ProfileUpdateMyAvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateMyAvatarResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory = _$ProfileUpdateMyAvatarResponseFromJson;
  static const toJsonFactory = _$ProfileUpdateMyAvatarResponseToJson;
  Map<String, dynamic> toJson() => _$ProfileUpdateMyAvatarResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileUpdateMyAvatarResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ProfileUpdateMyAvatarResponseExtension
    on ProfileUpdateMyAvatarResponse {
  ProfileUpdateMyAvatarResponse copyWith(
      {String? message, bool? result, User? payload}) {
    return ProfileUpdateMyAvatarResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileUpdateMyCoverImageResponse {
  ProfileUpdateMyCoverImageResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory ProfileUpdateMyCoverImageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ProfileUpdateMyCoverImageResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final User? payload;
  static const fromJsonFactory = _$ProfileUpdateMyCoverImageResponseFromJson;
  static const toJsonFactory = _$ProfileUpdateMyCoverImageResponseToJson;
  Map<String, dynamic> toJson() =>
      _$ProfileUpdateMyCoverImageResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileUpdateMyCoverImageResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ProfileUpdateMyCoverImageResponseExtension
    on ProfileUpdateMyCoverImageResponse {
  ProfileUpdateMyCoverImageResponse copyWith(
      {String? message, bool? result, User? payload}) {
    return ProfileUpdateMyCoverImageResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class MoodsListResponse {
  MoodsListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MoodsListResponse.fromJson(Map<String, dynamic> json) =>
      _$MoodsListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Mood>[])
  final List<Mood>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$MoodsListResponseFromJson;
  static const toJsonFactory = _$MoodsListResponseToJson;
  Map<String, dynamic> toJson() => _$MoodsListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MoodsListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MoodsListResponseExtension on MoodsListResponse {
  MoodsListResponse copyWith(
      {String? message,
      bool? result,
      List<Mood>? payload,
      Paginator? paginator}) {
    return MoodsListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class MoodsViewResponse {
  MoodsViewResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory MoodsViewResponse.fromJson(Map<String, dynamic> json) =>
      _$MoodsViewResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Mood? payload;
  static const fromJsonFactory = _$MoodsViewResponseFromJson;
  static const toJsonFactory = _$MoodsViewResponseToJson;
  Map<String, dynamic> toJson() => _$MoodsViewResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MoodsViewResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $MoodsViewResponseExtension on MoodsViewResponse {
  MoodsViewResponse copyWith({String? message, bool? result, Mood? payload}) {
    return MoodsViewResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class MoodsTypesResponse {
  MoodsTypesResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MoodsTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoodsTypesResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <MoodType>[])
  final List<MoodType>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$MoodsTypesResponseFromJson;
  static const toJsonFactory = _$MoodsTypesResponseToJson;
  Map<String, dynamic> toJson() => _$MoodsTypesResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MoodsTypesResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MoodsTypesResponseExtension on MoodsTypesResponse {
  MoodsTypesResponse copyWith(
      {String? message,
      bool? result,
      List<MoodType>? payload,
      Paginator? paginator}) {
    return MoodsTypesResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class PlacesListResponse {
  PlacesListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory PlacesListResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacesListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Place>[])
  final List<Place>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$PlacesListResponseFromJson;
  static const toJsonFactory = _$PlacesListResponseToJson;
  Map<String, dynamic> toJson() => _$PlacesListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlacesListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $PlacesListResponseExtension on PlacesListResponse {
  PlacesListResponse copyWith(
      {String? message,
      bool? result,
      List<Place>? payload,
      Paginator? paginator}) {
    return PlacesListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class PlacesViewResponse {
  PlacesViewResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory PlacesViewResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacesViewResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Place? payload;
  static const fromJsonFactory = _$PlacesViewResponseFromJson;
  static const toJsonFactory = _$PlacesViewResponseToJson;
  Map<String, dynamic> toJson() => _$PlacesViewResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlacesViewResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $PlacesViewResponseExtension on PlacesViewResponse {
  PlacesViewResponse copyWith({String? message, bool? result, Place? payload}) {
    return PlacesViewResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class PlacesTypesResponse {
  PlacesTypesResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory PlacesTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacesTypesResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <PlaceType>[])
  final List<PlaceType>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$PlacesTypesResponseFromJson;
  static const toJsonFactory = _$PlacesTypesResponseToJson;
  Map<String, dynamic> toJson() => _$PlacesTypesResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlacesTypesResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $PlacesTypesResponseExtension on PlacesTypesResponse {
  PlacesTypesResponse copyWith(
      {String? message,
      bool? result,
      List<PlaceType>? payload,
      Paginator? paginator}) {
    return PlacesTypesResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivitiesListResponse {
  ActivitiesListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory ActivitiesListResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Activity>[])
  final List<Activity>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$ActivitiesListResponseFromJson;
  static const toJsonFactory = _$ActivitiesListResponseToJson;
  Map<String, dynamic> toJson() => _$ActivitiesListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivitiesListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $ActivitiesListResponseExtension on ActivitiesListResponse {
  ActivitiesListResponse copyWith(
      {String? message,
      bool? result,
      List<Activity>? payload,
      Paginator? paginator}) {
    return ActivitiesListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivitiesViewResponse {
  ActivitiesViewResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory ActivitiesViewResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesViewResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Activity? payload;
  static const fromJsonFactory = _$ActivitiesViewResponseFromJson;
  static const toJsonFactory = _$ActivitiesViewResponseToJson;
  Map<String, dynamic> toJson() => _$ActivitiesViewResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivitiesViewResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ActivitiesViewResponseExtension on ActivitiesViewResponse {
  ActivitiesViewResponse copyWith(
      {String? message, bool? result, Activity? payload}) {
    return ActivitiesViewResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivitiesTypesResponse {
  ActivitiesTypesResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory ActivitiesTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesTypesResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <ActivityType>[])
  final List<ActivityType>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$ActivitiesTypesResponseFromJson;
  static const toJsonFactory = _$ActivitiesTypesResponseToJson;
  Map<String, dynamic> toJson() => _$ActivitiesTypesResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivitiesTypesResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $ActivitiesTypesResponseExtension on ActivitiesTypesResponse {
  ActivitiesTypesResponse copyWith(
      {String? message,
      bool? result,
      List<ActivityType>? payload,
      Paginator? paginator}) {
    return ActivitiesTypesResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class FeelingsListResponse {
  FeelingsListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory FeelingsListResponse.fromJson(Map<String, dynamic> json) =>
      _$FeelingsListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Feeling>[])
  final List<Feeling>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$FeelingsListResponseFromJson;
  static const toJsonFactory = _$FeelingsListResponseToJson;
  Map<String, dynamic> toJson() => _$FeelingsListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FeelingsListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $FeelingsListResponseExtension on FeelingsListResponse {
  FeelingsListResponse copyWith(
      {String? message,
      bool? result,
      List<Feeling>? payload,
      Paginator? paginator}) {
    return FeelingsListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class FeelingsViewResponse {
  FeelingsViewResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory FeelingsViewResponse.fromJson(Map<String, dynamic> json) =>
      _$FeelingsViewResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Feeling? payload;
  static const fromJsonFactory = _$FeelingsViewResponseFromJson;
  static const toJsonFactory = _$FeelingsViewResponseToJson;
  Map<String, dynamic> toJson() => _$FeelingsViewResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FeelingsViewResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $FeelingsViewResponseExtension on FeelingsViewResponse {
  FeelingsViewResponse copyWith(
      {String? message, bool? result, Feeling? payload}) {
    return FeelingsViewResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class FeelingsTypesResponse {
  FeelingsTypesResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory FeelingsTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$FeelingsTypesResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <FeelingType>[])
  final List<FeelingType>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$FeelingsTypesResponseFromJson;
  static const toJsonFactory = _$FeelingsTypesResponseToJson;
  Map<String, dynamic> toJson() => _$FeelingsTypesResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FeelingsTypesResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $FeelingsTypesResponseExtension on FeelingsTypesResponse {
  FeelingsTypesResponse copyWith(
      {String? message,
      bool? result,
      List<FeelingType>? payload,
      Paginator? paginator}) {
    return FeelingsTypesResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class FeelingsListRatingsResponse {
  FeelingsListRatingsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory FeelingsListRatingsResponse.fromJson(Map<String, dynamic> json) =>
      _$FeelingsListRatingsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <FeelingRating>[])
  final List<FeelingRating>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$FeelingsListRatingsResponseFromJson;
  static const toJsonFactory = _$FeelingsListRatingsResponseToJson;
  Map<String, dynamic> toJson() => _$FeelingsListRatingsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FeelingsListRatingsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $FeelingsListRatingsResponseExtension on FeelingsListRatingsResponse {
  FeelingsListRatingsResponse copyWith(
      {String? message,
      bool? result,
      List<FeelingRating>? payload,
      Paginator? paginator}) {
    return FeelingsListRatingsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class VisitedPlacesListResponse {
  VisitedPlacesListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory VisitedPlacesListResponse.fromJson(Map<String, dynamic> json) =>
      _$VisitedPlacesListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <VisitedPlace>[])
  final List<VisitedPlace>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$VisitedPlacesListResponseFromJson;
  static const toJsonFactory = _$VisitedPlacesListResponseToJson;
  Map<String, dynamic> toJson() => _$VisitedPlacesListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisitedPlacesListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $VisitedPlacesListResponseExtension on VisitedPlacesListResponse {
  VisitedPlacesListResponse copyWith(
      {String? message,
      bool? result,
      List<VisitedPlace>? payload,
      Paginator? paginator}) {
    return VisitedPlacesListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class VisitedPlacesSaveResponse {
  VisitedPlacesSaveResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory VisitedPlacesSaveResponse.fromJson(Map<String, dynamic> json) =>
      _$VisitedPlacesSaveResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final VisitedPlace? payload;
  static const fromJsonFactory = _$VisitedPlacesSaveResponseFromJson;
  static const toJsonFactory = _$VisitedPlacesSaveResponseToJson;
  Map<String, dynamic> toJson() => _$VisitedPlacesSaveResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisitedPlacesSaveResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $VisitedPlacesSaveResponseExtension on VisitedPlacesSaveResponse {
  VisitedPlacesSaveResponse copyWith(
      {String? message, bool? result, VisitedPlace? payload}) {
    return VisitedPlacesSaveResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class VisitedPlacesSaveFeelingResponse {
  VisitedPlacesSaveFeelingResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory VisitedPlacesSaveFeelingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$VisitedPlacesSaveFeelingResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final VisitedPlace? payload;
  static const fromJsonFactory = _$VisitedPlacesSaveFeelingResponseFromJson;
  static const toJsonFactory = _$VisitedPlacesSaveFeelingResponseToJson;
  Map<String, dynamic> toJson() =>
      _$VisitedPlacesSaveFeelingResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisitedPlacesSaveFeelingResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $VisitedPlacesSaveFeelingResponseExtension
    on VisitedPlacesSaveFeelingResponse {
  VisitedPlacesSaveFeelingResponse copyWith(
      {String? message, bool? result, VisitedPlace? payload}) {
    return VisitedPlacesSaveFeelingResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class MyActivitiesStoreMyActivityLocationResponse {
  MyActivitiesStoreMyActivityLocationResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory MyActivitiesStoreMyActivityLocationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MyActivitiesStoreMyActivityLocationResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final ActivityLocation? payload;
  static const fromJsonFactory =
      _$MyActivitiesStoreMyActivityLocationResponseFromJson;
  static const toJsonFactory =
      _$MyActivitiesStoreMyActivityLocationResponseToJson;
  Map<String, dynamic> toJson() =>
      _$MyActivitiesStoreMyActivityLocationResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyActivitiesStoreMyActivityLocationResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $MyActivitiesStoreMyActivityLocationResponseExtension
    on MyActivitiesStoreMyActivityLocationResponse {
  MyActivitiesStoreMyActivityLocationResponse copyWith(
      {String? message, bool? result, ActivityLocation? payload}) {
    return MyActivitiesStoreMyActivityLocationResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class MyActivitiesSearchResponse {
  MyActivitiesSearchResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MyActivitiesSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$MyActivitiesSearchResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <ActivityLocation>[])
  final List<ActivityLocation>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$MyActivitiesSearchResponseFromJson;
  static const toJsonFactory = _$MyActivitiesSearchResponseToJson;
  Map<String, dynamic> toJson() => _$MyActivitiesSearchResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyActivitiesSearchResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MyActivitiesSearchResponseExtension on MyActivitiesSearchResponse {
  MyActivitiesSearchResponse copyWith(
      {String? message,
      bool? result,
      List<ActivityLocation>? payload,
      Paginator? paginator}) {
    return MyActivitiesSearchResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class HappynessOptionsListResponse {
  HappynessOptionsListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory HappynessOptionsListResponse.fromJson(Map<String, dynamic> json) =>
      _$HappynessOptionsListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <HappynessOption>[])
  final List<HappynessOption>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$HappynessOptionsListResponseFromJson;
  static const toJsonFactory = _$HappynessOptionsListResponseToJson;
  Map<String, dynamic> toJson() => _$HappynessOptionsListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HappynessOptionsListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $HappynessOptionsListResponseExtension
    on HappynessOptionsListResponse {
  HappynessOptionsListResponse copyWith(
      {String? message,
      bool? result,
      List<HappynessOption>? payload,
      Paginator? paginator}) {
    return HappynessOptionsListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class HappynessTestsQuestionsResponse {
  HappynessTestsQuestionsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory HappynessTestsQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$HappynessTestsQuestionsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Question>[])
  final List<Question>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$HappynessTestsQuestionsResponseFromJson;
  static const toJsonFactory = _$HappynessTestsQuestionsResponseToJson;
  Map<String, dynamic> toJson() =>
      _$HappynessTestsQuestionsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HappynessTestsQuestionsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $HappynessTestsQuestionsResponseExtension
    on HappynessTestsQuestionsResponse {
  HappynessTestsQuestionsResponse copyWith(
      {String? message,
      bool? result,
      List<Question>? payload,
      Paginator? paginator}) {
    return HappynessTestsQuestionsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class TestResultsGetBigFiveTestResultsResponse {
  TestResultsGetBigFiveTestResultsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory TestResultsGetBigFiveTestResultsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TestResultsGetBigFiveTestResultsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <BigFiveTestResult>[])
  final List<BigFiveTestResult>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory =
      _$TestResultsGetBigFiveTestResultsResponseFromJson;
  static const toJsonFactory = _$TestResultsGetBigFiveTestResultsResponseToJson;
  Map<String, dynamic> toJson() =>
      _$TestResultsGetBigFiveTestResultsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TestResultsGetBigFiveTestResultsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $TestResultsGetBigFiveTestResultsResponseExtension
    on TestResultsGetBigFiveTestResultsResponse {
  TestResultsGetBigFiveTestResultsResponse copyWith(
      {String? message,
      bool? result,
      List<BigFiveTestResult>? payload,
      Paginator? paginator}) {
    return TestResultsGetBigFiveTestResultsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class TestResultsGetHEXACOTestResultsResponse {
  TestResultsGetHEXACOTestResultsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory TestResultsGetHEXACOTestResultsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TestResultsGetHEXACOTestResultsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <HexacoTestResult>[])
  final List<HexacoTestResult>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory =
      _$TestResultsGetHEXACOTestResultsResponseFromJson;
  static const toJsonFactory = _$TestResultsGetHEXACOTestResultsResponseToJson;
  Map<String, dynamic> toJson() =>
      _$TestResultsGetHEXACOTestResultsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TestResultsGetHEXACOTestResultsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $TestResultsGetHEXACOTestResultsResponseExtension
    on TestResultsGetHEXACOTestResultsResponse {
  TestResultsGetHEXACOTestResultsResponse copyWith(
      {String? message,
      bool? result,
      List<HexacoTestResult>? payload,
      Paginator? paginator}) {
    return TestResultsGetHEXACOTestResultsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class TestResultsGetHappinessTestResultsResponse {
  TestResultsGetHappinessTestResultsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory TestResultsGetHappinessTestResultsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$TestResultsGetHappinessTestResultsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <HappinessTestResult>[])
  final List<HappinessTestResult>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory =
      _$TestResultsGetHappinessTestResultsResponseFromJson;
  static const toJsonFactory =
      _$TestResultsGetHappinessTestResultsResponseToJson;
  Map<String, dynamic> toJson() =>
      _$TestResultsGetHappinessTestResultsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TestResultsGetHappinessTestResultsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $TestResultsGetHappinessTestResultsResponseExtension
    on TestResultsGetHappinessTestResultsResponse {
  TestResultsGetHappinessTestResultsResponse copyWith(
      {String? message,
      bool? result,
      List<HappinessTestResult>? payload,
      Paginator? paginator}) {
    return TestResultsGetHappinessTestResultsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class HappynessTestsListResponse {
  HappynessTestsListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory HappynessTestsListResponse.fromJson(Map<String, dynamic> json) =>
      _$HappynessTestsListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <HappynessTest>[])
  final List<HappynessTest>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$HappynessTestsListResponseFromJson;
  static const toJsonFactory = _$HappynessTestsListResponseToJson;
  Map<String, dynamic> toJson() => _$HappynessTestsListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HappynessTestsListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $HappynessTestsListResponseExtension on HappynessTestsListResponse {
  HappynessTestsListResponse copyWith(
      {String? message,
      bool? result,
      List<HappynessTest>? payload,
      Paginator? paginator}) {
    return HappynessTestsListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class UsersSearchResponse {
  UsersSearchResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory UsersSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersSearchResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <User>[])
  final List<User>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$UsersSearchResponseFromJson;
  static const toJsonFactory = _$UsersSearchResponseToJson;
  Map<String, dynamic> toJson() => _$UsersSearchResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UsersSearchResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $UsersSearchResponseExtension on UsersSearchResponse {
  UsersSearchResponse copyWith(
      {String? message,
      bool? result,
      List<User>? payload,
      Paginator? paginator}) {
    return UsersSearchResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class UsersAgeGroupsResponse {
  UsersAgeGroupsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory UsersAgeGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersAgeGroupsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <AgeGroup>[])
  final List<AgeGroup>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$UsersAgeGroupsResponseFromJson;
  static const toJsonFactory = _$UsersAgeGroupsResponseToJson;
  Map<String, dynamic> toJson() => _$UsersAgeGroupsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UsersAgeGroupsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $UsersAgeGroupsResponseExtension on UsersAgeGroupsResponse {
  UsersAgeGroupsResponse copyWith(
      {String? message,
      bool? result,
      List<AgeGroup>? payload,
      Paginator? paginator}) {
    return UsersAgeGroupsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class FriendAddFriendOrFamilyResponse {
  FriendAddFriendOrFamilyResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory FriendAddFriendOrFamilyResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendAddFriendOrFamilyResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Friend? payload;
  static const fromJsonFactory = _$FriendAddFriendOrFamilyResponseFromJson;
  static const toJsonFactory = _$FriendAddFriendOrFamilyResponseToJson;
  Map<String, dynamic> toJson() =>
      _$FriendAddFriendOrFamilyResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FriendAddFriendOrFamilyResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $FriendAddFriendOrFamilyResponseExtension
    on FriendAddFriendOrFamilyResponse {
  FriendAddFriendOrFamilyResponse copyWith(
      {String? message, bool? result, Friend? payload}) {
    return FriendAddFriendOrFamilyResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class FriendAcceptFriendOrFamilyRequestResponse {
  FriendAcceptFriendOrFamilyRequestResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory FriendAcceptFriendOrFamilyRequestResponse.fromJson(
          Map<String, dynamic> json) =>
      _$FriendAcceptFriendOrFamilyRequestResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Friend? payload;
  static const fromJsonFactory =
      _$FriendAcceptFriendOrFamilyRequestResponseFromJson;
  static const toJsonFactory =
      _$FriendAcceptFriendOrFamilyRequestResponseToJson;
  Map<String, dynamic> toJson() =>
      _$FriendAcceptFriendOrFamilyRequestResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FriendAcceptFriendOrFamilyRequestResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $FriendAcceptFriendOrFamilyRequestResponseExtension
    on FriendAcceptFriendOrFamilyRequestResponse {
  FriendAcceptFriendOrFamilyRequestResponse copyWith(
      {String? message, bool? result, Friend? payload}) {
    return FriendAcceptFriendOrFamilyRequestResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class FriendRejectFriendOrFamilyRequestResponse {
  FriendRejectFriendOrFamilyRequestResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory FriendRejectFriendOrFamilyRequestResponse.fromJson(
          Map<String, dynamic> json) =>
      _$FriendRejectFriendOrFamilyRequestResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Friend? payload;
  static const fromJsonFactory =
      _$FriendRejectFriendOrFamilyRequestResponseFromJson;
  static const toJsonFactory =
      _$FriendRejectFriendOrFamilyRequestResponseToJson;
  Map<String, dynamic> toJson() =>
      _$FriendRejectFriendOrFamilyRequestResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FriendRejectFriendOrFamilyRequestResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $FriendRejectFriendOrFamilyRequestResponseExtension
    on FriendRejectFriendOrFamilyRequestResponse {
  FriendRejectFriendOrFamilyRequestResponse copyWith(
      {String? message, bool? result, Friend? payload}) {
    return FriendRejectFriendOrFamilyRequestResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class EntriesIndexEntriesExplorerResponse {
  EntriesIndexEntriesExplorerResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory EntriesIndexEntriesExplorerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$EntriesIndexEntriesExplorerResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Entry>[])
  final List<Entry>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$EntriesIndexEntriesExplorerResponseFromJson;
  static const toJsonFactory = _$EntriesIndexEntriesExplorerResponseToJson;
  Map<String, dynamic> toJson() =>
      _$EntriesIndexEntriesExplorerResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EntriesIndexEntriesExplorerResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $EntriesIndexEntriesExplorerResponseExtension
    on EntriesIndexEntriesExplorerResponse {
  EntriesIndexEntriesExplorerResponse copyWith(
      {String? message,
      bool? result,
      List<Entry>? payload,
      Paginator? paginator}) {
    return EntriesIndexEntriesExplorerResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class EntriesStoreResponse {
  EntriesStoreResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory EntriesStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$EntriesStoreResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Entry? payload;
  static const fromJsonFactory = _$EntriesStoreResponseFromJson;
  static const toJsonFactory = _$EntriesStoreResponseToJson;
  Map<String, dynamic> toJson() => _$EntriesStoreResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EntriesStoreResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $EntriesStoreResponseExtension on EntriesStoreResponse {
  EntriesStoreResponse copyWith(
      {String? message, bool? result, Entry? payload}) {
    return EntriesStoreResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class EntriesListResponse {
  EntriesListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory EntriesListResponse.fromJson(Map<String, dynamic> json) =>
      _$EntriesListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Entry>[])
  final List<Entry>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$EntriesListResponseFromJson;
  static const toJsonFactory = _$EntriesListResponseToJson;
  Map<String, dynamic> toJson() => _$EntriesListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EntriesListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $EntriesListResponseExtension on EntriesListResponse {
  EntriesListResponse copyWith(
      {String? message,
      bool? result,
      List<Entry>? payload,
      Paginator? paginator}) {
    return EntriesListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class EntriesUpdateResponse {
  EntriesUpdateResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory EntriesUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$EntriesUpdateResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Entry? payload;
  static const fromJsonFactory = _$EntriesUpdateResponseFromJson;
  static const toJsonFactory = _$EntriesUpdateResponseToJson;
  Map<String, dynamic> toJson() => _$EntriesUpdateResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EntriesUpdateResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $EntriesUpdateResponseExtension on EntriesUpdateResponse {
  EntriesUpdateResponse copyWith(
      {String? message, bool? result, Entry? payload}) {
    return EntriesUpdateResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class EntriesGetSharedPostsResponse {
  EntriesGetSharedPostsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory EntriesGetSharedPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$EntriesGetSharedPostsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <SharedPost>[])
  final List<SharedPost>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$EntriesGetSharedPostsResponseFromJson;
  static const toJsonFactory = _$EntriesGetSharedPostsResponseToJson;
  Map<String, dynamic> toJson() => _$EntriesGetSharedPostsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EntriesGetSharedPostsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $EntriesGetSharedPostsResponseExtension
    on EntriesGetSharedPostsResponse {
  EntriesGetSharedPostsResponse copyWith(
      {String? message,
      bool? result,
      List<SharedPost>? payload,
      Paginator? paginator}) {
    return EntriesGetSharedPostsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class EntriesShareAPostsResponse {
  EntriesShareAPostsResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory EntriesShareAPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$EntriesShareAPostsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final SharedPost? payload;
  static const fromJsonFactory = _$EntriesShareAPostsResponseFromJson;
  static const toJsonFactory = _$EntriesShareAPostsResponseToJson;
  Map<String, dynamic> toJson() => _$EntriesShareAPostsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EntriesShareAPostsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $EntriesShareAPostsResponseExtension on EntriesShareAPostsResponse {
  EntriesShareAPostsResponse copyWith(
      {String? message, bool? result, SharedPost? payload}) {
    return EntriesShareAPostsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class ImageStoreImageResponse {
  ImageStoreImageResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory ImageStoreImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageStoreImageResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Image? payload;
  static const fromJsonFactory = _$ImageStoreImageResponseFromJson;
  static const toJsonFactory = _$ImageStoreImageResponseToJson;
  Map<String, dynamic> toJson() => _$ImageStoreImageResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ImageStoreImageResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $ImageStoreImageResponseExtension on ImageStoreImageResponse {
  ImageStoreImageResponse copyWith(
      {String? message, bool? result, Image? payload}) {
    return ImageStoreImageResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlacesAddMyPlaceResponse {
  MyPlacesAddMyPlaceResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MyPlacesAddMyPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPlacesAddMyPlaceResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <MyPlace>[])
  final List<MyPlace>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$MyPlacesAddMyPlaceResponseFromJson;
  static const toJsonFactory = _$MyPlacesAddMyPlaceResponseToJson;
  Map<String, dynamic> toJson() => _$MyPlacesAddMyPlaceResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlacesAddMyPlaceResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MyPlacesAddMyPlaceResponseExtension on MyPlacesAddMyPlaceResponse {
  MyPlacesAddMyPlaceResponse copyWith(
      {String? message,
      bool? result,
      List<MyPlace>? payload,
      Paginator? paginator}) {
    return MyPlacesAddMyPlaceResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlacesListResponse {
  MyPlacesListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MyPlacesListResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPlacesListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <MyPlace>[])
  final List<MyPlace>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$MyPlacesListResponseFromJson;
  static const toJsonFactory = _$MyPlacesListResponseToJson;
  Map<String, dynamic> toJson() => _$MyPlacesListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlacesListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MyPlacesListResponseExtension on MyPlacesListResponse {
  MyPlacesListResponse copyWith(
      {String? message,
      bool? result,
      List<MyPlace>? payload,
      Paginator? paginator}) {
    return MyPlacesListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlaceCategoriesMyPlaceCategoriesResponse {
  MyPlaceCategoriesMyPlaceCategoriesResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MyPlaceCategoriesMyPlaceCategoriesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MyPlaceCategoriesMyPlaceCategoriesResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <MyPlaceCategory>[])
  final List<MyPlaceCategory>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory =
      _$MyPlaceCategoriesMyPlaceCategoriesResponseFromJson;
  static const toJsonFactory =
      _$MyPlaceCategoriesMyPlaceCategoriesResponseToJson;
  Map<String, dynamic> toJson() =>
      _$MyPlaceCategoriesMyPlaceCategoriesResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlaceCategoriesMyPlaceCategoriesResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MyPlaceCategoriesMyPlaceCategoriesResponseExtension
    on MyPlaceCategoriesMyPlaceCategoriesResponse {
  MyPlaceCategoriesMyPlaceCategoriesResponse copyWith(
      {String? message,
      bool? result,
      List<MyPlaceCategory>? payload,
      Paginator? paginator}) {
    return MyPlaceCategoriesMyPlaceCategoriesResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlacesMyPlaceOpinionsResponse {
  MyPlacesMyPlaceOpinionsResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MyPlacesMyPlaceOpinionsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPlacesMyPlaceOpinionsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <MyPlaceOpinion>[])
  final List<MyPlaceOpinion>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$MyPlacesMyPlaceOpinionsResponseFromJson;
  static const toJsonFactory = _$MyPlacesMyPlaceOpinionsResponseToJson;
  Map<String, dynamic> toJson() =>
      _$MyPlacesMyPlaceOpinionsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlacesMyPlaceOpinionsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MyPlacesMyPlaceOpinionsResponseExtension
    on MyPlacesMyPlaceOpinionsResponse {
  MyPlacesMyPlaceOpinionsResponse copyWith(
      {String? message,
      bool? result,
      List<MyPlaceOpinion>? payload,
      Paginator? paginator}) {
    return MyPlacesMyPlaceOpinionsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class DiariesStoreResponse {
  DiariesStoreResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory DiariesStoreResponse.fromJson(Map<String, dynamic> json) =>
      _$DiariesStoreResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Diary>[])
  final List<Diary>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$DiariesStoreResponseFromJson;
  static const toJsonFactory = _$DiariesStoreResponseToJson;
  Map<String, dynamic> toJson() => _$DiariesStoreResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiariesStoreResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $DiariesStoreResponseExtension on DiariesStoreResponse {
  DiariesStoreResponse copyWith(
      {String? message,
      bool? result,
      List<Diary>? payload,
      Paginator? paginator}) {
    return DiariesStoreResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class DiariesListResponse {
  DiariesListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory DiariesListResponse.fromJson(Map<String, dynamic> json) =>
      _$DiariesListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Diary>[])
  final List<Diary>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$DiariesListResponseFromJson;
  static const toJsonFactory = _$DiariesListResponseToJson;
  Map<String, dynamic> toJson() => _$DiariesListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiariesListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $DiariesListResponseExtension on DiariesListResponse {
  DiariesListResponse copyWith(
      {String? message,
      bool? result,
      List<Diary>? payload,
      Paginator? paginator}) {
    return DiariesListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class DiariesAverageStatsResponse {
  DiariesAverageStatsResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory DiariesAverageStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$DiariesAverageStatsResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final Diary? payload;
  static const fromJsonFactory = _$DiariesAverageStatsResponseFromJson;
  static const toJsonFactory = _$DiariesAverageStatsResponseToJson;
  Map<String, dynamic> toJson() => _$DiariesAverageStatsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiariesAverageStatsResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $DiariesAverageStatsResponseExtension on DiariesAverageStatsResponse {
  DiariesAverageStatsResponse copyWith(
      {String? message, bool? result, Diary? payload}) {
    return DiariesAverageStatsResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

@JsonSerializable(explicitToJson: true)
class DiariesEditResponse {
  DiariesEditResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory DiariesEditResponse.fromJson(Map<String, dynamic> json) =>
      _$DiariesEditResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <Diary>[])
  final List<Diary>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$DiariesEditResponseFromJson;
  static const toJsonFactory = _$DiariesEditResponseToJson;
  Map<String, dynamic> toJson() => _$DiariesEditResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiariesEditResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $DiariesEditResponseExtension on DiariesEditResponse {
  DiariesEditResponse copyWith(
      {String? message,
      bool? result,
      List<Diary>? payload,
      Paginator? paginator}) {
    return DiariesEditResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlacesPinAddMyPersonalityPinResponse {
  MyPlacesPinAddMyPersonalityPinResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MyPlacesPinAddMyPersonalityPinResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MyPlacesPinAddMyPersonalityPinResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <MyPersonalityPin>[])
  final List<MyPersonalityPin>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory =
      _$MyPlacesPinAddMyPersonalityPinResponseFromJson;
  static const toJsonFactory = _$MyPlacesPinAddMyPersonalityPinResponseToJson;
  Map<String, dynamic> toJson() =>
      _$MyPlacesPinAddMyPersonalityPinResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlacesPinAddMyPersonalityPinResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MyPlacesPinAddMyPersonalityPinResponseExtension
    on MyPlacesPinAddMyPersonalityPinResponse {
  MyPlacesPinAddMyPersonalityPinResponse copyWith(
      {String? message,
      bool? result,
      List<MyPersonalityPin>? payload,
      Paginator? paginator}) {
    return MyPlacesPinAddMyPersonalityPinResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class MyPlacesPinListResponse {
  MyPlacesPinListResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory MyPlacesPinListResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPlacesPinListResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <MyPersonalityPin>[])
  final List<MyPersonalityPin>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$MyPlacesPinListResponseFromJson;
  static const toJsonFactory = _$MyPlacesPinListResponseToJson;
  Map<String, dynamic> toJson() => _$MyPlacesPinListResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MyPlacesPinListResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $MyPlacesPinListResponseExtension on MyPlacesPinListResponse {
  MyPlacesPinListResponse copyWith(
      {String? message,
      bool? result,
      List<MyPersonalityPin>? payload,
      Paginator? paginator}) {
    return MyPlacesPinListResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationsIndexResponse {
  NotificationsIndexResponse({
    this.message,
    this.result,
    this.payload,
    this.paginator,
  });

  factory NotificationsIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsIndexResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload', defaultValue: <PushNotification>[])
  final List<PushNotification>? payload;
  @JsonKey(name: 'paginator')
  final Paginator? paginator;
  static const fromJsonFactory = _$NotificationsIndexResponseFromJson;
  static const toJsonFactory = _$NotificationsIndexResponseToJson;
  Map<String, dynamic> toJson() => _$NotificationsIndexResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationsIndexResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality()
                    .equals(other.payload, payload)) &&
            (identical(other.paginator, paginator) ||
                const DeepCollectionEquality()
                    .equals(other.paginator, paginator)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      const DeepCollectionEquality().hash(paginator) ^
      runtimeType.hashCode;
}

extension $NotificationsIndexResponseExtension on NotificationsIndexResponse {
  NotificationsIndexResponse copyWith(
      {String? message,
      bool? result,
      List<PushNotification>? payload,
      Paginator? paginator}) {
    return NotificationsIndexResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload,
        paginator: paginator ?? this.paginator);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationsMarkANotificationAsReadResponse {
  NotificationsMarkANotificationAsReadResponse({
    this.message,
    this.result,
    this.payload,
  });

  factory NotificationsMarkANotificationAsReadResponse.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationsMarkANotificationAsReadResponseFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'result', defaultValue: true)
  final bool? result;
  @JsonKey(name: 'payload')
  final PushNotification? payload;
  static const fromJsonFactory =
      _$NotificationsMarkANotificationAsReadResponseFromJson;
  static const toJsonFactory =
      _$NotificationsMarkANotificationAsReadResponseToJson;
  Map<String, dynamic> toJson() =>
      _$NotificationsMarkANotificationAsReadResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationsMarkANotificationAsReadResponse &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(payload) ^
      runtimeType.hashCode;
}

extension $NotificationsMarkANotificationAsReadResponseExtension
    on NotificationsMarkANotificationAsReadResponse {
  NotificationsMarkANotificationAsReadResponse copyWith(
      {String? message, bool? result, PushNotification? payload}) {
    return NotificationsMarkANotificationAsReadResponse(
        message: message ?? this.message,
        result: result ?? this.result,
        payload: payload ?? this.payload);
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(ApiClientJsonDecoderMappings);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
