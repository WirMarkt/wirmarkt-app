import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'impact_metrics.g.dart';

@JsonSerializable()
@immutable
class ImpactMetrics {
  const ImpactMetrics(this.memberCount, this.storeCount);

  final int memberCount;
  final int storeCount;

  factory ImpactMetrics.fromJson(Map<String, dynamic> json) =>
      _$ImpactMetricsFromJson(json);

  Map<String, dynamic> toJson() => _$ImpactMetricsToJson(this);
}
