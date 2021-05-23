import 'package:flutter/material.dart';
import 'post_model.dart';

class SearchPage extends StatefulWidget {
  final List<Post> posts;

  SearchPage({@required this.posts});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Post> _searchedPost = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Type Products here',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none),
          onChanged: (val) {
            setState(() {
              _searchedPost = widget.posts
                  .where((el) => el.product_name.contains(val))
                  .toList();
            });
          },
        ),
      ),
      body: _searchedPost.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_sharp,
                  size: 200,
                  color: Colors.grey,
                ),
                Text(
                  "Search products",
                  style: TextStyle(color: Colors.grey, fontSize: 30),
                )
              ],
            ))
          : ListView.builder(
              itemCount: _searchedPost.length,
              itemBuilder: (ctx, i) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(_searchedPost[i].image),
                      ),
                      title: Text(_searchedPost[i].product_name),
                      subtitle: Text(_searchedPost[i].description),
                      trailing: Text(_searchedPost[i].price),
                    ),
                    Divider(
                      height: 0,
                    )
                  ],
                );
              },
            ),
    );
  }
}
