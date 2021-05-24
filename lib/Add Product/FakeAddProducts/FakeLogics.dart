import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'FakeAddProduct.dart';

void uploadProduct() async {
  print("posting data......");
  var dio = Dio();
  var formData = FormData.fromMap({
    'product_name': "",
    'product_image':
        await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
    'description': "",
    'price': "",
    'category': ""
  });
  var response = await dio.post(
      'http://142.93.152.229/cairo/api/add_products?token=',
      data: formData);
}
