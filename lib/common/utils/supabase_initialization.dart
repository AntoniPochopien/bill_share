import 'package:bill_share/constants/secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> supabaseInitialization() async {
  await Supabase.initialize(
    url: Secrets.supabaseUrl,
    anonKey: Secrets.supabaseAnonKey,
  );
}
