import 'package:json_annotation/json_annotation.dart';

part 'big_five_request.g.dart';

@JsonSerializable()
class BigFiveAnswerRequest {
  // @JsonKey(name: 'happiness_test_id')
  // String happinessTestId;

  // @JsonKey(name: 'parent_question_id')
  // String parentQuestionId;

  @JsonKey(name: 'question_id')
  String questionId;

  @JsonKey(name: 'answer')
  String? answer;

  BigFiveAnswerRequest({
    // required this.happinessTestId,
    // required this.parentQuestionId,
    required this.questionId,
    this.answer,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory BigFiveAnswerRequest.fromJson(Map<String, dynamic> json) =>
      _$BigFiveAnswerRequestFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.ƒ
  Map<String, dynamic> toJson() => _$BigFiveAnswerRequestToJson(this);
}
