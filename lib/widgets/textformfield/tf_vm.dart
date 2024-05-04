import 'package:stacked/stacked.dart';

class CustomTFVM extends BaseViewModel {
  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
