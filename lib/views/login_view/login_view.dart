import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_mentor_app/theme/textstyle.dart';
import 'package:uni_mentor_app/views/login_view/login_vm.dart';
import 'package:uni_mentor_app/widgets/textformfield/tf.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      // onViewModelReady: (viewModel) => viewModel.initialize(),
      viewModelBuilder: () => LoginVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: InkWell(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 0.05.sw,
                    left: 0.05.sw,
                    top: 0.075.sh,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            'Login here',
                            style: Style.bol30ptb,
                          ),
                        ),
                        0.02.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              'Welcome back you\'ve been missed',
                              style: Style.medium14ptb,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        0.05.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            child: Form(
                              key: vModel.formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: CustomTextField(
                                      keyboardType: TextInputType.emailAddress,
                                      suffix: null,
                                      controller: vModel.emailController,
                                      hintText: 'Email',
                                      validator: (value) {
                                        bool emailValid = RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value!);

                                        if (value.isEmpty || !emailValid) {
                                          return 'Enter correct email';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  20.verticalSpace,
                                  SizedBox(
                                    child: CustomTextField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      suffix: null,
                                      controller: vModel.passController,
                                      hintText: 'Password',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter correct password';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        0.02.sh.verticalSpace,
                        SizedBox(
                          child: InkWell(
                            onTap: () {
                              vModel.navigateToForgotView();
                            },
                            child: Text(
                              'Forgot your password?',
                              style: Style.semiBold16ptb,
                            ),
                          ),
                        ),
                        0.03.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            child: ElevatedButton(
                              style: vModel.b1style,
                              onPressed: () {
                                vModel.login();
                              },
                              child: vModel.isBusy
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Sign in',
                                      style: Style.semiBold20ptw,
                                    ),
                            ),
                          ),
                        ),
                        0.03.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            child: InkWell(
                              onTap: () {
                                vModel.navigateToRegisterView();
                              },
                              child: Text(
                                'Create an account',
                                style: Style.semiBold16ptb,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
