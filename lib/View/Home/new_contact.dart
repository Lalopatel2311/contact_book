import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/Controller/variable.dart';
import 'package:raj_contact_book/View/Widget/text_form_field.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({super.key});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PickColor.kWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: PickColor.kBlack,
          ),
        ),
        title: const Text("New Contacts"),
        titleTextStyle: FontTextStyle.kBlack20W500,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: PickColor.k323232,
              size: 25.sp,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CommonTextFormField(
            keyboardType: TextInputType.name,
            hintText: "enter name",
            controller: RegisterVariable.nameController,
            title: "Name",
          ),
        ],
      ),
    );
  }
}
