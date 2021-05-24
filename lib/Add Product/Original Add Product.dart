import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kairomarket/Categories/categories.dart';

class UploadProducts extends StatefulWidget {
  @override
  UploadProductsState createState() => UploadProductsState();
}

class UploadProductsState extends State<UploadProducts> {
  static final String uploadEndPoint =
      'http://142.93.152.229/cairo/api/add_products?token=';
  Future<PickedFile> file;
  String status = '';
  String product_image;
  String mySelection;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  TextEditingController ProductPictureDescription = new TextEditingController();
  TextEditingController ProductPictureName = new TextEditingController();
  TextEditingController ProductPicturePrice = new TextEditingController();
  bool WLoading = false;

  @override
  void initState() {
    super.initState();
  }

  chooseImage() async {
    final pickedfile =
        ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      file = pickedfile;
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
    print(status);
  }

  void ErrorShowDialog(String ErrorText) {
    AlertDialog dialog = new AlertDialog(
      content: Text(ErrorText),
    );
    showDialog(builder: (context) => dialog, context: context);
  }

  Widget showImage() {
    return FutureBuilder<PickedFile>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<PickedFile> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = File(snapshot.data.path);
          product_image =
              base64Encode(File(snapshot.data.path).readAsBytesSync());
          return Image.file(
            File(snapshot.data.path),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

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
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 4),
                child: Text("Product Pics Description:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 4),
                child: TextField(
                  controller: ProductPictureDescription,
                  decoration: InputDecoration(
                    hintText: "Please Insert Description!",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 1),
                child: Text(
                  "Product Pics Name:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 1),
                child: TextField(
                  controller: ProductPictureName,
                  decoration: InputDecoration(
                    hintText: "Please Insert Name!",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                child: Category(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 1),
                child: Text("Product Pics Price:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 1),
                child: TextField(
                  controller: ProductPicturePrice,
                  decoration: InputDecoration(
                    hintText: "Please Insert Price!",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 4),
                child: Text("Image Pics Image:",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 4),
                // ignore: deprecated_member_use
                child: OutlineButton(
                  onPressed: chooseImage,
                  child: Text('Choose Image',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              showImage(),
              Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 4, bottom: 4),
                child: (WLoading == false)
                    ? SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            'Complete Image Upload',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            if (ProductPictureDescription.text == "") {
                              ErrorShowDialog("Please Insert Description!");
                            } else if (ProductPictureName.text == "") {
                              ErrorShowDialog("Please Insert Name!");
                            } else if (ProductPicturePrice.text == "") {
                              ErrorShowDialog("Please Insert Price!");
                            } else if (tmpFile == null) {
                              ErrorShowDialog("Please Insert Image!");
                            } else {
                              setState(() {
                                WLoading = true;
                              });

                              String fileName = tmpFile.path.split('/').last;
                              await http.post(Uri.parse(uploadEndPoint), body: {
                                "product_image": product_image,
                                "category": mySelection,
                                "product_name": ProductPictureName.text,
                                "description": ProductPictureDescription.text,
                                "price": ProductPicturePrice.text,
                              });

                              setState(() {
                                WLoading = false;
                                ProductPictureDescription.text = "";
                                ProductPictureName.text = "";
                                ProductPicturePrice.text = "";
                                file = null;
                              });
                            }
                          },
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(
                            width: 10,
                          ),
                          Text(status),
                        ],
                      ),
              ),
            ],
          ),
        ));
  }
}
