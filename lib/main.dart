import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/controllers/menu_controller.dart';
import 'package:flutter_web_dashboard/controllers/navigation_controller.dart';
import 'package:flutter_web_dashboard/controllers/user_controller.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:flutter_web_dashboard/pages/404/error_page.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:flutter_web_dashboard/pages/splash_screen/splash_screen.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAVz3p1gB1QU8b1RiHvZIZk3Ge2-7G5u_Y",
          authDomain: "flutterwebpanel-55d9b.firebaseapp.com",
          projectId: "flutterwebpanel-55d9b",
          storageBucket: "flutterwebpanel-55d9b.appspot.com",
          messagingSenderId: "465438354740",
          appId: "1:465438354740:web:f07f066d6e2346e6158961",
          measurementId: "G-16YJ0K2D1Y"));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MenuController());
    Get.put(NavigationController());
    Get.put(UserController());
    return GetMaterialApp(
      initialRoute: authenticationPagePageRoute,
      unknownRoute: GetPage(
          name: "/not-found",
          page: () => const PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(name: rootRoute, page: () => SiteLayout()),
        
        GetPage(
            name: authenticationPagePageRoute,
            page: () =>  AuthenticationPage())
      ],
      debugShowCheckedModeBanner: false,
      title: 'Dash',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.blue,
      ),
    );
  }
}
