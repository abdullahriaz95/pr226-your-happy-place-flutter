// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'big_five_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BigFiveAnswerRequest _$BigFiveAnswerRequestFromJson(Map<String, dynamic> json) {
  return BigFiveAnswerRequest(
    questionId: json['question_id'] as String,
    answer: json['answer'] as String?,
  );
}

Map<String, dynamic> _$BigFiveAnswerRequestToJson(
        BigFiveAnswerRequest instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'answer': instance.answer,
    };
