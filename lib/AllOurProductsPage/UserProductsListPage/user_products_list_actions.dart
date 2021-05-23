import 'package:kairomarket/utils/api_helper.dart';

class UserProductsActions {
  static Future getUserProductsList() async {
    return ApiHelper.makeGetRequest(
        url: 'http://142.93.152.229/cairo/api/view_products?token=');
  }
}
