import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseService {
  static SupabaseClient? _client;
  
  static SupabaseClient get client {
    if (_client == null) {
      throw Exception('Supabase not initialized. Call init() first.');
    }
    return _client!;
  }

  static Future<void> init() async {
    await dotenv.load();
    
    final url = dotenv.env['SUPABASE_URL'];
    final anonKey = dotenv.env['SUPABASE_ANON_KEY'];
    
    if (url == null || anonKey == null) {
      throw Exception('Supabase URL or ANON_KEY not found in .env file');
    }
    
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );
    
    _client = Supabase.instance.client;
  }

  // Authentication helpers
  static User? get currentUser => client.auth.currentUser;
  static bool get isLoggedIn => currentUser != null;

  // Sign in with email and password
  static Future<AuthResponse> signInWithEmail(String email, String password) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // Sign up with email and password
  static Future<AuthResponse> signUpWithEmail(String email, String password) async {
    return await client.auth.signUp(
      email: email,
      password: password,
    );
  }

  // Sign out
  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  // Listen to auth state changes
  static Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;
}
