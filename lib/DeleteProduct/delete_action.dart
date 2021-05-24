import 'package:kairomarket/utils/api_helper.dart';

class DeleteProductsActions {
  static Future deleteUserProduct(id) async {
    return ApiHelper.makeGetRequest(
        url: 'http://142.93.152.229/cairo/api/delete_product/$id?token=');
  }
}
