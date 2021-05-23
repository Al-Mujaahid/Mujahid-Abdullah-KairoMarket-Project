import 'package:kairomarket/AllOurProductsPage/models/product.model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayProductPage extends StatelessWidget {
  Products products;
  DisplayProductPage({@required this.products});
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
                        image: NetworkImage('${products.image}'),
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
                          Text('${products.product_name}',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 3,
                          ),
                          Text('${products.description}',
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
              subtitle: Text('${products.product_name}'),
            ),
            ListTile(
              title: Text('Product Description'),
              subtitle: Text('${products.description}'),
            ),
            ListTile(
              title: Text('Product price'),
              subtitle: Text('${products.price}'),
            ),
            ListTile(
              title: Text('Category'),
              subtitle: Text('${products.category}'),
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    onPressed: () {},
                    color: Colors.orange,
                    child: Text(
                      "View Detail",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                Text("View on Map",
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}
