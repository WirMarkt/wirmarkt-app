import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@immutable
@JsonSerializable()
class File {
  final int id;
  @JsonKey(name: "directus_files_id")
  final String fileId;

  const File({required this.id, required this.fileId});

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);
}
