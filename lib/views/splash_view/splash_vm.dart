import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:uni_mentor_app/app/app.locator.dart';
import 'package:uni_mentor_app/app/app.router.dart';
// import 'package:uni_mentor_app/views/start_view/start_view.dart';

class SplashVM extends BaseViewModel {
  final navigationService = NavigationService();
  String logo = 'assets/images/Uni_Mentor.gif';

  initialize() async {
    // await fetchData();
    await Future.delayed(const Duration(seconds: 5));
    navigateToView();
  }

  navigateToView() {
    // if (isLogin) {
    //   if (firstLogin) {
    //     navigationService.replaceWithTransition(
    //       const StartView(),
    //       // transition: 'fade',
    //       duration: const Duration(milliseconds: 500),
    //     );
    //   } else {
    //     navigationService.replaceWithTransition(
    //       const MainMenuView(),
    //       // transition: 'fade',
    //       duration: const Duration(milliseconds: 500),
    //     );
    //   }
    // } else {
    //   navigationService.replaceWithTransition(
    //     const StartView(),
    //     // transition: 'fade',
    //     duration: const Duration(milliseconds: 500),
    //   );
    // }
    navigationService.replaceWithStartView();
  }
}
