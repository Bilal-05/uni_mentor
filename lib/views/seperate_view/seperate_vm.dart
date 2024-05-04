import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_mentor_app/theme/colors.dart';

class SeperateVM extends BaseViewModel {
  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
