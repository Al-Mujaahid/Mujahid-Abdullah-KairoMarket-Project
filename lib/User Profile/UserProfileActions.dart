import 'package:flutter/material.dart';
import 'package:kairomarket/utils/api_helper.dart';

class UserProfileActions {
  static Future getUserProfileList() async {
    return ApiHelper.makeGetRequest(
        url: 'http://142.93.152.229/cairo/api/fetch_profile?token=');
  }
}
