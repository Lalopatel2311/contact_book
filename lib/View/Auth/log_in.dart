import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/Controller/variable.dart';
import 'package:raj_contact_book/View/Home/all_contact.dart';
import 'package:raj_contact_book/View/Widget/snack_bar.dart';
import 'package:raj_contact_book/View/Widget/text_form_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  DocumentReference user = FirebaseFirestore.instance.collection('User').doc();

  FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: PickColor.kBlack,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 75.h),
            child: Form(
              key: formKey,
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
                      keyboardType: TextInputType.number,
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
                  ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential =
                                    await auth.signInWithEmailAndPassword(
                                  email: LoginVariable.emailController.text,
                                  password:
                                      LoginVariable.passwordController.text,
                                );

                                box.write('userId', userCredential.user!.uid);

                                Get.offAll(
                                  AllContactScreen(
                                      userId: userCredential.user!.uid),
                                );

                                showSnackBar('Login Successfully');
                              } on FirebaseAuthException catch (error) {
                                log('---------->>>>>>>>>>${error.code}');
                                showSnackBar("${error.message}");
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: Size(400.w, 38.h),
                      side: BorderSide(
                        color: PickColor.k7B7B7B,
                        width: 2.50.w,
                      ),
                    ),
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: PickColor.kWhite,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: const Color(0xff5c49e0),
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
                      fixedSize: Size(400.w, 50.h),
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
      ),
    );
  }
}
