import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> login(String email, String password) async {
  final response = await supabase.auth.signInWithPassword(
    email: email,
    password: password,
  );

  final session = response.session;
  final user = response.user;

  if (user != null) {
    print("Logged in as: ${user.email}");
  } else {
    print("Login failed");
  }
}
