import 'package:kairomarket/utils/action_message_page.dart';
import 'package:kairomarket/utils/style.dart';
import 'package:kairomarket/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'register_page_provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://previews.123rf.com/images/andreypopov/andreypopov1704/andreypopov170400286/81079881-close-up-of-a-businesswoman-calculating-invoice-using-calculator-with-online-banking-on-laptop-scree.jpg'))),
          ),
        ),
        Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Hero(
            tag: 'APP_LOGO',
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://cdn.dribbble.com/users/160523/screenshots/3070256/artboard.png',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Hero(
            tag: 'AUTH_FORM',
            child: AnimatedContainer(
              duration: Duration(seconds: 5),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        spreadRadius: 5,
                        blurRadius: 10)
                  ]),
              child: Consumer<RegisterPageProvider>(
                builder: (context, value, child) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create an account',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'Start a deal with us',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ActionMessagePage(
                        actionState: value.getActionState,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextFormField(
                          initialValue: '${value.first_name}',
                          onChanged: (first_name) {
                            value.backToLoaded();
                            value.first_name = first_name;
                          },
                          decoration: getInputDecoration(hintText: 'Firstname')
                              .copyWith(
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextFormField(
                          initialValue: '${value.last_name}',
                          onChanged: (last_name) {
                            value.backToLoaded();
                            value.last_name = last_name;
                          },
                          decoration: getInputDecoration(hintText: 'Last name')
                              .copyWith(
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextFormField(
                          initialValue: '${value.phone_no}',
                          onChanged: (phone_no) {
                            value.backToLoaded();
                            value.phone_no = phone_no;
                          },
                          decoration:
                              getInputDecoration(hintText: 'Phone Number')
                                  .copyWith(
                            prefixIcon: Icon(Icons.phone_android),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextFormField(
                          initialValue: '${value.email}',
                          onChanged: (email) {
                            value.backToLoaded();
                            value.email = email;
                          },
                          decoration:
                              getInputDecoration(hintText: 'Email address')
                                  .copyWith(
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextFormField(
                          initialValue: '${value.password}',
                          onChanged: (password) {
                            value.backToLoaded();
                            value.password = password;
                          },
                          obscureText: !value.passwordIsVisible,
                          decoration:
                              getInputDecoration(hintText: 'Password').copyWith(
                                  suffixIcon: InkWell(
                                    onTap: () => value.setPasswordIsVisible =
                                        !value.passwordIsVisible,
                                    child: Icon(value.passwordIsVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  prefixIcon: Icon(Icons.vpn_key)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: TextFormField(
                          initialValue: '${value.confirmpassword}',
                          onChanged: (confirmpassword) {
                            value.backToLoaded();
                            value.confirmpassword = confirmpassword;
                          },
                          obscureText: !value.confirmpasswordIsVisible,
                          decoration:
                              getInputDecoration(hintText: 'Confirm Password')
                                  .copyWith(
                                      suffixIcon: InkWell(
                                        onTap: () =>
                                            value.setconfirmPasswordIsVisible =
                                                !value.passwordIsVisible,
                                        child: Icon(value.passwordIsVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      ),
                                      prefixIcon: Icon(Icons.vpn_key)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: AjoOnlineButton(
                          onPressed: () => value.verifyInput(context),
                          child: value.isLoading()
                              ? CupertinoActivityIndicator()
                              : Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16),
                                ),
                          color: Colors.indigo,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Already have an account?'),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: AjoOnlineButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed('/login'),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
