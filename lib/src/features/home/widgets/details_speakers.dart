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
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight ? Colors.white : Colors.black, // Dark background for dark mode, White for light (though covered by gradient)
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
                    colorFilter: isLight ? null : ColorFilter.mode( // Remove filter in light mode or adjust
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
                      colors: isLight 
                        ? [
                            Colors.transparent,
                            Color(0xFF60438C),
                          ] 
                        : [Colors.transparent, Colors.black],
                      stops: isLight ? [0.6, 1.0] : null, // Start gradient lower (60%) and end solid at bottom (100%)
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 30,
                left: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 15.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: isLight 
                          ? Color(0xFF60438C).withOpacity(0.3) 
                          : Colors.black.withValues(alpha: 0.3),
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
                      color: isLight 
                          ? Color(0xFF60438C).withOpacity(0.3) 
                          : Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          Expanded( // Wrap content in expanded to handle scrolling/background if needed, but here it's Column
            child: Container(
              // In light mode, use a gradient background to match the "White text on Purple" design
              decoration: isLight 
                  ? BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF60438C), Color(0xFFDEDEDE)], // Purple to Light Grey
                      ),
                    )
                  : null, 
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
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
                            color: isLight ? Color(0xFF60438C) : AppColors.backgroundDefault,
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
                          child: isLight
                              // Light Mode 'Echanger': Gradient Border + Gradient Background
                              ? Container(
                                  width: 25.w,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.white, Color(0xFFA8A8A8)], // Border Gradient: White -> Grey
                                    ),
                                  ),
                                  padding: EdgeInsets.all(1.5), // Border width
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Color(0xFFA8A8A8), Colors.white], // Background: Grey -> White
                                      ),
                                    ),
                                    child: Text(
                                      'Echanger',
                                      style: TextStyle(
                                        color: Color(0xFF60438C), // Purple text
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                )
                              // Dark Mode 'Echanger': Simple transparent with white border
                              : Container(
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
                                colors: isLight 
                                    ? [Colors.white, Color(0xFF60438C)] // White Top -> Purple Bottom
                                    : [AppColors.primaryRed, AppColors.primaryBlue],
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
                    SizedBox(height: 20),
                  ],
                ),
              ),
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
