import 'package:kairomarket/utils/api_helper.dart';

class ProductsListActions {
  static Future getProductsList() async {
    return ApiHelper.makeGetRequest(
        url: 'http://142.93.152.229/cairo/api/display_products');
  }
}
