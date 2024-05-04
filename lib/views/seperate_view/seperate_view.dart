import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:uni_mentor_app/theme/textstyle.dart';
import 'package:uni_mentor_app/views/seperate_view/seperate_vm.dart';

class SeperateView extends StatelessWidget {
  const SeperateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SeperateVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                right: 0.05.sw,
                left: 0.05.sw,
                top: 0.075.sh,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'What describes you the best?',
                        style: Style.bol30ptb,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    0.2.sh.verticalSpace,
                    Column(
                      children: [
                        Center(
                          child: SizedBox(
                            child: ElevatedButton(
                              style: vModel.b1style,
                              onPressed: () {
                                // vModel.register();
                              },
                              child: Text(
                                'Student',
                                style: Style.semiBold20ptw,
                              ),
                            ),
                          ),
                        ),
                        0.03.sh.verticalSpace,
                        Center(
                          child: SizedBox(
                            child: ElevatedButton(
                              style: vModel.b1style,
                              onPressed: () {
                                // vModel.register();
                              },
                              child: Text(
                                'Consultant',
                                style: Style.semiBold20ptw,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
