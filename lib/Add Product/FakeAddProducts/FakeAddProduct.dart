import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kairomarket/Categories/categories.dart';
import 'FakeLogics.dart';
import 'package:dio/dio.dart';

class FakeAddProduct extends StatefulWidget {
  @override
  _FakeAddProductState createState() => _FakeAddProductState();
}

class _FakeAddProductState extends State<FakeAddProduct> {
  void uploadProduct() async {
    print("posting data......");
    var dio = Dio();
    var formData = FormData.fromMap({
      'product_name': product_name,
      'product_image': product_image,
      'description': description,
      'price': price,
      'category': category
    });
    var response = await dio.post(
        'http://142.93.152.229/cairo/api/add_products?token=',
        data: formData);
  }

  chooseImage() async {
    final pickedfile =
        ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      product_image = product_image;
    });
    //setStatus('');
  }

  String product_name = '';
  String product_image = '';
  String description = '';
  int price = 0;
  String category = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Upload Product",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Divider(
                    color: Colors.indigo,
                    thickness: 1,
                  ),
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
                    child: TextFormField(
                        onChanged: (_product_name) {
                          setState(() {
                            product_name = _product_name;
                          });
                        },
                        initialValue: product_name,
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
                    child: TextFormField(
                        maxLines: 4,
                        onChanged: (_description) {
                          setState(() {
                            description = _description;
                          });
                        },
                        initialValue: description,
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
                    child: TextFormField(
                        onChanged: (_price) {
                          setState(() {
                            price = int.parse(_price);
                          });
                        },
                        initialValue: price.toString(),
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
                          onPressed: () {
                            chooseImage();
                          },
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
                          onPressed: () {
                            uploadProduct();
                          },
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
