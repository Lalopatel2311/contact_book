import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  List age = [
    "under 15",
    "16-25",
    "26-35",
    "36-45",
    "46-55",
    "56-65",
    "above 66"
  ];

  final formKey = GlobalKey<FormState>();

  DocumentReference user = FirebaseFirestore.instance.collection('User').doc();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                    style: FontTextStyle.kBlack25Bold,
                  ),
                ),
                Text(
                  "Let us know about your self",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "upload your image",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.50,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(
                              Icons.person_outline,
                              size: 60,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 00,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.50,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(
                                Icons.photo_camera_back,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "enter your name",
                    controller: RegisterVariable.nameController,
                    title: "Name"),
                CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: "enter your email address",
                    controller: RegisterVariable.emailController,
                    title: "EMAIL"),
                CommonTextFormField(
                    keyboardType: TextInputType.number,
                    hintText: "enter your password",
                    controller: RegisterVariable.passwordController,
                    title: "Password"),
                CommonTextFormField(
                    keyboardType: TextInputType.number,
                    hintText: "Re enter your password",
                    controller: RegisterVariable.repeatPasswordController,
                    title: "Reenter Password"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Gender",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.50,
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/male profile pic.png",
                          ),
                        ),
                        const Text(
                          "Male",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: width * 0.04),
                    Column(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.50,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/female profile pic.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "Age",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      7,
                      (index) => MaterialButton(
                        onPressed: () {},
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              age[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                        color: Colors.indigo,
                        width: 1.50,
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.indigo,
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
