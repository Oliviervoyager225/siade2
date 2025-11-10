import 'package:flutter/material.dart';
import 'package:siade2/gen/assets.gen.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppLayout()),
                    );
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),

                Assets.images.logo.image(height: 20),
              ],
            ),

            Container(
              width: 100.w,
              height: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  colors: [Color(0xff305481), Color(0xff08082D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lorem ipsum',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),

                  Text(
                    'is placeholder text commonly used ',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: 'Images'),
                          Tab(text: 'Videos'),
                        ],
                        labelColor: AppColors.primarySocialBlue,
                        unselectedLabelColor: Colors.white,
                        indicator: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.primarySocialBlue,
                              width: 3,
                            ),
                          ),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


List<String> images = [
  "assets/images/carousel_1.jpg",
  "assets/images/carousel_2.jpg",
  "assets/images/carousel_3.jpg",
  "assets/images/carousel_4.jpg",
  "assets/images/carousel_5.jpg",
  "assets/images/carousel_bottom_1.jpg",
  "assets/images/carousel_bottom_2.jpg",
  "assets/images/carousel_1.jpg",
  "assets/images/carousel_2.jpg",
  "assets/images/carousel_3.jpg",
  "assets/images/carousel_4.jpg",
  "assets/images/carousel_5.jpg",
  "assets/images/carousel_bottom_1.jpg",
  "assets/images/carousel_bottom_2.jpg",
];