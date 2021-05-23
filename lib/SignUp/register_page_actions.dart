import 'package:kairomarket/SettingsPage/auth_endpoint.dart';
import 'package:kairomarket/utils/api_helper.dart';

class RegisterPageAction {
  static Future register({Map<String, String> registerData}) async {
    return ApiHelper.makePostRequest(
        url: 'http://142.93.152.229/cairo/api/auth/register',
        data: registerData,
        useFormData: true);
  }
}
