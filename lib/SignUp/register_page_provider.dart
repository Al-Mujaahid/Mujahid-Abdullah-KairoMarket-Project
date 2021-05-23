import 'package:kairomarket/Login/login_page_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:kairomarket/SignUp/register_page_actions.dart';
import 'package:kairomarket/utils/base_provider.dart';
import 'package:flutter/material.dart';
import '../navigation.dart';
import 'package:kairomarket/navigation.dart';

class RegisterPageProvider extends BaseProvider {
  String email = '';
  String password = '';
  String first_name = '';
  String last_name = '';
  String phone_no = '';
  bool passwordIsVisible = false;
  bool confirmpasswordIsVisible = false;

  String confirmpassword;

  set setconfirmPasswordIsVisible(bool setconfirmPasswordIsVisible) {}

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
    if (email.isEmpty &&
        password.isEmpty &&
        first_name.isEmpty &&
        last_name.isEmpty) {
      backToInfo(message: 'All fields are required');
    } else if (email.isNotEmpty &&
        password.isEmpty &&
        first_name.isNotEmpty &&
        last_name.isNotEmpty) {
      backToInfo(message: 'Password field is required');
    } else if (email.isEmpty &&
        password.isNotEmpty &&
        first_name.isNotEmpty &&
        last_name.isNotEmpty) {
      backToInfo(message: 'Email field is required');
    } else if (email.isNotEmpty &&
        password.isNotEmpty &&
        last_name.isNotEmpty &&
        first_name.isEmpty) {
      backToInfo(message: 'First name field is required');
    } else if (password != confirmpassword) {
      backToInfo(message: 'Password does not match');
    } else if (email.isNotEmpty &&
        password.isNotEmpty &&
        last_name.isEmpty &&
        first_name.isNotEmpty) {
      backToInfo(message: 'Last name field is required');
    } else {
      _register(context);
    }
  }

  void _register(BuildContext context) async {
    try {
      backToInProgress(message: 'Registration in progress...');
      var registerData = {
        'first_name': first_name,
        'last_name': last_name,
        'phone_no': phone_no,
        'email': email,
        'password': password
      };
      var registerResponse =
          await RegisterPageAction.register(registerData: registerData);
      print('RegisterResponse: $registerResponse');
      if (registerResponse['status'] == true) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Navigation()));
      } else {
        backToFailed(message: registerResponse['msg']);
      }
    } catch (error) {
      backToFailed(message: 'failed');
    }
  }

  RegisterPageProvider() {
    initialize();
  }
}
