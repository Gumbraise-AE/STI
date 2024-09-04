import '../database.dart';

class ClicksTable extends SupabaseTable<ClicksRow> {
  @override
  String get tableName => 'clicks';

  @override
  ClicksRow createRow(Map<String, dynamic> data) => ClicksRow(data);
}

class ClicksRow extends SupabaseDataRow {
  ClicksRow(super.data);

  @override
  SupabaseTable get table => ClicksTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get soundId => getField<String>('sound_id')!;
  set soundId(String value) => setField<String>('sound_id', value);

  int get clickNumber => getField<int>('click_number')!;
  set clickNumber(int value) => setField<int>('click_number', value);
}
