// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    fullName: json['full_name'] as String?,
    coverImageUrl: json['cover_image_url'] as String?,
    description: json['description'] as String?,
    email: json['email'] as String?,
    avatarUrl: json['avatar_url'] as String?,
    timezone: json['timezone'] as String?,
    ageGroup: json['age_group'] as String?,
    address: json['address'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    genderId: json['gender_id'] as String?,
    username: json['username'] as String?,
    postsKeepPrivate: json['posts_keep_private'] as String?,
    postsWithPublic: json['posts_with_public'] as String?,
    postsWithFamily: json['posts_with_family'] as String?,
    postsWithFriends: json['posts_with_friends'] as String?,
    visibleUsername: json['visible_username'] as String?,
    completeProfileRemember: json['complete_profile_remember'] as bool?,
    accessToken: json['access_token'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'full_name': instance.fullName,
      'cover_image_url': instance.coverImageUrl,
      'description': instance.description,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'timezone': instance.timezone,
      'age_group': instance.ageGroup,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'gender_id': instance.genderId,
      'username': instance.username,
      'posts_keep_private': instance.postsKeepPrivate,
      'posts_with_public': instance.postsWithPublic,
      'posts_with_family': instance.postsWithFamily,
      'posts_with_friends': instance.postsWithFriends,
      'visible_username': instance.visibleUsername,
      'complete_profile_remember': instance.completeProfileRemember,
      'access_token': instance.accessToken,
    };

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) {
  return PushNotification(
    id: json['id'] as int?,
    uuid: json['uuid'] as String?,
    title: json['title'] as String?,
    message: json['message'] as String?,
    badgeCount: json['badge_count'] as int?,
    data: json['data'] as String?,
    scheduledAt: json['scheduled_at'] as String?,
    scheduledTimezone: json['scheduled_timezone'] as String?,
    sentAt: json['sent_at'] as String?,
    readAt: json['read_at'] as String?,
    notifiableType: json['notifiable_type'] as String?,
    notifiableId: json['notifiable_id'] as String?,
    topic: json['topic'] as String?,
    apnsConfig: json['apns_config'] as String?,
    androidConfig: json['android_config'] as String?,
    deletedAt: json['deleted_at'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$PushNotificationToJson(PushNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'title': instance.title,
      'message': instance.message,
      'badge_count': instance.badgeCount,
      'data': instance.data,
      'scheduled_at': instance.scheduledAt,
      'scheduled_timezone': instance.scheduledTimezone,
      'sent_at': instance.sentAt,
      'read_at': instance.readAt,
      'notifiable_type': instance.notifiableType,
      'notifiable_id': instance.notifiableId,
      'topic': instance.topic,
      'apns_config': instance.apnsConfig,
      'android_config': instance.androidConfig,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    id: json['id'] as String?,
    userId: json['user_id'] as String?,
    deviceId: json['device_id'] as String?,
    deviceType: json['device_type'] as String?,
    devicePushToken: json['device_push_token'] as String?,
    accessToken: json['access_token'] as String?,
    accessTokenExpiresAt: json['access_token_expires_at'] as String?,
    latestIpAddress: json['latest_ip_address'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'device_id': instance.deviceId,
      'device_type': instance.deviceType,
      'device_push_token': instance.devicePushToken,
      'access_token': instance.accessToken,
      'access_token_expires_at': instance.accessTokenExpiresAt,
      'latest_ip_address': instance.latestIpAddress,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Setting _$SettingFromJson(Map<String, dynamic> json) {
  return Setting(
    id: json['id'] as int?,
    key: json['key'] as String?,
    value: json['value'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'value': instance.value,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Mood _$MoodFromJson(Map<String, dynamic> json) {
  return Mood(
    id: json['id'] as int?,
    name: json['name'] as String?,
    imageUrl: json['image_url'] as String?,
    moodTypes: (json['moodTypes'] as List<dynamic>?)
            ?.map((e) => MoodType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$MoodToJson(Mood instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'moodTypes': instance.moodTypes?.map((e) => e.toJson()).toList(),
    };

MoodType _$MoodTypeFromJson(Map<String, dynamic> json) {
  return MoodType(
    id: json['id'] as int?,
    moodId: json['mood_id'] as int?,
    name: json['name'] as String?,
    colour: json['colour'] as String?,
  );
}

Map<String, dynamic> _$MoodTypeToJson(MoodType instance) => <String, dynamic>{
      'id': instance.id,
      'mood_id': instance.moodId,
      'name': instance.name,
      'colour': instance.colour,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
    id: json['id'] as int?,
    name: json['name'] as String?,
    imageUrl: json['image_url'] as String?,
    placeTypes: (json['placeTypes'] as List<dynamic>?)
            ?.map((e) => PlaceType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'placeTypes': instance.placeTypes?.map((e) => e.toJson()).toList(),
    };

PlaceType _$PlaceTypeFromJson(Map<String, dynamic> json) {
  return PlaceType(
    id: json['id'] as int?,
    placeId: json['place_id'] as int?,
    name: json['name'] as String?,
    colour: json['colour'] as String?,
  );
}

Map<String, dynamic> _$PlaceTypeToJson(PlaceType instance) => <String, dynamic>{
      'id': instance.id,
      'place_id': instance.placeId,
      'name': instance.name,
      'colour': instance.colour,
    };

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    id: json['id'] as String?,
    name: json['name'] as String?,
    imageUrl: json['image_url'] as String?,
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

Feeling _$FeelingFromJson(Map<String, dynamic> json) {
  return Feeling(
    id: json['id'] as int?,
    name: json['name'] as String?,
    imageUrl: json['image_url'] as String?,
    feelingTypes: (json['feelingTypes'] as List<dynamic>?)
            ?.map((e) => FeelingType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$FeelingToJson(Feeling instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'feelingTypes': instance.feelingTypes?.map((e) => e.toJson()).toList(),
    };

FeelingRating _$FeelingRatingFromJson(Map<String, dynamic> json) {
  return FeelingRating(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$FeelingRatingToJson(FeelingRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'title': instance.title,
    };

VisitedPlace _$VisitedPlaceFromJson(Map<String, dynamic> json) {
  return VisitedPlace(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    location: json['location'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    moodId: json['mood_id'] as int?,
    moodTypeId: json['mood_type_id'] as int?,
    placeId: json['place_id'] as int?,
    placeTypeId: json['place_type_id'] as int?,
    activityId: json['activity_id'] as int?,
    activityTypeId: json['activity_type_id'] as int?,
    feelingId: json['feeling_id'] as int?,
    feelingRating: json['feeling_rating'] as int?,
    feelingNote: json['feeling_note'] as String?,
    flag: json['flag'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    feelingTypeId: json['feeling_type_id'] as int?,
    mood: json['mood'] == null
        ? null
        : Mood.fromJson(json['mood'] as Map<String, dynamic>),
    moodType: json['mood_type'] == null
        ? null
        : MoodType.fromJson(json['mood_type'] as Map<String, dynamic>),
    place: json['place'] == null
        ? null
        : Place.fromJson(json['place'] as Map<String, dynamic>),
    placeType: json['place_type'] == null
        ? null
        : PlaceType.fromJson(json['place_type'] as Map<String, dynamic>),
    activity: json['activity'] == null
        ? null
        : Activity.fromJson(json['activity'] as Map<String, dynamic>),
    activityType: json['activity_type'] == null
        ? null
        : ActivityType.fromJson(json['activity_type'] as Map<String, dynamic>),
    feeling: json['feeling'] == null
        ? null
        : Feeling.fromJson(json['feeling'] as Map<String, dynamic>),
    feelingType: json['feeling_type'] == null
        ? null
        : FeelingType.fromJson(json['feeling_type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VisitedPlaceToJson(VisitedPlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'mood_id': instance.moodId,
      'mood_type_id': instance.moodTypeId,
      'place_id': instance.placeId,
      'place_type_id': instance.placeTypeId,
      'activity_id': instance.activityId,
      'activity_type_id': instance.activityTypeId,
      'feeling_id': instance.feelingId,
      'feeling_rating': instance.feelingRating,
      'feeling_note': instance.feelingNote,
      'flag': instance.flag,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'feeling_type_id': instance.feelingTypeId,
      'mood': instance.mood?.toJson(),
      'mood_type': instance.moodType?.toJson(),
      'place': instance.place?.toJson(),
      'place_type': instance.placeType?.toJson(),
      'activity': instance.activity?.toJson(),
      'activity_type': instance.activityType?.toJson(),
      'feeling': instance.feeling?.toJson(),
      'feeling_type': instance.feelingType?.toJson(),
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    questionId: json['question_id'] as String?,
    userId: json['user_id'] as String?,
    answer: (json['answer'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'question_id': instance.questionId,
      'user_id': instance.userId,
      'answer': instance.answer,
    };

ActivityLocation _$ActivityLocationFromJson(Map<String, dynamic> json) {
  return ActivityLocation(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    activityId: json['activity_id'] as int?,
    userId: json['user_id'] as String?,
    location: json['location'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
  );
}

Map<String, dynamic> _$ActivityLocationToJson(ActivityLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'activity_id': instance.activityId,
      'user_id': instance.userId,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

HappynessOption _$HappynessOptionFromJson(Map<String, dynamic> json) {
  return HappynessOption(
    title: json['title'] as String?,
    id: json['id'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$HappynessOptionToJson(HappynessOption instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'description': instance.description,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    happynessTestId: json['happyness_test_id'] as String?,
    title: json['title'] as String?,
    parentQuestionId: json['parent_question_id'] as String?,
    description: json['description'] as String?,
    bottomEndNote: json['bottom_end_note'] as String?,
    topEndNote: json['top_end_note'] as String?,
    orderNumber: json['order_number'] as int?,
    happynessOptionId: json['happyness_option_id'] as String?,
    subQuestions: (json['sub_questions'] as List<dynamic>?)
            ?.map((e) => SubQuestion.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    answer: json['answer'] == null
        ? null
        : Answer.fromJson(json['answer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'happyness_test_id': instance.happynessTestId,
      'title': instance.title,
      'parent_question_id': instance.parentQuestionId,
      'description': instance.description,
      'bottom_end_note': instance.bottomEndNote,
      'top_end_note': instance.topEndNote,
      'order_number': instance.orderNumber,
      'happyness_option_id': instance.happynessOptionId,
      'sub_questions': instance.subQuestions?.map((e) => e.toJson()).toList(),
      'answer': instance.answer?.toJson(),
    };

HappynessTest _$HappynessTestFromJson(Map<String, dynamic> json) {
  return HappynessTest(
    id: json['id'] as String?,
    happynessOptionId: json['happyness_option_id'] as String?,
    name: json['name'] as String?,
    shortIntro: json['short_intro'] as String?,
    detailIntro: json['detail_intro'] as String?,
  );
}

Map<String, dynamic> _$HappynessTestToJson(HappynessTest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'happyness_option_id': instance.happynessOptionId,
      'name': instance.name,
      'short_intro': instance.shortIntro,
      'detail_intro': instance.detailIntro,
    };

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return Friend(
    id: json['id'] as String?,
    userId: json['user_id'] as String?,
    friendId: json['friend_id'] as String?,
    status: json['status'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    isAccepted: json['is_accepted'] as int?,
  );
}

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'friend_id': instance.friendId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_accepted': instance.isAccepted,
    };

AgeGroup _$AgeGroupFromJson(Map<String, dynamic> json) {
  return AgeGroup(
    id: json['id'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$AgeGroupToJson(AgeGroup instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return Entry(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    userId: json['user_id'] as String?,
    location: json['location'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    privacyLevel: json['privacy_level'] as String?,
    title: json['title'] as String?,
    postDate: json['post_date'] as String?,
    moodId: json['mood_id'] as int?,
    note: json['note'] as String?,
    images: (json['images'] as List<dynamic>?)
            ?.map((e) => PostImage.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    mood: json['mood'] == null
        ? null
        : Mood.fromJson(json['mood'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'privacy_level': instance.privacyLevel,
      'title': instance.title,
      'post_date': instance.postDate,
      'mood_id': instance.moodId,
      'note': instance.note,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'mood': instance.mood?.toJson(),
    };

PostImage _$PostImageFromJson(Map<String, dynamic> json) {
  return PostImage(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    postId: json['post_id'] as String?,
    imagePath: json['image_path'] as String?,
  );
}

Map<String, dynamic> _$PostImageToJson(PostImage instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'post_id': instance.postId,
      'image_path': instance.imagePath,
    };

DonotShareWithMeRequest _$DonotShareWithMeRequestFromJson(
    Map<String, dynamic> json) {
  return DonotShareWithMeRequest(
    id: json['id'] as String?,
    userId: json['user_id'] as String?,
    postId: json['post_id'] as String?,
  );
}

Map<String, dynamic> _$DonotShareWithMeRequestToJson(
        DonotShareWithMeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'post_id': instance.postId,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    url: json['url'] as String?,
    localPath: json['local_path'] as String?,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'url': instance.url,
      'local_path': instance.localPath,
    };

MyPlace _$MyPlaceFromJson(Map<String, dynamic> json) {
  return MyPlace(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    userId: json['user_id'] as String?,
    location: json['location'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    myPlaceCategoryId: json['my_place_category_id'] as String?,
    myPlaceOpinionId: json['my_place_opinion_id'] as String?,
    note: json['note'] as String?,
  );
}

Map<String, dynamic> _$MyPlaceToJson(MyPlace instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'my_place_category_id': instance.myPlaceCategoryId,
      'my_place_opinion_id': instance.myPlaceOpinionId,
      'note': instance.note,
    };

MyPlaceCategory _$MyPlaceCategoryFromJson(Map<String, dynamic> json) {
  return MyPlaceCategory(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    name: json['name'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    userId: json['user_id'] as String?,
    myPlaceCategoryId: json['my_place_category_id'] as String?,
    myPlaceOpinionId: json['my_place_opinion_id'] as String?,
  );
}

Map<String, dynamic> _$MyPlaceCategoryToJson(MyPlaceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'user_id': instance.userId,
      'my_place_category_id': instance.myPlaceCategoryId,
      'my_place_opinion_id': instance.myPlaceOpinionId,
    };

MyPlaceOpinion _$MyPlaceOpinionFromJson(Map<String, dynamic> json) {
  return MyPlaceOpinion(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$MyPlaceOpinionToJson(MyPlaceOpinion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'title': instance.title,
    };

Diary _$DiaryFromJson(Map<String, dynamic> json) {
  return Diary(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    userId: json['user_id'] as String?,
    address: json['address'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    eventTime: json['event_time'] as String?,
    moodId: json['mood_id'] as String?,
    activityId: json['activity_id'] as String?,
    placeId: json['place_id'] as String?,
    journalEntry: json['journal_entry'] as String?,
  );
}

Map<String, dynamic> _$DiaryToJson(Diary instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'event_time': instance.eventTime,
      'mood_id': instance.moodId,
      'activity_id': instance.activityId,
      'place_id': instance.placeId,
      'journal_entry': instance.journalEntry,
    };

MyPersonalityPin _$MyPersonalityPinFromJson(Map<String, dynamic> json) {
  return MyPersonalityPin(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    describe: json['describe'] as String?,
    address: json['address'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    pinColor: json['pin_color'] as String?,
    userId: json['user_id'] as String?,
  );
}

Map<String, dynamic> _$MyPersonalityPinToJson(MyPersonalityPin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'describe': instance.describe,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'pin_color': instance.pinColor,
      'user_id': instance.userId,
    };

ActivityType _$ActivityTypeFromJson(Map<String, dynamic> json) {
  return ActivityType(
    id: json['id'] as int?,
    activityId: json['activity_id'] as int?,
    name: json['name'] as String?,
    colour: json['colour'] as String?,
  );
}

Map<String, dynamic> _$ActivityTypeToJson(ActivityType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activity_id': instance.activityId,
      'name': instance.name,
      'colour': instance.colour,
    };

BigFiveTestResult _$BigFiveTestResultFromJson(Map<String, dynamic> json) {
  return BigFiveTestResult(
    question: json['question'] as String?,
    letter: json['letter'] as String?,
    score: json['score'] as int?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$BigFiveTestResultToJson(BigFiveTestResult instance) =>
    <String, dynamic>{
      'question': instance.question,
      'letter': instance.letter,
      'score': instance.score,
      'description': instance.description,
    };

DiaryStats _$DiaryStatsFromJson(Map<String, dynamic> json) {
  return DiaryStats(
    avarageMode: json['avarage_mode'] == null
        ? null
        : Mood.fromJson(json['avarage_mode'] as Map<String, dynamic>),
    avarageActivity: json['avarage_activity'] == null
        ? null
        : Activity.fromJson(json['avarage_activity'] as Map<String, dynamic>),
    avaragePlaces: json['avarage_places'] == null
        ? null
        : Place.fromJson(json['avarage_places'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DiaryStatsToJson(DiaryStats instance) =>
    <String, dynamic>{
      'avarage_mode': instance.avarageMode?.toJson(),
      'avarage_activity': instance.avarageActivity?.toJson(),
      'avarage_places': instance.avaragePlaces?.toJson(),
    };

FeelingType _$FeelingTypeFromJson(Map<String, dynamic> json) {
  return FeelingType(
    id: json['id'] as int?,
    feelingId: json['feeling_id'] as int?,
    name: json['name'] as String?,
    colour: json['colour'] as String?,
  );
}

Map<String, dynamic> _$FeelingTypeToJson(FeelingType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feeling_id': instance.feelingId,
      'name': instance.name,
      'colour': instance.colour,
    };

File _$FileFromJson(Map<String, dynamic> json) {
  return File(
    uuid: json['uuid'] as String?,
    key: json['key'] as String?,
    originalFilename: json['original_filename'] as String?,
    publicUrl: json['public_url'] as String?,
    permalink: json['permalink'] as String?,
  );
}

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'key': instance.key,
      'original_filename': instance.originalFilename,
      'public_url': instance.publicUrl,
      'permalink': instance.permalink,
    };

HappinessTestResult _$HappinessTestResultFromJson(Map<String, dynamic> json) {
  return HappinessTestResult(
    date: json['date'] as String?,
    score: json['score'] as String?,
  );
}

Map<String, dynamic> _$HappinessTestResultToJson(
        HappinessTestResult instance) =>
    <String, dynamic>{
      'date': instance.date,
      'score': instance.score,
    };

HexacoTestResult _$HexacoTestResultFromJson(Map<String, dynamic> json) {
  return HexacoTestResult(
    title: json['title'] as String?,
    score: json['score'] as String?,
    result: json['result'] as String?,
  );
}

Map<String, dynamic> _$HexacoTestResultToJson(HexacoTestResult instance) =>
    <String, dynamic>{
      'title': instance.title,
      'score': instance.score,
      'result': instance.result,
    };

IconCategory _$IconCategoryFromJson(Map<String, dynamic> json) {
  return IconCategory(
    id: json['id'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$IconCategoryToJson(IconCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

PushNotificationStatus _$PushNotificationStatusFromJson(
    Map<String, dynamic> json) {
  return PushNotificationStatus(
    id: json['id'] as int?,
    pushNotificationId: json['push_notification_id'] as int?,
    deviceId: json['device_id'] as int?,
    seenAt: json['seen_at'] as String?,
    readAt: json['read_at'] as String?,
  );
}

Map<String, dynamic> _$PushNotificationStatusToJson(
        PushNotificationStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'push_notification_id': instance.pushNotificationId,
      'device_id': instance.deviceId,
      'seen_at': instance.seenAt,
      'read_at': instance.readAt,
    };

Gender _$GenderFromJson(Map<String, dynamic> json) {
  return Gender(
    id: json['id'] as bool?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    flag: json['flag'] as String?,
  );
}

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'flag': instance.flag,
    };

SettingsResponse _$SettingsResponseFromJson(Map<String, dynamic> json) {
  return SettingsResponse(
    genders: (json['genders'] as List<dynamic>?)
            ?.map((e) => Gender.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$SettingsResponseToJson(SettingsResponse instance) =>
    <String, dynamic>{
      'genders': instance.genders?.map((e) => e.toJson()).toList(),
    };

SharedPost _$SharedPostFromJson(Map<String, dynamic> json) {
  return SharedPost(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    userId: json['user_id'] as String?,
    sharedTo: json['shared_to'] as String?,
    postId: json['post_id'] as String?,
    description: json['description'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    sharedToUser: json['shared_to_user'] == null
        ? null
        : User.fromJson(json['shared_to_user'] as Map<String, dynamic>),
    entry: json['entry'] == null
        ? null
        : Entry.fromJson(json['entry'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SharedPostToJson(SharedPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
      'shared_to': instance.sharedTo,
      'post_id': instance.postId,
      'description': instance.description,
      'user': instance.user?.toJson(),
      'shared_to_user': instance.sharedToUser?.toJson(),
      'entry': instance.entry?.toJson(),
    };

SubQuestion _$SubQuestionFromJson(Map<String, dynamic> json) {
  return SubQuestion(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    happynessTestId: json['happyness_test_id'] as String?,
    title: json['title'] as String?,
    parentQuestionId: json['parent_question_id'] as String?,
    description: json['description'] as String?,
    bottomEndNote: json['bottom_end_note'] as String?,
    topEndNote: json['top_end_note'] as String?,
    orderNumber: json['order_number'] as int?,
    answer: json['answer'] == null
        ? null
        : Answer.fromJson(json['answer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SubQuestionToJson(SubQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'happyness_test_id': instance.happynessTestId,
      'title': instance.title,
      'parent_question_id': instance.parentQuestionId,
      'description': instance.description,
      'bottom_end_note': instance.bottomEndNote,
      'top_end_note': instance.topEndNote,
      'order_number': instance.orderNumber,
      'answer': instance.answer?.toJson(),
    };

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) {
  return SuccessResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'],
  );
}

Map<String, dynamic> _$SuccessResponseToJson(SuccessResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload,
    };

Paginator _$PaginatorFromJson(Map<String, dynamic> json) {
  return Paginator(
    currentPage: (json['current_page'] as num?)?.toDouble(),
    perPage: (json['per_page'] as num?)?.toDouble(),
    from: (json['from'] as num?)?.toDouble(),
    to: (json['to'] as num?)?.toDouble(),
    total: (json['total'] as num?)?.toDouble(),
    lastPage: (json['last_page'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$PaginatorToJson(Paginator instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'from': instance.from,
      'to': instance.to,
      'total': instance.total,
      'last_page': instance.lastPage,
    };

ApiErrorUnauthorized _$ApiErrorUnauthorizedFromJson(Map<String, dynamic> json) {
  return ApiErrorUnauthorized(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'],
  );
}

Map<String, dynamic> _$ApiErrorUnauthorizedToJson(
        ApiErrorUnauthorized instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload,
    };

ApiErrorAccessDenied _$ApiErrorAccessDeniedFromJson(Map<String, dynamic> json) {
  return ApiErrorAccessDenied(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'],
  );
}

Map<String, dynamic> _$ApiErrorAccessDeniedToJson(
        ApiErrorAccessDenied instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload,
    };

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return ApiError(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'],
  );
}

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload,
    };

AuthRegisterResponse _$AuthRegisterResponseFromJson(Map<String, dynamic> json) {
  return AuthRegisterResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthRegisterResponseToJson(
        AuthRegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

AuthLoginResponse _$AuthLoginResponseFromJson(Map<String, dynamic> json) {
  return AuthLoginResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthLoginResponseToJson(AuthLoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

AuthSocialLoginResponse _$AuthSocialLoginResponseFromJson(
    Map<String, dynamic> json) {
  return AuthSocialLoginResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthSocialLoginResponseToJson(
        AuthSocialLoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

SettingsGetSettingsResponse _$SettingsGetSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return SettingsGetSettingsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Setting.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SettingsGetSettingsResponseToJson(
        SettingsGetSettingsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

ProfileMyProfileResponse _$ProfileMyProfileResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileMyProfileResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileMyProfileResponseToJson(
        ProfileMyProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

ProfileMyFriendsResponse _$ProfileMyFriendsResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileMyFriendsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileMyFriendsResponseToJson(
        ProfileMyFriendsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

ProfileMyFamilyResponse _$ProfileMyFamilyResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileMyFamilyResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileMyFamilyResponseToJson(
        ProfileMyFamilyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

ProfileMyFriendRequestsResponse _$ProfileMyFriendRequestsResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileMyFriendRequestsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileMyFriendRequestsResponseToJson(
        ProfileMyFriendRequestsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

ProfileMyFamilyRequestsResponse _$ProfileMyFamilyRequestsResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileMyFamilyRequestsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileMyFamilyRequestsResponseToJson(
        ProfileMyFamilyRequestsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

ProfileUpdateMyProfileResponse _$ProfileUpdateMyProfileResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileUpdateMyProfileResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileUpdateMyProfileResponseToJson(
        ProfileUpdateMyProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

ProfileHideProfileUpdateMessageResponse
    _$ProfileHideProfileUpdateMessageResponseFromJson(
        Map<String, dynamic> json) {
  return ProfileHideProfileUpdateMessageResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileHideProfileUpdateMessageResponseToJson(
        ProfileHideProfileUpdateMessageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

ProfileUpdateMyProfileSettingsResponse
    _$ProfileUpdateMyProfileSettingsResponseFromJson(
        Map<String, dynamic> json) {
  return ProfileUpdateMyProfileSettingsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileUpdateMyProfileSettingsResponseToJson(
        ProfileUpdateMyProfileSettingsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

ProfileUpdateMyAvatarResponse _$ProfileUpdateMyAvatarResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileUpdateMyAvatarResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileUpdateMyAvatarResponseToJson(
        ProfileUpdateMyAvatarResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

ProfileUpdateMyCoverImageResponse _$ProfileUpdateMyCoverImageResponseFromJson(
    Map<String, dynamic> json) {
  return ProfileUpdateMyCoverImageResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : User.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileUpdateMyCoverImageResponseToJson(
        ProfileUpdateMyCoverImageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

MoodsListResponse _$MoodsListResponseFromJson(Map<String, dynamic> json) {
  return MoodsListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Mood.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoodsListResponseToJson(MoodsListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

MoodsViewResponse _$MoodsViewResponseFromJson(Map<String, dynamic> json) {
  return MoodsViewResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Mood.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoodsViewResponseToJson(MoodsViewResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

MoodsTypesResponse _$MoodsTypesResponseFromJson(Map<String, dynamic> json) {
  return MoodsTypesResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => MoodType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoodsTypesResponseToJson(MoodsTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

PlacesListResponse _$PlacesListResponseFromJson(Map<String, dynamic> json) {
  return PlacesListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlacesListResponseToJson(PlacesListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

PlacesViewResponse _$PlacesViewResponseFromJson(Map<String, dynamic> json) {
  return PlacesViewResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Place.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlacesViewResponseToJson(PlacesViewResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

PlacesTypesResponse _$PlacesTypesResponseFromJson(Map<String, dynamic> json) {
  return PlacesTypesResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => PlaceType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlacesTypesResponseToJson(
        PlacesTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

ActivitiesListResponse _$ActivitiesListResponseFromJson(
    Map<String, dynamic> json) {
  return ActivitiesListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivitiesListResponseToJson(
        ActivitiesListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

ActivitiesViewResponse _$ActivitiesViewResponseFromJson(
    Map<String, dynamic> json) {
  return ActivitiesViewResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Activity.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivitiesViewResponseToJson(
        ActivitiesViewResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

ActivitiesTypesResponse _$ActivitiesTypesResponseFromJson(
    Map<String, dynamic> json) {
  return ActivitiesTypesResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => ActivityType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivitiesTypesResponseToJson(
        ActivitiesTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

FeelingsListResponse _$FeelingsListResponseFromJson(Map<String, dynamic> json) {
  return FeelingsListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Feeling.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FeelingsListResponseToJson(
        FeelingsListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

FeelingsViewResponse _$FeelingsViewResponseFromJson(Map<String, dynamic> json) {
  return FeelingsViewResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Feeling.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FeelingsViewResponseToJson(
        FeelingsViewResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

FeelingsTypesResponse _$FeelingsTypesResponseFromJson(
    Map<String, dynamic> json) {
  return FeelingsTypesResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => FeelingType.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FeelingsTypesResponseToJson(
        FeelingsTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

FeelingsListRatingsResponse _$FeelingsListRatingsResponseFromJson(
    Map<String, dynamic> json) {
  return FeelingsListRatingsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => FeelingRating.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FeelingsListRatingsResponseToJson(
        FeelingsListRatingsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

VisitedPlacesListResponse _$VisitedPlacesListResponseFromJson(
    Map<String, dynamic> json) {
  return VisitedPlacesListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => VisitedPlace.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VisitedPlacesListResponseToJson(
        VisitedPlacesListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

VisitedPlacesSaveResponse _$VisitedPlacesSaveResponseFromJson(
    Map<String, dynamic> json) {
  return VisitedPlacesSaveResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : VisitedPlace.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VisitedPlacesSaveResponseToJson(
        VisitedPlacesSaveResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

VisitedPlacesSaveFeelingResponse _$VisitedPlacesSaveFeelingResponseFromJson(
    Map<String, dynamic> json) {
  return VisitedPlacesSaveFeelingResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : VisitedPlace.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VisitedPlacesSaveFeelingResponseToJson(
        VisitedPlacesSaveFeelingResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

MyActivitiesStoreMyActivityLocationResponse
    _$MyActivitiesStoreMyActivityLocationResponseFromJson(
        Map<String, dynamic> json) {
  return MyActivitiesStoreMyActivityLocationResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : ActivityLocation.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyActivitiesStoreMyActivityLocationResponseToJson(
        MyActivitiesStoreMyActivityLocationResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

MyActivitiesSearchResponse _$MyActivitiesSearchResponseFromJson(
    Map<String, dynamic> json) {
  return MyActivitiesSearchResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => ActivityLocation.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyActivitiesSearchResponseToJson(
        MyActivitiesSearchResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

HappynessOptionsListResponse _$HappynessOptionsListResponseFromJson(
    Map<String, dynamic> json) {
  return HappynessOptionsListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => HappynessOption.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HappynessOptionsListResponseToJson(
        HappynessOptionsListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

HappynessTestsQuestionsResponse _$HappynessTestsQuestionsResponseFromJson(
    Map<String, dynamic> json) {
  return HappynessTestsQuestionsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HappynessTestsQuestionsResponseToJson(
        HappynessTestsQuestionsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

TestResultsGetBigFiveTestResultsResponse
    _$TestResultsGetBigFiveTestResultsResponseFromJson(
        Map<String, dynamic> json) {
  return TestResultsGetBigFiveTestResultsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => BigFiveTestResult.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TestResultsGetBigFiveTestResultsResponseToJson(
        TestResultsGetBigFiveTestResultsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

TestResultsGetHEXACOTestResultsResponse
    _$TestResultsGetHEXACOTestResultsResponseFromJson(
        Map<String, dynamic> json) {
  return TestResultsGetHEXACOTestResultsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => HexacoTestResult.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TestResultsGetHEXACOTestResultsResponseToJson(
        TestResultsGetHEXACOTestResultsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

TestResultsGetHappinessTestResultsResponse
    _$TestResultsGetHappinessTestResultsResponseFromJson(
        Map<String, dynamic> json) {
  return TestResultsGetHappinessTestResultsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map(
                (e) => HappinessTestResult.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TestResultsGetHappinessTestResultsResponseToJson(
        TestResultsGetHappinessTestResultsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

HappynessTestsListResponse _$HappynessTestsListResponseFromJson(
    Map<String, dynamic> json) {
  return HappynessTestsListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => HappynessTest.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HappynessTestsListResponseToJson(
        HappynessTestsListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

UsersSearchResponse _$UsersSearchResponseFromJson(Map<String, dynamic> json) {
  return UsersSearchResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UsersSearchResponseToJson(
        UsersSearchResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

UsersAgeGroupsResponse _$UsersAgeGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return UsersAgeGroupsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => AgeGroup.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UsersAgeGroupsResponseToJson(
        UsersAgeGroupsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

FriendAddFriendOrFamilyResponse _$FriendAddFriendOrFamilyResponseFromJson(
    Map<String, dynamic> json) {
  return FriendAddFriendOrFamilyResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Friend.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FriendAddFriendOrFamilyResponseToJson(
        FriendAddFriendOrFamilyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

FriendAcceptFriendOrFamilyRequestResponse
    _$FriendAcceptFriendOrFamilyRequestResponseFromJson(
        Map<String, dynamic> json) {
  return FriendAcceptFriendOrFamilyRequestResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Friend.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FriendAcceptFriendOrFamilyRequestResponseToJson(
        FriendAcceptFriendOrFamilyRequestResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

FriendRejectFriendOrFamilyRequestResponse
    _$FriendRejectFriendOrFamilyRequestResponseFromJson(
        Map<String, dynamic> json) {
  return FriendRejectFriendOrFamilyRequestResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Friend.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FriendRejectFriendOrFamilyRequestResponseToJson(
        FriendRejectFriendOrFamilyRequestResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

EntriesIndexEntriesExplorerResponse
    _$EntriesIndexEntriesExplorerResponseFromJson(Map<String, dynamic> json) {
  return EntriesIndexEntriesExplorerResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntriesIndexEntriesExplorerResponseToJson(
        EntriesIndexEntriesExplorerResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

EntriesStoreResponse _$EntriesStoreResponseFromJson(Map<String, dynamic> json) {
  return EntriesStoreResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Entry.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntriesStoreResponseToJson(
        EntriesStoreResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

EntriesListResponse _$EntriesListResponseFromJson(Map<String, dynamic> json) {
  return EntriesListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntriesListResponseToJson(
        EntriesListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

EntriesUpdateResponse _$EntriesUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return EntriesUpdateResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Entry.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntriesUpdateResponseToJson(
        EntriesUpdateResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

EntriesGetSharedPostsResponse _$EntriesGetSharedPostsResponseFromJson(
    Map<String, dynamic> json) {
  return EntriesGetSharedPostsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => SharedPost.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntriesGetSharedPostsResponseToJson(
        EntriesGetSharedPostsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

EntriesShareAPostsResponse _$EntriesShareAPostsResponseFromJson(
    Map<String, dynamic> json) {
  return EntriesShareAPostsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : SharedPost.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntriesShareAPostsResponseToJson(
        EntriesShareAPostsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

ImageStoreImageResponse _$ImageStoreImageResponseFromJson(
    Map<String, dynamic> json) {
  return ImageStoreImageResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Image.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImageStoreImageResponseToJson(
        ImageStoreImageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

MyPlacesAddMyPlaceResponse _$MyPlacesAddMyPlaceResponseFromJson(
    Map<String, dynamic> json) {
  return MyPlacesAddMyPlaceResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => MyPlace.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyPlacesAddMyPlaceResponseToJson(
        MyPlacesAddMyPlaceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

MyPlacesListResponse _$MyPlacesListResponseFromJson(Map<String, dynamic> json) {
  return MyPlacesListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => MyPlace.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyPlacesListResponseToJson(
        MyPlacesListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

MyPlaceCategoriesMyPlaceCategoriesResponse
    _$MyPlaceCategoriesMyPlaceCategoriesResponseFromJson(
        Map<String, dynamic> json) {
  return MyPlaceCategoriesMyPlaceCategoriesResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => MyPlaceCategory.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyPlaceCategoriesMyPlaceCategoriesResponseToJson(
        MyPlaceCategoriesMyPlaceCategoriesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

MyPlacesMyPlaceOpinionsResponse _$MyPlacesMyPlaceOpinionsResponseFromJson(
    Map<String, dynamic> json) {
  return MyPlacesMyPlaceOpinionsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => MyPlaceOpinion.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyPlacesMyPlaceOpinionsResponseToJson(
        MyPlacesMyPlaceOpinionsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

DiariesStoreResponse _$DiariesStoreResponseFromJson(Map<String, dynamic> json) {
  return DiariesStoreResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Diary.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DiariesStoreResponseToJson(
        DiariesStoreResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

DiariesListResponse _$DiariesListResponseFromJson(Map<String, dynamic> json) {
  return DiariesListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Diary.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DiariesListResponseToJson(
        DiariesListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

DiariesAverageStatsResponse _$DiariesAverageStatsResponseFromJson(
    Map<String, dynamic> json) {
  return DiariesAverageStatsResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : Diary.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DiariesAverageStatsResponseToJson(
        DiariesAverageStatsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };

DiariesEditResponse _$DiariesEditResponseFromJson(Map<String, dynamic> json) {
  return DiariesEditResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => Diary.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DiariesEditResponseToJson(
        DiariesEditResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

MyPlacesPinAddMyPersonalityPinResponse
    _$MyPlacesPinAddMyPersonalityPinResponseFromJson(
        Map<String, dynamic> json) {
  return MyPlacesPinAddMyPersonalityPinResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => MyPersonalityPin.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyPlacesPinAddMyPersonalityPinResponseToJson(
        MyPlacesPinAddMyPersonalityPinResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

MyPlacesPinListResponse _$MyPlacesPinListResponseFromJson(
    Map<String, dynamic> json) {
  return MyPlacesPinListResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => MyPersonalityPin.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MyPlacesPinListResponseToJson(
        MyPlacesPinListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

NotificationsIndexResponse _$NotificationsIndexResponseFromJson(
    Map<String, dynamic> json) {
  return NotificationsIndexResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: (json['payload'] as List<dynamic>?)
            ?.map((e) => PushNotification.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    paginator: json['paginator'] == null
        ? null
        : Paginator.fromJson(json['paginator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NotificationsIndexResponseToJson(
        NotificationsIndexResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.map((e) => e.toJson()).toList(),
      'paginator': instance.paginator?.toJson(),
    };

NotificationsMarkANotificationAsReadResponse
    _$NotificationsMarkANotificationAsReadResponseFromJson(
        Map<String, dynamic> json) {
  return NotificationsMarkANotificationAsReadResponse(
    message: json['message'] as String?,
    result: json['result'] as bool? ?? true,
    payload: json['payload'] == null
        ? null
        : PushNotification.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NotificationsMarkANotificationAsReadResponseToJson(
        NotificationsMarkANotificationAsReadResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
      'payload': instance.payload?.toJson(),
    };
