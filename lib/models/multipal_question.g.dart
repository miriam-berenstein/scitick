// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multipal_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipalQuestion _$MultipalQuestionFromJson(Map<String, dynamic> json) =>
    MultipalQuestion(
      numOfQuestion: (json['numOfQuestion'] as num).toInt(),
      type: json['type'] as String,
      imageURL: json['imageURL'] as String,
      question: json['question'] as String,
      skill: json['skill'] as String,
      topic: json['topic'] as String,
      grades:
          (json['grades'] as List<dynamic>).map((e) => e as String).toList(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String,
    )..status = json['status'] as bool;

Map<String, dynamic> _$MultipalQuestionToJson(MultipalQuestion instance) =>
    <String, dynamic>{
      'numOfQuestion': instance.numOfQuestion,
      'type': instance.type,
      'imageURL': instance.imageURL,
      'question': instance.question,
      'skill': instance.skill,
      'topic': instance.topic,
      'grades': instance.grades,
      'status': instance.status,
      'date': instance.date,
      'answers': instance.answers,
    };
