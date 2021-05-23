import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kairomarket/Search/search_page.dart';
import 'post_model.dart';
import 'dart:convert';

class SearchHome extends StatefulWidget {
  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  List<Post> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search here'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => SearchPage(
                        posts: _posts,
                      )));
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CircularProgressIndicator();
//
          return ListView.builder(
            itemBuilder: (ctx, i) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(_posts[i].image),
                    ),
                    title: Text(_posts[i].product_name),
                    subtitle: Text(_posts[i].description),
                    trailing: Text(
                      _posts[i].price,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                    isThreeLine: true,
                  ),
                  Divider(
                    height: 0,
                  )
                ],
              );
            },
            itemCount: _posts.length,
          );
        },
      ),
    );
  }

  Future<void> _getData() async {
    var url = 'http://142.93.152.229/cairo/api/search_products';
    http.post(Uri.parse(url)).then((data) {
      return json.decode(data.body);
    }).then((data) {
      for (var json in data) {
        _posts.add(Post.fromJson(json));
      }
    }).catchError((e) {
      print(e);
    });
  }
}
