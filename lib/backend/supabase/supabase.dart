import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://cbcthljgmwhlatkdmdqa.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNiY3RobGpnbXdobGF0a2RtZHFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUzODg0MDEsImV4cCI6MjA0MDk2NDQwMX0.F3frCI4ott-tGr3cgTBJ1ccYV-xQAURbdfAeimv4Phw';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
