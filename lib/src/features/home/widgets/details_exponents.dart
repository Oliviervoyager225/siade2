import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:siade2/src/commons/utils/utils.dart';

class DetailsExponents extends StatefulWidget {
  final Exponent exponent;

  const DetailsExponents({super.key, required this.exponent});

  @override
  _DetailsExponentsState createState() => _DetailsExponentsState();
}

class _DetailsExponentsState extends State<DetailsExponents> {
  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight ? Colors.white : Colors.black,
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
                    image: AssetImage(widget.exponent.imageUrl),
                    fit: BoxFit
                        .cover, // Keep cover, assuming images are sized correctly
                    colorFilter: isLight
                        ? null
                        : ColorFilter.mode(
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
                          ? [Colors.transparent, Color(0xFF60438C)]
                          : [Colors.transparent, Colors.black],
                      stops: isLight ? [0.6, 1.0] : null,
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

          Expanded(
            child: Container(
              decoration: isLight
                  ? BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF60438C), Color(0xFFDEDEDE)],
                      ),
                    )
                  : null,
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.exponent.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),

                    // Job title commented out in original file, keeping it out.
                    // Text(
                    //   widget.exponent.job,
                    //   style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    // ),
                    SizedBox(height: 30),

                    Text(
                      widget.exponent.details,
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
                            color: isLight
                                ? Color(0xFF60438C)
                                : AppColors.backgroundDefault,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(socialMedia),
                            ),
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
                              ? Container(
                                  width: 25.w,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.white, Color(0xFFA8A8A8)],
                                    ),
                                  ),
                                  padding: EdgeInsets.all(1.5),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFA8A8A8),
                                          Colors.white,
                                        ],
                                      ),
                                    ),
                                    child: Text(
                                      'Visiter Stand',
                                      style: TextStyle(
                                        color: Color(0xFF60438C),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                )
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
                                    'Visiter Stand',
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
                                    ? [Colors.white, Color(0xFF60438C)]
                                    : [
                                        AppColors.primaryRed,
                                        AppColors.primaryBlue,
                                      ],
                              ),
                            ),
                            child: Text(
                              'Telecharger',
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
