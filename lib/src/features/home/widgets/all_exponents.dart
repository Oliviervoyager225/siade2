import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

import '../../../../gen/assets.gen.dart';

class AllExponents extends StatefulWidget {
  final List<Exponent> exponents;

  const AllExponents({super.key, required this.exponents});

  @override
  _AllExponentsState createState() => _AllExponentsState();
}

class _AllExponentsState extends State<AllExponents> {
  final crossAxisCount = 2;

  int selectedIndex = 0;

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
                    Navigator.pop(context);
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

            SizedBox(
              height: 45,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, _) => SizedBox(width: 8),
                itemCount: exponentCaterogies.length,
                itemBuilder: (context, index) {
                  final selectedCategory = exponentCaterogies[index];

                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },

                    child: Container(
                      alignment: Alignment.center,
                      width: 25.w,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.transparent : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        gradient: isSelected
                            ? LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.primaryBlue,
                                  AppColors.primaryRed,
                                ],
                              )
                            : null,
                      ),
                      child: Text(
                        selectedCategory.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: widget.exponents.length,
                  itemBuilder: (context, index) {
                    final exponent = widget.exponents[index];
                    return ExponentItem(exponent: exponent);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
