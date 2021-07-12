// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TogglSummary _$TogglSummaryFromJson(Map<String, dynamic> json) {
  return TogglSummary(
    totalGrand: json['total_grand'] as int?,
    totalBillable: json['total_billable'] as int?,
    data: (json['data'] as List<dynamic>)
        .map((e) => TogglData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TogglSummaryToJson(TogglSummary instance) =>
    <String, dynamic>{
      'total_grand': instance.totalGrand,
      'total_billable': instance.totalBillable,
      'data': instance.data,
    };

TogglData _$TogglDataFromJson(Map<String, dynamic> json) {
  return TogglData(
    id: json['id'] as int,
    title: ProjectInfo.fromJson(json['title'] as Map<String, dynamic>),
    time: json['time'] as int,
    timeEntries: (json['items'] as List<dynamic>)
        .map((e) => TimeEntryItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TogglDataToJson(TogglData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'time': instance.time,
      'items': instance.timeEntries,
    };

TimeEntryItem _$TimeEntryItemFromJson(Map<String, dynamic> json) {
  return TimeEntryItem(
    title: json['title']['time_entry'] as String,
    time: json['time'] as int,
  );
}

Map<String, dynamic> _$TimeEntryItemToJson(TimeEntryItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'time': instance.time,
    };

TimeEntryTitle _$TimeEntryTitleFromJson(Map<String, dynamic> json) {
  return TimeEntryTitle(
    timeEntry: json['timeEntry'] as String,
  );
}

Map<String, dynamic> _$TimeEntryTitleToJson(TimeEntryTitle instance) =>
    <String, dynamic>{
      'timeEntry': instance.timeEntry,
    };

ProjectInfo _$ProjectInfoFromJson(Map<String, dynamic> json) {
  return ProjectInfo(
    project: json['project'] as String,
    client: json['client'] as String,
  );
}

Map<String, dynamic> _$ProjectInfoToJson(ProjectInfo instance) =>
    <String, dynamic>{
      'project': instance.project,
      'client': instance.client,
    };
