import 'package:flutter/material.dart';
import 'package:kairomarket/Categories/categories.dart';

class FakeAddProduct extends StatefulWidget {
  @override
  _FakeAddProductState createState() => _FakeAddProductState();
}

class _FakeAddProductState extends State<FakeAddProduct> {
  TextEditingController ProductNameController = new TextEditingController();
  TextEditingController ProductDescriptionController =
      new TextEditingController();
  TextEditingController ProductPriceController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Product"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      "Product Name:",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: TextField(
                        controller: ProductNameController,
                        decoration:
                            InputDecoration(hintText: "Input Product Name")),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      "Product Description:",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: TextField(
                        controller: ProductDescriptionController,
                        decoration: InputDecoration(
                            hintText: "Input Product Description")),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      "Product Price:",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: TextField(
                        controller: ProductPriceController,
                        decoration:
                            InputDecoration(hintText: "Input Product Price")),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      "Select Category:",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Category())
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: RaisedButton(
                          onPressed: () {},
                          color: Colors.indigo,
                          textColor: Colors.white,
                          child: Text("Choose Product Image"))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: RaisedButton(
                          onPressed: () {},
                          color: Colors.indigo,
                          textColor: Colors.white,
                          child: Text("Finish Image Upload"))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
