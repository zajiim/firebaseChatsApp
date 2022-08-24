import 'dart:io';

import 'package:chat_app_riverpod/domain/user/models/user.dart';
import 'package:chat_app_riverpod/infrastructure/common/repositories/common_firebase_repo_storage.dart';
import 'package:chat_app_riverpod/infrastructure/common/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/home/home_screen.dart';

final userRepositoryProvider = Provider(
  (ref) => UserRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class UserRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  UserRepository({
    required this.auth,
    required this.firestore,
  });

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    }
    return user;
  }

  void saveUserDataToFirebase({
    required String name,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = 'assets/images/avatar.png';

      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepoProvider)
            .storeFileToFirebase(
              'profilePic/$uid',
              profilePic,
            );
      }

      var user = UserModel(
        name: name,
        uid: uid,
        profilePic: photoUrl,
        phoneNumber: auth.currentUser!.uid,
        isOnline: true,
        groupId: [],
      );

      await firestore.collection('users').doc(uid).set(user.toMap());

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } catch (e) {
      showSnackBar(context: context, message: e.toString());
    }
  }
}
