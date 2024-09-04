// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SoundsStruct extends BaseStruct {
  SoundsStruct({
    String? id,
    DateTime? createdAt,
    String? name,
    String? soundUrl,
  })  : _id = id,
        _createdAt = createdAt,
        _name = name,
        _soundUrl = soundUrl;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "sound_url" field.
  String? _soundUrl;
  String get soundUrl => _soundUrl ?? '';
  set soundUrl(String? val) => _soundUrl = val;

  bool hasSoundUrl() => _soundUrl != null;

  static SoundsStruct fromMap(Map<String, dynamic> data) => SoundsStruct(
        id: data['id'] as String?,
        createdAt: data['created_at'] as DateTime?,
        name: data['name'] as String?,
        soundUrl: data['sound_url'] as String?,
      );

  static SoundsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SoundsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'name': _name,
        'sound_url': _soundUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'sound_url': serializeParam(
          _soundUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static SoundsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SoundsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        soundUrl: deserializeParam(
          data['sound_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SoundsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SoundsStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        name == other.name &&
        soundUrl == other.soundUrl;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, createdAt, name, soundUrl]);
}

SoundsStruct createSoundsStruct({
  String? id,
  DateTime? createdAt,
  String? name,
  String? soundUrl,
}) =>
    SoundsStruct(
      id: id,
      createdAt: createdAt,
      name: name,
      soundUrl: soundUrl,
    );
