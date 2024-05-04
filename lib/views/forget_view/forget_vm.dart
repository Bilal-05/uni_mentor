// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uni_mentor_app/app/app.router.dart';
import 'package:uni_mentor_app/theme/colors.dart';

class ForgotVM extends BaseViewModel {
  final navigationService = NavigationService();
  // String forgot = 'assets/JSON/Sofa.json';
  // TextFieldService textFieldService = locator<TextFieldService>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  resetPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        final credential = await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text,
        );
        navigationService.replaceWithLoginView();
      } on FirebaseAuthException catch (e) {
        SnackbarService().showSnackbar(
          message: e.message.toString(),
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
        log(e.code);
      } catch (e) {
        log(e.toString());
      }
    } else {
      SnackbarService().showSnackbar(
        message: 'Please enter valid email',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
