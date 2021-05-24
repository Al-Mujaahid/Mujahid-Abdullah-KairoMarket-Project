import 'package:kairomarket/ForgetPassword/forget_password_page.dart';
import 'package:kairomarket/ForgetPassword/forget_password_page_provider.dart';
import 'package:kairomarket/Login/loginScreen.dart';
import 'package:kairomarket/Login/login_page_provider.dart';
import 'package:kairomarket/SignUp/register_page.dart';
import 'package:kairomarket/SignUp/register_page_provider.dart';
import 'package:kairomarket/SettingsPage/settings_page.dart';
import 'package:kairomarket/AllOurProductsPage/ProductsListPage/FakeProducts_list_page.dart';
import 'package:kairomarket/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  child: LogIn(),
                  create: (context) => LoginPageProvider(),
                ));
        break;
      case '/register':
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  child: RegisterPage(),
                  create: (context) => RegisterPageProvider(),
                ));
        break;
      case '/forgot_password':
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  child: ForgetPasswordPage(),
                  create: (context) => ForgetPasswordPageProvider(),
                ));
        break;
      case '/products_list':
        return MaterialPageRoute(builder: (context) => ProductsListPage());
        break;
      case '/settings':
        return MaterialPageRoute(builder: (context) => SettingsPage());
        break;
      case '/':
        return MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: 'KairoMarket',
                ));
        break;
    }
  }
}
