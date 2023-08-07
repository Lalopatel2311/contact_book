import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raj_contact_book/Constants/color.dart';
import 'package:raj_contact_book/Constants/image_path.dart';
import 'package:raj_contact_book/Constants/text_style.dart';
import 'package:raj_contact_book/View/Home/new_contact.dart';

class AllContactScreen extends StatefulWidget {
  const AllContactScreen({super.key});

  @override
  State<AllContactScreen> createState() => _AllContactScreenState();
}

class _AllContactScreenState extends State<AllContactScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    /// final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: PickColor.kBlack,
      appBar: AppBar(
        backgroundColor: PickColor.kBlack,
        title: const Text(
          "Contacts",
        ),
        titleTextStyle: FontTextStyle.kWhite30W500,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: PickColor.k323232,
              size: 25.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: PickColor.k323232,
              size: 25.sp,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PickColor.kSkyBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewContactScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: PickColor.kWhite,
        ),
      ),
      body: 2 / 2 == 1
          ? ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    log('ListTile');
                  },
                  leading: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: PickColor.k7B7B7B,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.sp),
                      child: Icon(
                        Icons.person,
                        size: 31.sp,
                        color: PickColor.kWhite,
                      ),
                    ),
                  ),
                  title: const Text("Raj Malaviya"),
                  titleTextStyle: TextStyle(
                    fontFamily: "JosefinSans",
                    color: PickColor.kWhite,
                  ),
                  subtitle: Text("+91 757402764",
                      style: TextStyle(color: Colors.amber.shade100)),
                  subtitleTextStyle: FontTextStyle.kWhite22W400,
                  trailing: IconButton(
                    onPressed: () {
                      log('IconButton');
                    },
                    icon: Icon(
                      Icons.call,
                      color: PickColor.kGreen,
                      size: 30.sp,
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(ImagePath.emptyBox),
                  SizedBox(height: height * 0.04),
                  Text(
                    "You have no contacts yet",
                    style: FontTextStyle.kBlackWithOpacity16W500,
                  ),
                ],
              ),
            ),
    );
  }
}
