import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String name, email, password, confirmPassword, phone;
  final int avatarId;

  RegisterSubmitted({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.avatarId,
  });
}

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String email;

  RegisterSuccess(this.email);
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  bool _isValidEmail(String email) {
    if (!email.contains('@')) return false;
    var parts = email.split('@');
    if (parts.length != 2) return false;
    if (parts[1].trim().isEmpty) return false;
    return true;
  }

  bool _isValidPassword(String password) {
    if (password.length < 6) return false;
    final hasNumber = password.contains(RegExp(r'[0-9]'));
    final hasSpecial = password.contains(
      RegExp(r'[!@#\$%\^&*()_\-+=\{\}\[\]:;,.<>?/\\|`~]'),
    );
    return hasNumber && hasSpecial;
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    // Validation (local)
    if (event.name.trim().isEmpty) {
      emit(RegisterFailure("Name required"));
      return;
    }
    if (event.phone.trim().isEmpty) {
      emit(RegisterFailure("Phone required"));
      return;
    }
    if (!_isValidEmail(event.email.trim())) {
      emit(RegisterFailure("Invalid email"));
      return;
    }
    if (!_isValidPassword(event.password.trim())) {
      emit(
        RegisterFailure("Password should be at least 6 chars and have a sign"),
      );
      return;
    }
    if (event.password.trim() != event.confirmPassword.trim()) {
      emit(RegisterFailure("Passwords do not match"));
      return;
    }

    emit(RegisterLoading());

    // API
    final url = Uri.parse('http://10.0.2.2:5000/auth/register');
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "x-api-key": "123456", // عدلها حسب المطلوب من السيرفر
        },
        body: json.encode({
          "name": event.name.trim(),
          "email": event.email.trim(),
          "password": event.password.trim(),
          "confirmPassword": event.confirmPassword.trim(),
          "phone": event.phone.trim(),
          "avaterId": event.avatarId,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RegisterSuccess(event.email.trim())); // أرجع الإيميل
      } else {
        String msg = "";
        try {
          final jsonResp = json.decode(response.body);
          msg = jsonResp["message"] ?? "Registration failed";
        } catch (e) {
          msg = response.body.toString();
        }
        emit(RegisterFailure(msg));
      }
    } catch (e) {
      emit(RegisterFailure("Network error: $e"));
    }
  }
}
