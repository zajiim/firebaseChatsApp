

import 'package:chat_app_riverpod/application/auth/controller/auth_controller.dart';
import 'package:chat_app_riverpod/core/colors.dart';
import 'package:chat_app_riverpod/core/constants.dart';
import 'package:chat_app_riverpod/infrastructure/common/utils.dart';
import 'package:chat_app_riverpod/presentation/common/widgets/common_button.dart';
import 'package:country_picker/country_picker.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  Country? country;
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country selectedCountry) {
        setState(() {
          country = selectedCountry;
        });
      },
    );
  }

  void signInWithPhone() {
    String phoneNumber = phoneNumberController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref.read(authControllerProvider).signInWithPhone(
            context,
            '+${country!.phoneCode}$phoneNumber',
          );
    } else {
      showSnackBar(
        context: context,
        message: 'Please select a country',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Enter your phone number"),
        elevation: 0,
        backgroundColor: kMainThemeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        //Experimenting
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Messenger will need to verify your phone number",
              ),
              k10Height,
              TextButton(
                onPressed: pickCountry,
                child: const Text(
                  "Pick country",
                ),
              ),
              k5Height,
              Row(
                children: [
                  if (country != null) Text('+${country!.phoneCode}'),
                  k10Width,
                  SizedBox(
                    width: dimension.width * 0.7,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: phoneNumberController,
                      decoration: const InputDecoration(
                        hintText: "Enter your phone number",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: dimension.height * 0.6,
              ),
              SizedBox(
                width: 90,
                child: CommonButton(
                  text: "Next",
                  onPressed: signInWithPhone,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
