import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uni_mentor_app/app/app.router.dart';
import 'package:uni_mentor_app/theme/colors.dart';

class RegisterVM extends BaseViewModel {
  final navigationService = NavigationService();
  final snackBarService = SnackbarService();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  // final texttFieldService = locator<TextFieldService>();

  clear() {
    emailController.clear();
    passController.clear();
    passConfirmController.clear();
    notifyListeners();
  }

  register() {
    if (formKey.currentState!.validate()) {
      registerUser();
    } else {
      // setBusy(false);
      snackBarService.showSnackbar(
        message: 'Please enter valid email and password',
        title: 'Error',
        duration: const Duration(seconds: 1),
      );
    }
  }

  registerUser() async {
    setBusy(true);
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      await Future.delayed(
        const Duration(milliseconds: 100),
      );
      setBusy(false);
      clear();
      snackBarService.showSnackbar(
        message: 'Account created successfully',
        title: 'Success',
        duration: const Duration(seconds: 1),
      );
      navigationService.navigateToLoginView();
    } on FirebaseAuthException catch (e) {
      setBusy(false);
      if (e.code == 'weak-password') {
        snackBarService.showSnackbar(
          message: 'The password provided is too weak.',
          title: 'Error',
          duration: const Duration(seconds: 1),
        );
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        snackBarService.showSnackbar(
          message: 'The account already exists for that email.',
          title: 'Error',
          duration: const Duration(seconds: 1),
        );
        log('The account already exists for that email.');
      }
      log(e.code);
    } catch (e) {
      setBusy(false);
      log(e.toString());
    }
  }

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  navigateToLoginView() {
    navigationService.replaceWithLoginView();
  }
}
