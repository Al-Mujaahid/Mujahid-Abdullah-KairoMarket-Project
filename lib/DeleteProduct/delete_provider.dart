import 'package:flutter/material.dart';
import 'package:kairomarket/AllOurProductsPage/models/delete_product.dart';
import 'package:kairomarket/DeleteProduct/delete_action.dart';
import 'package:kairomarket/AllOurProductsPage/models/user_product.model.dart';
import 'package:kairomarket/utils/base_provider.dart';

class UserDeleteProductsProvider extends BaseProvider {
  List<DeleteProducts> userproductList = [];
  List<DeleteProducts> userproductListToDsplay = [];

  set setUserProductListToDisplay(List<DeleteProducts> userproducts) {
    userproductListToDsplay = userproducts;
    print(userproductListToDsplay);
    notifyListeners();
  }

  void initialize() async {
    var m = 'Loading your products list...';
    try {
      backToLoading(message: m);
      //var userproductResponse = await DeleteProductsActions.deleteUserProduct();
      //print(userproductResponse.runtimeType);
      userproductList.clear();
      userproductList = userproductList;

      //userproductList = List.from(userproductResponse['data'])
      //.map((e) => DeleteProducts.fromMap(e))
      //.toList();
      userproductList.shuffle();
      userproductList = userproductList;
      setUserProductListToDisplay = userproductList.take(20).toList();
      backToLoaded();
    } catch (error) {
      print(error);
      backToFailed(message: '$error');
      rethrow;
    }
  }

  UserDeleteProductsProvider() {
    initialize();
  }
}
