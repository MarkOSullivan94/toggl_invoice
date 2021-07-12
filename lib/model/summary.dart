import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable()
class TogglSummary extends Equatable {
  const TogglSummary({
    this.totalGrand,
    this.totalBillable,
    required this.data,
  });

  @JsonKey(name: 'total_grand')
  final int? totalGrand;
  @JsonKey(name: 'total_billable')
  final int? totalBillable;
  final List<TogglData> data;

  static TogglSummary fromJson(Map<String, dynamic> json) =>
      _$TogglSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$TogglSummaryToJson(this);

  @override
  List<Object?> get props {
    return [
      totalGrand,
      totalBillable,
      data,
    ];
  }
}

@JsonSerializable()
class TogglData extends Equatable {
  const TogglData({
    required this.id,
    required this.title,
    required this.time,
    required this.timeEntries,
  });

  final int id;
  final ProjectInfo title;
  final int time;
  @JsonKey(name: 'items')
  final List<TimeEntryItem> timeEntries;

  static TogglData fromJson(Map<String, dynamic> json) =>
      _$TogglDataFromJson(json);

  Map<String, dynamic> toJson() => _$TogglDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      title,
      time,
      timeEntries,
    ];
  }
}

@JsonSerializable()
class TimeEntryItem extends Equatable {
  const TimeEntryItem({
    required this.title,
    required this.time,
  });

  final String title;
  final int time;

  static TimeEntryItem fromJson(Map<String, dynamic> json) => _$TimeEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$TimeEntryItemToJson(this);

  @override
  List<Object?> get props {
    return [
      title,
      time,
    ];
  }
}

@JsonSerializable()
class TimeEntryTitle extends Equatable {
  const TimeEntryTitle({
    required this.timeEntry,
  });

  final String timeEntry;

  static TimeEntryTitle fromJson(Map<String, dynamic> json) => _$TimeEntryTitleFromJson(json);

  Map<String, dynamic> toJson() => _$TimeEntryTitleToJson(this);

  @override
  List<Object?> get props {
    return [
      timeEntry,
    ];
  }
}

@JsonSerializable()
class ProjectInfo extends Equatable {
  const ProjectInfo({
    required this.project,
    required this.client,
  });

  final String project;
  final String client;

  static ProjectInfo fromJson(Map<String, dynamic> json) => _$ProjectInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectInfoToJson(this);

  @override
  List<Object?> get props {
    return [
      project,
      client,
    ];
  }
}
