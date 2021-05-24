import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kairomarket/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DataListPage extends StatefulWidget {
  @override
  _DataListPageState createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  void deletePost() async {
    print('http://142.93.152.229/cairo/api/delete_product/4?token=');
    var dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return dio
        .get("http://142.93.152.229/cairo/api/delete_product/4?token=",
            options: Options(headers: {'Authorization': await getToken()}))
        .then((value) => value.data);

    try {
      print('Deleting product ...');
      var response = await Dio()
          .get("http://142.93.152.229/cairo/api/delete_product/4?token=");
      print(response);
      setState(() {
        posts = List.from(response.data).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  List posts = [];

  @override
  Widget build(BuildContext context) {
    deletePost();
    return Scaffold(
      backgroundColor: Colors.black,
      body: posts.length == 0
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Text(
                    'Deleting post...',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
          : ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                var data = posts[index];
                return SizedBox(
                    child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image(image: data['image']),
                    ),
                    title: Text(data['product_name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(data['description']),
                    trailing: Text(data['price']),
                  ),
                ));
              },
            ),
    );
  }
}

Future<String> getToken() async {
  var opening = await Hive.openBox(TOKEN_BOX);
  String token = opening.get(TOKEN_KEY) ?? 'token';
  print('Token: $token');
  return "Bearer $token";
}
