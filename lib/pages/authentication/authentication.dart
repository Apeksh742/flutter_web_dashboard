import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/services/auth.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset(
                      "icons/logo.png",
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  CustomText(
                    text: "Welcome back to the admin panel",
                    color: lightGrey,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SignUpForm(),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(text: "Do not have admin credentials? "),
                TextSpan(
                    text: "Request credentials",
                    style: TextStyle(color: active)),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? email;
  String? passwd;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Email can\'t be empty';
                } else if (!value!.contains(RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                  return 'Enter a correct email address';
                }
              },
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "abc@gmail.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onChanged: (value) {
                passwd = value;
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Enter password";
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "1234",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RememberMeWidget(),
          CustomText(
            text: "Forgot Password",
            color: active,
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      InkWell(
        onTap: () async {
          if (_formKey.currentState?.validate() ?? false) {
            setState(() {
              isLoading = true;
            });
            await AuthServices().signWithEmailPassword(email!, passwd!);
            setState(() {
              isLoading = false;
            });
            
            // Get.off(()=> false);
            // Get.until((route) => false);
            // await Future.delayed(const Duration(microseconds: 300));
            // log("root route coming");
            // Navigator.pushNamed(context, rootRoute);
            // Get.toNamed(rootRoute);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: active,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : const CustomText(
                  text: "Login",
                  color: Colors.white,
                ),
        ),
      )
    ]);
  }
}

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({Key? key}) : super(key: key);

  @override
  _RememberMeWidgetState createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool? isRemember = true;
  checkBoxHandler(bool? value) {
    setState(() {
      isRemember = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: isRemember, onChanged: checkBoxHandler),
        const CustomText(text: "Remember Me"),
      ],
    );
  }
}
