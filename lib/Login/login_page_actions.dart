import 'package:kairomarket/SettingsPage/auth_endpoint.dart';
import 'package:kairomarket/utils/api_helper.dart';

class LoginPageAction {
  static Future login({loginData}) async {
    return ApiHelper.makePostRequest(
        url: 'http://142.93.152.229/cairo/api/auth/login',
        data: loginData,
        useFormData: true);
  }
}
