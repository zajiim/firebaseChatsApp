import 'package:chat_app_riverpod/infrastructure/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({
    required this.authRepository,
  });

  void signInWithPhone(
    BuildContext context,
    String phoneNumber,
  ) {
    authRepository.signInWithPhone(
      context,
      phoneNumber,
    );
  }

  void verifyOTP(
    BuildContext context,
    String verificationId,
    String otp,
  ) {
    authRepository.verifyOTP(
      context: context,
      otp: otp,
      verificationId: verificationId,
    );
  }
}
