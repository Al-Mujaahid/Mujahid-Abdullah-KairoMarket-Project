import 'package:flutter/material.dart';
import 'package:kairomarket/AllOurProductsPage/UserProductsListPage/user_products_list_actions.dart';
import 'package:kairomarket/AllOurProductsPage/models/user_product.model.dart';
import 'package:kairomarket/utils/base_provider.dart';

class UserProductsListProvider extends BaseProvider {
  List<UserProducts> userproductList = [];
  List<UserProducts> userproductListToDsplay = [];

  set setUserProductListToDisplay(List<UserProducts> userproducts) {
    userproductListToDsplay = userproducts;
    print(userproductListToDsplay);
    notifyListeners();
  }

  void initialize() async {
    var m = 'Loading your products list...';
    try {
      backToLoading(message: m);
      var userproductResponse = await UserProductsActions.getUserProductsList();
      print(userproductResponse.runtimeType);
      userproductList.clear();
      userproductList = userproductList;

      userproductList = List.from(userproductResponse['data'])
          .map((e) => UserProducts.fromMap(e))
          .toList();
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

  void searchProduct({String searchParam}) {
    backToInProgress(message: 'Searching products...');
    if (searchParam.isEmpty) {
      userproductList.shuffle();
      setUserProductListToDisplay = userproductList.take(20).toList();
      backToLoaded();
    } else {
      setUserProductListToDisplay = userproductList
          .where((element) => element.product_image
              .toLowerCase()
              .contains(searchParam.toLowerCase()))
          .toList();
      backToLoaded();
    }
  }

  UserProductsListProvider() {
    initialize();
  }
}
