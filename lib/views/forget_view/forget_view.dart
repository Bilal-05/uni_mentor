import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stacked/stacked.dart';
import 'package:uni_mentor_app/theme/textstyle.dart';
import 'package:uni_mentor_app/views/forget_view/forget_vm.dart';
import 'package:uni_mentor_app/widgets/textformfield/tf.dart';

class ForgotView extends StatelessWidget {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ForgotVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    right: 0.05.sw,
                    left: 0.05.sw,
                    top: 0.075.sh,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 0.90.sw,
                          child: Text(
                            'Forget Password',
                            textAlign: TextAlign.center,
                            style: Style.bol30ptb,
                          ),
                        ),
                        SizedBox(
                          width: 0.75.sw,
                          child: Text(
                            'Reset your password here.',
                            style: Style.medium14ptb,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // 0.02.sh.verticalSpace,
                        // SizedBox(
                        //   width: 0.65.sw,
                        //   child: Text(
                        //     'Receive an email to reset your password.',
                        //     style: Style.medium14ptb,
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                        0.03.sh.verticalSpace,
                        SizedBox(
                          child: Form(
                            key: vModel.formKey,
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
                        ),
                        // const Spacer(),
                        0.02.sh.verticalSpace,
                        Container(
                          margin: EdgeInsets.only(bottom: 0.03.sh),
                          child: ElevatedButton(
                            style: vModel.b1style,
                            onPressed: () {
                              // if (vModel.formKey.currentState!.validate()) {}
                              vModel.resetPassword();
                            },
                            child: Text(
                              'Send Email',
                              style: Style.semiBold20ptw,
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
