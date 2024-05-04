import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uni_mentor_app/app/app.router.dart';
import 'package:uni_mentor_app/theme/colors.dart';

class StartVM extends BaseViewModel {
  final navigationService = NavigationService();
  String google = 'assets/svg/google.svg';
  String waiting = 'assets/json/waiting.json';

  navigateToLogin() {
    navigationService.navigateToLoginView();
  }

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  var b2style = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xffECECEC),
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
