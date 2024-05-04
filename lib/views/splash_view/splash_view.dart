import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_mentor_app/theme/colors.dart';
import 'package:uni_mentor_app/views/splash_view/splash_vm.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => SplashVM(),
      builder: (ctx, vModel, child) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      vModel.logo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
