import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

import '../../../../gen/assets.gen.dart';

class AllPrograms extends StatefulWidget {
  final List<Program> programs;

  const AllPrograms({super.key, required this.programs});

  @override
  _AllProgramsState createState() => _AllProgramsState();
}

class _AllProgramsState extends State<AllPrograms> {
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
              child: ListView.separated(
                separatorBuilder: (_, _) => SizedBox(height: 30),
                itemCount: widget.programs.length,
                itemBuilder: (context, index) {
                  final program = widget.programs[index];
                  return ProgramItem(program: program);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
