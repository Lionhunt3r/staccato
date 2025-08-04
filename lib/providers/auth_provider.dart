import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supabase_service.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserProfile? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  UserProfile? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _currentUser != null;

  AuthProvider() {
    _initAuthListener();
  }

  void _initAuthListener() {
    SupabaseService.authStateChanges.listen((AuthState state) {
      final session = state.session;
      if (session != null) {
        _loadUserProfile(session.user.id);
      } else {
        _currentUser = null;
        notifyListeners();
      }
    });
  }

  Future<void> _loadUserProfile(String userId) async {
    try {
      final response = await SupabaseService.client
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();
      
      _currentUser = UserProfile.fromJson(response);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to load user profile: $e';
      notifyListeners();
    }
  }

  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    _clearError();

    try {
      final response = await SupabaseService.signInWithEmail(email, password);
      
      if (response.user != null) {
        await _loadUserProfile(response.user!.id);
        _setLoading(false);
        return true;
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _setLoading(false);
    return false;
  }

  Future<bool> signUp(String email, String password, String firstName, String lastName, UserRole role) async {
    _setLoading(true);
    _clearError();

    try {
      // Sign up the user
      final response = await SupabaseService.signUpWithEmail(email, password);
      
      if (response.user != null) {
        // Create user profile
        await SupabaseService.client.from('profiles').insert({
          'id': response.user!.id,
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
          'role': role.toString().split('.').last,
          'created_at': DateTime.now().toIso8601String(),
        });

        await _loadUserProfile(response.user!.id);
        _setLoading(false);
        return true;
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _setLoading(false);
    return false;
  }

  Future<void> signOut() async {
    _setLoading(true);
    
    try {
      await SupabaseService.signOut();
      _currentUser = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
