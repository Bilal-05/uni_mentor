import 'package:stacked/stacked_annotations.dart';
import 'package:uni_mentor_app/views/forget_view/forget_view.dart';
import 'package:uni_mentor_app/views/login_view/login_view.dart';
import 'package:uni_mentor_app/views/register_view/register_view.dart';
import 'package:uni_mentor_app/views/seperate_view/seperate_view.dart';
import 'package:uni_mentor_app/views/splash_view/splash_view.dart';
import 'package:uni_mentor_app/views/start_view/start_view.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: StartView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ForgotView),
    MaterialRoute(page: SeperateView)
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    Singleton(classType: SnackbarService),
    Singleton(classType: DialogService),
    Singleton(classType: BottomSheetService),
  ],
)
class App {}
