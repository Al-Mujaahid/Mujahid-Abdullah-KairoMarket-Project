import 'package:kairomarket/AllOurProductsPage/models/UserProfileModel.dart';
import 'package:kairomarket/User Profile/UserProfileActions.dart';
import 'package:kairomarket/utils/base_provider.dart';

class UserProfileProvider extends BaseProvider {
  UserProfile userProfile = null;
  void initialize() async {
    var m = 'Please wait. Fetchilng your profile...';
    try {
      backToLoading(message: m);
      var userprofileResponse = await UserProfileActions.getUserProfileList();
      print(userprofileResponse.runtimeType);
      userProfile = UserProfile.fromMap(userprofileResponse[0]);
      backToLoaded();
    } catch (error) {
      print(error);
      backToFailed(
          message: 'Something went wrong. Check your Inrenet connection');
      rethrow;
    }
  }

  UserProfileProvider() {
    initialize();
  }
}
