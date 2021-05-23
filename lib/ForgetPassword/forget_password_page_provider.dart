import 'package:kairomarket/ForgetPassword/forget_password_page_actions.dart';
import 'package:kairomarket/Login/login_page_actions.dart';
import 'package:kairomarket/utils/base_provider.dart';
import 'package:flutter/cupertino.dart';

class ForgetPasswordPageProvider extends BaseProvider {
  String email = '';
  // String password = '';
  bool passwordIsVisible = false;

  set setPasswordIsVisible(bool passVisibe) {
    passwordIsVisible = passVisibe;
    notifyListeners();
  }

  // Initialize Default Variables
  void initialize() async {
    backToLoaded();
  }

  void verifyInput(BuildContext context) {
    print('Was clicked');
    if (email.isEmpty) {
      backToInfo(message: 'All fields are required');
    } else {
      _login(context);
    }
  }

  void _login(BuildContext context) async {
    try {
      backToInProgress(message: 'Password retrieval in progress...');
      var loginData = {
        'email': email,
      };
      var loginResponse =
          await ForgetPasswordPageAction.forgetPassword(loginData: loginData);
      print('LoginResponse: $loginResponse');
      if (loginResponse['status'] == true) {
        backToSuccess(message: loginResponse['msg']);
      } else {
        backToFailed(message: loginResponse['msg']);
      }
    } catch (error) {
      backToFailed(message: '$error');
    }
  }

  ForgetPasswordPageProvider() {
    initialize();
  }
}
