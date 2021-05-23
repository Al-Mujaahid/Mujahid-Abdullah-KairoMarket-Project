import 'package:kairomarket/AllOurProductsPage/ProductsListPage/products_list_provider.dart';
import 'package:kairomarket/utils/routes.dart';
import 'package:kairomarket/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:kairomarket/navigation.dart';
import 'AllOurProductsPage/UserProductsListPage/user_products_list_provider.dart';

import 'User Profile/UserProfileProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductsListProvider()),
      ChangeNotifierProvider(create: (context) => UserProductsListProvider()),
      ChangeNotifierProvider(create: (context) => UserProfileProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KairoMarket',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) => RouteGenerator.onGenerateRoute(settings),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AjoOnlineButton(
                child: Text('Auth App'),
                onPressed: () => Navigator.of(context).pushNamed('/login')),
            SizedBox(
              height: 10,
            ),
            AjoOnlineButton(
                child: Text('Product App'),
                onPressed: () =>
                    Navigator.of(context).pushNamed('/product_list')),
            SizedBox(
              height: 10,
            ),
            AjoOnlineButton(
                child: Text('Settings Page'),
                onPressed: () => Navigator.of(context).pushNamed('/settings')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Navigation();
          }));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
