import 'package:kairomarket/Add%20Product/FakeAddProducts/FakeAddProduct.dart';
import 'package:kairomarket/Add%20Product/Original%20Add%20Product.dart';
import 'package:kairomarket/AllOurProductsPage/DisplayUserProductPage/user_display_products_page.dart';
import 'package:kairomarket/AllOurProductsPage/UserProductsListPage/user_products_list_provider.dart';
import 'package:kairomarket/Categories/categories.dart';
import 'package:kairomarket/utils/action_message_page.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class UserProductsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SingleChildScrollView(
          child: Consumer<UserProductsListProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  ActionMessagePage(
                    actionState: value.getActionState,
                  ),
                  if (value.userproductListToDsplay.length == 0 &&
                      !value.isLoading()) ...[
                    Text('Failed to load your products')
                  ],
                  ...value.userproductListToDsplay.take(20).map((b) {
                    return Container(
                        child: SizedBox(
                      child: Card(
                        child: Container(
                          child: ListTile(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Container(
                                    child:
                                        DisplayUserProductPage(userproducts: b),
                                  );
                                },
                              );
                            },
                            leading: CircleAvatar(
                              //Text ( '${photos[index].data["stats"]["week52change"] ?? ""}'),
                              backgroundImage:
                                  NetworkImage('${b.product_image}'),
                            ),
                            title: Text(
                              '${b.product_name}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('${b.description}'),
                            trailing: Text(
                              '${b.price}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo),
                            ),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                    ));
                  })
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
