// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Courses _$$_CoursesFromJson(Map<String, dynamic> json) => _$_Courses(
      id: json['id'] as int?,
      fullname: json['fullname'] as String?,
      shortname: json['shortname'] as String?,
      idnumber: json['idnumber'] as String?,
      summary: json['summary'] as String?,
      summaryformat: json['summaryformat'] as int?,
      startdate: json['startdate'] as int?,
      enddate: json['enddate'] as int?,
      visible: json['visible'] as bool?,
      showactivitydates: json['showactivitydates'] as bool?,
      showcompletionconditions: json['showcompletionconditions'] as bool?,
      fullnamedisplay: json['fullnamedisplay'] as String?,
      viewurl: json['viewurl'] as String?,
      courseimage: json['courseimage'] as String?,
      progress: json['progress'] as int?,
      hasprogress: json['hasprogress'] as bool?,
      isfavourite: json['isfavourite'] as bool?,
      hidden: json['hidden'] as bool?,
      timeaccess: json['timeaccess'] as int?,
      showshortname: json['showshortname'] as bool?,
      coursecategory: json['coursecategory'] as String?,
    );

Map<String, dynamic> _$$_CoursesToJson(_$_Courses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'shortname': instance.shortname,
      'idnumber': instance.idnumber,
      'summary': instance.summary,
      'summaryformat': instance.summaryformat,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'visible': instance.visible,
      'showactivitydates': instance.showactivitydates,
      'showcompletionconditions': instance.showcompletionconditions,
      'fullnamedisplay': instance.fullnamedisplay,
      'viewurl': instance.viewurl,
      'courseimage': instance.courseimage,
      'progress': instance.progress,
      'hasprogress': instance.hasprogress,
      'isfavourite': instance.isfavourite,
      'hidden': instance.hidden,
      'timeaccess': instance.timeaccess,
      'showshortname': instance.showshortname,
      'coursecategory': instance.coursecategory,
    };
