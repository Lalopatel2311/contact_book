import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/Controller/variable.dart';
import 'package:raj_contact_book/View/Widget/text_form_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PickColor.kBlack,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 75.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SIGN IN",
                  style: FontTextStyle.kWhite30W500,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Empowering Your Call Defense!",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Enter Your Email",
                    controller: LoginVariable.emailController,
                    title: "Email"),
                SizedBox(
                  height: 10.h,
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Enter Your Password",
                    controller: LoginVariable.passwordController,
                    title: "Password"),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password ?",
                        style: FontTextStyle.kWhite22W400,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      log(
                        "Log In Successfully!...",
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: Size(360.w, 38.h),
                      side: BorderSide(
                        color: PickColor.k7B7B7B,
                        width: 2.50.w,
                      ),
                    ),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have a account?",
                        style: TextStyle(
                          color: PickColor.kWhite,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: PickColor.kOrange,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    fixedSize: Size(360.w, 38.h),
                    side: BorderSide(
                      color: PickColor.k7B7B7B,
                      width: 2.50.sp,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google logo.png",
                        scale: 80,
                      ),
                      const Text(
                        " Login with Google",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
