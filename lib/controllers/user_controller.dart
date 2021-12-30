import 'dart:developer';

import 'package:flutter_web_dashboard/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static final UserController instance = Get.find();
  var user = UserModel().obs;

  updateUserInfo({String? email, String? uid}) {
    user.value.email = email;
    user.value.uid = uid;
    log("user info updated");
  }
}
