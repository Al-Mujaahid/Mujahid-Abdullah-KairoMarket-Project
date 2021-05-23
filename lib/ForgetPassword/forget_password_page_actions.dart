import 'package:kairomarket/SettingsPage/auth_endpoint.dart';
import 'package:kairomarket/utils/api_helper.dart';

class ForgetPasswordPageAction {
  static Future forgetPassword({loginData}) async {
    return ApiHelper.makePostRequest(
        url: loginEndpoint, data: loginData, useFormData: true);
  }
}
