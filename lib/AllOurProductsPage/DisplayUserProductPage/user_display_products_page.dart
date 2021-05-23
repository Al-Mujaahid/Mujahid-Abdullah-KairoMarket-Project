import 'package:kairomarket/AllOurProductsPage/models/product.model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kairomarket/AllOurProductsPage/models/user_product.model.dart';

class DisplayUserProductPage extends StatelessWidget {
  UserProducts userproducts;
  DisplayUserProductPage({@required this.userproducts});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${userproducts.product_image}'),
                      )),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      color: Colors.black.withOpacity(.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${userproducts.product_name}',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 3,
                          ),
                          Text('${userproducts.description}',
                              style: GoogleFonts.acme(
                                color: Colors.white,
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Product Name'),
              subtitle: Text('${userproducts.product_name}'),
            ),
            ListTile(
              title: Text('Product Description'),
              subtitle: Text('${userproducts.description}'),
            ),
            ListTile(
              title: Text('Product price'),
              subtitle: Text(
                '${userproducts.price}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            ListTile(
              title: Text('Category'),
              subtitle: Text('${userproducts.category}'),
            ),
          ],
        ),
      ),
    );
  }
}
