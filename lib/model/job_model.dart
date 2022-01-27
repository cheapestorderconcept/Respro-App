import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@JsonSerializable()
class JobModel {
  final String jobName;
  final String jobPrice;
  final String jobStatus;
  final String jobDesc;
  final String availableFor;
  final String jobLocation;
  final List<dynamic> jobImage;

  JobModel({required this.jobName, required this.jobPrice, required this.jobStatus, required this.jobDesc, required this.availableFor, required this.jobLocation, required this.jobImage});

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return _$JobModelFromJson(json);
  }

  // _$UserToJson is generated and available in user.g.dart
  Map<String, dynamic> toJson() => _$JobModelToJson(this);
  
}

