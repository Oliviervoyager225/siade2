import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class Exponents extends StatefulWidget {
  @override
  _ExponentsState createState() => _ExponentsState();
}

class _ExponentsState extends State<Exponents> {
  final List<String> exponentsHome = [
    "assets/images/exposant.jpg",
    "assets/images/story_1.jpg",
    "assets/images/story_2.jpg",
    "assets/images/story_3.jpg",
    "assets/images/exposant.jpg",
    "assets/images/story_1.jpg",
    "assets/images/story_2.jpg",
    "assets/images/story_3.jpg",
    "assets/images/exposant.jpg",
    "assets/images/story_1.jpg",
    "assets/images/story_2.jpg",
    "assets/images/story_3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10.0, right: 85.0, bottom: 15.0),
          decoration: BoxDecoration(color: AppColors.exponentBlue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Exposants",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Gap(10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exponentsHome.length,
                  itemBuilder: (context, index) {
                    final exponent = exponentsHome[index];

                    final bool isFirst = index == 0;

                    return Container(
                      width: 60,
                      height: 50,
                      margin: EdgeInsetsGeometry.only(left: isFirst ? 16 : 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(exponent),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 35,
          child: Container(
            alignment: AlignmentGeometry.center,
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: AppColors.primaryRed,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllExponents(exponents: exponents),
                  ),
                );
              },
              child: Text(
                '+ ${exponents.length}k',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
