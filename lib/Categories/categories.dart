import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kairomarket/utils/api_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() => runApp(MaterialApp());

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String _mySelection;

  final String url = "http://142.93.152.229/cairo/api/fetch_categories?token=";

  List<dynamic> data = []; //edited line

  Future getCategories() async {
    var response = await ApiHelper.makeGetRequest(url: url);
    print('Res Body');
    print(response);

    setState(() {
      data = List.from(response).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: data.map((item) {
        return DropdownMenuItem(
          child: Text(item['category_name']),
          value: item['id'].toString(),
        );
      }).toList(),
      onChanged: (newVal) {
        setState(() {
          _mySelection = newVal;
        });
      },
      value: _mySelection,
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
