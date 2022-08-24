import 'dart:io';

import 'package:chat_app_riverpod/application/user/user_controller.dart';
import 'package:chat_app_riverpod/core/colors.dart';
import 'package:chat_app_riverpod/core/constants.dart';
import 'package:chat_app_riverpod/infrastructure/common/utils.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-info-screen';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  final nameController = TextEditingController();
  File? image;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      ref.read(userControllerProvider).saveUserDataToFirebase(
            context,
            name,
            image,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              k20Height,
              Stack(
                children: [
                  (image == null)
                      ? const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/avatar.png',
                          ),
                          radius: 60,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(image!),
                          radius: 60,
                        ),
                  Positioned(
                    bottom: -10,
                    right: 2,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 35,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: dimension.width * 0.8,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Name",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: storeUserData,
                    child: const Text(
                      "OK",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
