import 'package:flutter/material.dart';
import 'package:kairomarket/AllOurProductsPage/DisplayProductsPage/display_products_page.dart';
import 'package:kairomarket/AllOurProductsPage/ProductsListPage/products_list_provider.dart';
import 'package:kairomarket/utils/action_message_page.dart';
import 'package:provider/provider.dart';
import '../UserProductsListPage/user_products_list_page.dart';
import '../../Search/search_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          toolbarHeight: 122,
          bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 30),
              child: Consumer<ProductsListProvider>(
                builder: (context, value, child) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'KairoMarket',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                            Padding(padding: EdgeInsets.only(left: 146)),
                            IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SearchHome();
                                  }));
                                }),
                            IconButton(
                                icon: Icon(Icons.refresh),
                                color: Colors.white,
                                onPressed: () => value.initialize()),
                          ],
                        ),

                        ////////TAB BAR IS ADDED HERE////////
                        TabBar(
                          tabs: [
                            Tab(
                              icon: Icon(Icons.shopping_cart_sharp),
                              text: "Trends",
                            ),
                            Tab(
                                icon: Icon(Icons.shopping_basket),
                                text: "My Products"),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
        body: TabBarView(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Consumer<ProductsListProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        ActionMessagePage(
                          actionState: value.getActionState,
                        ),
                        if (value.productListToDsplay.length == 0 &&
                            !value.isLoading()) ...[
                          Text('No product to display')
                        ],
                        ...value.productListToDsplay.take(40).map((e) {
                          return Container(
                              child: SizedBox(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Container(
                                        child: DisplayProductPage(products: e),
                                      );
                                    },
                                  );
                                },
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage('${e.image}'),
                                ),
                                title: Text(
                                  '${e.product_name}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('${e.description}'),
                                trailing: Text('N' '${e.price}',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold)),
                                isThreeLine: true,
                              ),
                            ),
                          ));
                          Divider();
                        })
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(child: UserProductsListPage()),
          ],
        ),
      ),
    );
  }
}
