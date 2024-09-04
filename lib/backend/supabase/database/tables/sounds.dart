import '../database.dart';

class SoundsTable extends SupabaseTable<SoundsRow> {
  @override
  String get tableName => 'sounds';

  @override
  SoundsRow createRow(Map<String, dynamic> data) => SoundsRow(data);
}

class SoundsRow extends SupabaseDataRow {
  SoundsRow(super.data);

  @override
  SupabaseTable get table => SoundsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get soundUrl => getField<String>('sound_url')!;
  set soundUrl(String value) => setField<String>('sound_url', value);
}
