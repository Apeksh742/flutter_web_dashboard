import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controller.dart';
import 'package:flutter_web_dashboard/helpers/shared_preferences.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future<User?> signWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      userController.updateUserInfo(email: user?.email, uid: user?.uid);
      LocalStorage().setLogInStatus(true);
      Get.offAllNamed(rootRoute);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('An account already exists for that email.');
        Get.showSnackbar(const GetSnackBar(
          title: "Account already exist",
        ));
      } else if (e.code == 'user-not-found') {
        log('No account present');
        Get.snackbar("Error", "No account exist");
      } else if (e.code == 'wrong-password') {
        log('No account present');
        Get.snackbar("Error", "Email or password incorrect");
      } else {
        log(e.code.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
  //  getUserInfo(){
  //   try {
  //     if (_auth.currentUser != null) {
  //       final User? user = _auth.currentUser;
  //       log("Current user present");
  //       userController.updateUserInfo(email: user?.email, uid: user?.uid);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  User? getCurrentUser(){
    return _auth.currentUser;
  }

}
