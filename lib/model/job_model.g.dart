// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      jobName: json['jobName'] as String,
      jobPrice: json['jobPrice'] as String,
      jobStatus: json['jobStatus'] as String,
      jobDesc: json['jobDesc'] as String,
      availableFor: json['availableFor'] as String,
      jobLocation: json['jobLocation'] as String,
      jobImage: json['jobImage'] as List<dynamic>,
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'jobName': instance.jobName,
      'jobPrice': instance.jobPrice,
      'jobStatus': instance.jobStatus,
      'jobDesc': instance.jobDesc,
      'availableFor': instance.availableFor,
      'jobLocation': instance.jobLocation,
      'jobImage': instance.jobImage,
    };
