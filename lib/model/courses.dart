import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses.freezed.dart';
part 'courses.g.dart';

@freezed
class Courses with _$Courses {
  factory Courses({
    int? id,
    String? fullname,
    String? shortname,
    String? idnumber,
    String? summary,
    int? summaryformat,
    int? startdate,
    int? enddate,
    bool? visible,
    bool? showactivitydates,
    bool? showcompletionconditions,
    String? fullnamedisplay,
    String? viewurl,
    String? courseimage,
    int? progress,
    bool? hasprogress,
    bool? isfavourite,
    bool? hidden,
    int? timeaccess,
    bool? showshortname,
    String? coursecategory,
  }) = _Courses;

  factory Courses.fromJson(Map<String, dynamic> json) =>
      _$CoursesFromJson(json);
}
