import 'dart:io';

import 'package:chat_app_riverpod/domain/user/models/user.dart';
import 'package:chat_app_riverpod/infrastructure/auth/auth_repository.dart';
import 'package:chat_app_riverpod/infrastructure/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userControllerProvider = Provider((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return UserController(ref: ref, userRepository: userRepository);
});

final userDataAuthProvider = FutureProvider((ref) {
  final userController = ref.watch(userControllerProvider);
  return userController.getUserData();
});

class UserController {
  final UserRepository userRepository;
  final ProviderRef ref;

  UserController({
    required this.ref,
    required this.userRepository,
  });

  Future<UserModel?> getUserData() async {
    UserModel? user = await userRepository.getCurrentUserData();
    return user;
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) async {
    userRepository.saveUserDataToFirebase(
      name: name,
      profilePic: profilePic,
      ref: ref,
      context: context,
    );
  }
}
