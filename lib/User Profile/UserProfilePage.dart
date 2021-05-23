import 'package:flutter/material.dart';
import 'package:kairomarket/AllOurProductsPage/models/UserProfileModel.dart';
import 'package:kairomarket/utils/action_message_page.dart';
import 'package:kairomarket/User Profile/UserProfileProvider.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(top: 25),
        ),
        SingleChildScrollView(
          child: Consumer<UserProfileProvider>(
            builder: (context, value, child) {
              UserProfile userProfile = value.userProfile;
              return Column(
                children: [
                  ActionMessagePage(
                    actionState: value.getActionState,
                  ),
                  if (userProfile != null) ...[
                    Container(
                        child: Column(children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Padding(
                          child: Text(
                            "My Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          padding: EdgeInsets.fromLTRB(140, 10, 140, 10),
                        ),
                      ),
                      Container(
                          child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Colors.orange),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(79, 10, 79, 10),
                              child: Column(
                                children: [
                                  Text('${userProfile.business_name}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        '${userProfile.profile_pics}'),
                                    radius: 110,
                                  ),
                                  Text('${userProfile.first_name}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30)),
                                  Text(
                                    '${userProfile.last_name}',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 7)),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.only(bottom: 2.0),
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 600,
                                    child: Card(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Address",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          '${userProfile.address}',
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )),
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: 600,
                                    child: Card(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          '${userProfile.email}',
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )),
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: 600,
                                    child: Card(
                                        child: Column(
                                      children: [
                                        Text(
                                          "Phone Number",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          '${userProfile.phone_no}',
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    )),
                                  ),
                                  Text('${userProfile.about_business}'),
                                  Text('${userProfile.about_user}'),
                                  Text('${userProfile.social_handle}'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                    ]))
                  ]
                ],
              );
            },
          ),
        ),
      ]),
    );
  }

  static fromMap(e) {}
}
