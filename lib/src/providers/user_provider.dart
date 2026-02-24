import 'package:flutter/material.dart';
import 'package:siade2/src/commons/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class UserProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _user;

  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get user => _user;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.login(email, password);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        // On cherche le token sous différentes clés courantes (token, access_token, key)
        final token = data['token'] ?? data['access_token'] ?? data['access'] ?? data['key'];
        
        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token.toString());
          
          _user = data['user'];
          _isLoading = false;
          notifyListeners();
          return true;
        } else {
          _error = "Token manquant dans la réponse du serveur.";
        }
      }
    } catch (e) {
      _error = _extractErrorMessage(e);
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> signup(Map<String, dynamic> userData) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    print('Attempting signup for email: ${userData['email']}');
    try {
      final response = await _apiService.signup(userData);
      print('Signup response code: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print('Exception during signup: $e');
      _error = _extractErrorMessage(e);
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.resetPassword(email);
      if (response.statusCode == 200 || response.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _error = _extractErrorMessage(e);
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  String _extractErrorMessage(dynamic e) {
    if (e is DioException) {
      final data = e.response?.data;
      if (data is Map) {
        // Cas 1: Erreur imbriquée dans la liste 'errors' (Django standard pour certains serializers)
        if (data['errors'] is List && (data['errors'] as List).isNotEmpty) {
          final firstError = data['errors'][0];
          if (firstError is Map && firstError['errors'] is Map) {
            final fieldErrors = firstError['errors'] as Map;
            final buffer = StringBuffer();
            fieldErrors.forEach((key, value) {
              buffer.write('$key: ${value.toString()}\n');
            });
            return buffer.toString().trim();
          }
        }
        
        // Cas 2: Message direct ou detail
        final message = data['message'] ?? data['error'] ?? data['detail'];
        if (message != null) return message.toString();

        // Cas 3: Dictionnaire d'erreurs simple { "email": ["..."], "username": ["..."] }
        final buffer = StringBuffer();
        data.forEach((key, value) {
          if (value is List) {
            buffer.write('$key: ${value.join(", ")}\n');
          } else if (value is String) {
            buffer.write('$key: $value\n');
          }
        });
        if (buffer.isNotEmpty) return buffer.toString().trim();
      }
      
      if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        return "Délai d'attente dépassé. Vérifiez votre connexion.";
      }
      return "Erreur serveur (${e.response?.statusCode ?? 'Inconnu'})";
    }
    return "Une erreur inattendue est survenue : ${e.toString()}";
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    _user = null;
    notifyListeners();
  }
}
