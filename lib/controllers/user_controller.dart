import 'dart:developer';

import 'package:flutter_web_dashboard/models/user_model.dart';
import 'package:flutter_web_dashboard/services/auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static final UserController instance = Get.find();
  var user = UserModel().obs;

  void updateUserInfo({String? email, String? uid}) {
    user.update((user) {
      user?.email = email;
      user?.uid = uid;
     });
    // user.value.email = email;
    // user.value.uid = uid;
    // user.refresh();
    log("user info updated");
  }
}
