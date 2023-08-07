import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/Controller/variable.dart';
import 'package:raj_contact_book/View/Widget/showToast.dart';
import 'package:raj_contact_book/View/Widget/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  DocumentReference user = FirebaseFirestore.instance.collection('User').doc();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: PickColor.kBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Text(
                    "SIGN UP",
                    style: FontTextStyle.kWhite30W500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let us know about your self",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "enter your name",
                    controller: RegisterVariable.nameController,
                    title: "Name"),
                SizedBox(
                  height: 10.sp,
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "enter your email address",
                    controller: RegisterVariable.emailController,
                    title: "Email"),
                SizedBox(
                  height: 10.sp,
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.number,
                    hintText: "enter your password",
                    controller: RegisterVariable.passwordController,
                    title: "Password"),
                SizedBox(
                  height: 10.sp,
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.number,
                    hintText: "Re enter your password",
                    controller: RegisterVariable.repeatPasswordController,
                    title: "Reenter Password"),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1,
                  ),
                  child: OutlinedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (RegisterVariable.passwordController.text ==
                            RegisterVariable.repeatPasswordController.text) {
                          try {
                            UserCredential userCredential =
                                await auth.createUserWithEmailAndPassword(
                              email: RegisterVariable.emailController.text,
                              password:
                                  RegisterVariable.passwordController.text,
                            );

                            user.collection('User').add({
                              "name": RegisterVariable.nameController.text,
                              "email": RegisterVariable.emailController.text,
                              "password":
                                  RegisterVariable.passwordController.text,
                              "re password":
                                  RegisterVariable.passwordController.text,
                            });
                          } on FirebaseAuthException catch (error) {
                            log('ERROR---------->>>>>>>>>>${error.code}');

                            showToast("${error.message}");
                          }
                        } else {
                          showToast("password doesn't match");
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(360, 45),
                      side: const BorderSide(
                        color: PickColor.k7B7B7B,
                        width: 1.50,
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: PickColor.kWhite,
                        fontSize: 18,
                      ),
                    ),
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
