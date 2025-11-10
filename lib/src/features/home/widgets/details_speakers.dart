import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class DetailsSpeakers extends StatefulWidget {
  final Speaker speaker;

  const DetailsSpeakers({super.key, required this.speaker});

  @override
  _DetailsSpeakersState createState() => _DetailsSpeakersState();
}

class _DetailsSpeakersState extends State<DetailsSpeakers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: 350,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.speaker.imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withValues(alpha: 0.6),
                      BlendMode.color,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 30,
                left: 30,
                child: GestureDetector(
                  onTap: () {
                    print("Ok");
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
              ),

              Positioned(
                top: 30,
                right: 30,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 15.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.speaker.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                  widget.speaker.job,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),

                SizedBox(height: 30),

                Text(
                  widget.speaker.details,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 5,
                  children: socialMedias.map((socialMedia) {
                    return Container(
                      width: 49,
                      height: 49,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundDefault,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(socialMedia)),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 25.w,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Text(
                          'Echanger',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 45.w,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryRed,
                              AppColors.primaryBlue,
                            ],
                          ),
                        ),
                        child: Text(
                          'Prendre un rendez-vous',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<String> socialMedias = [
  "assets/images/linkedIn.png",
  "assets/images/facebook.png",
  "assets/images/tiktok.png",
  "assets/images/instagram.png",
  "assets/images/youtube.png",
];
