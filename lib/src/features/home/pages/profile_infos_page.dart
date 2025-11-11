import 'package:flutter/material.dart';
import 'package:siade2/src/commons/utils/utils.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class ProfileInfosPage extends StatefulWidget {
  const ProfileInfosPage({super.key});

  @override
  _ProfileInfosPageState createState() => _ProfileInfosPageState();
}

class _ProfileInfosPageState extends State<ProfileInfosPage> {
  final double photoProfileBoxSize = 150.0;

  double get photoProfileSize => photoProfileBoxSize * 0.95;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 15.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 52.h,
                  width: 90.w,
                  margin: EdgeInsets.only(top: photoProfileSize / 2),
                  padding: EdgeInsets.only(top: 110),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/back_1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Fatemate',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),

                      Text(
                        'Etudiante',
                        style: TextStyle(
                          color: AppColors.greySecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 80,
                  child: Container(
                    height: photoProfileBoxSize,
                    width: photoProfileBoxSize,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.primaryBlue, AppColors.primaryRed],
                      ),
                      borderRadius: BorderRadius.circular(
                        photoProfileBoxSize / 2,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 5,
                  left: 83,
                  child: Container(
                    height: photoProfileSize,
                    width: photoProfileSize,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(photoProfileSize / 2),
                      image: DecorationImage(
                        image: AssetImage("assets/images/photo_profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 5,
                    children: socialMedias.map((socialMedia) {
                      return Container(
                        width: 49,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(socialMedia),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Text(
                    '@siade',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
