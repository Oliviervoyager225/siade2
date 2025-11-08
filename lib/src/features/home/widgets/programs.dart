import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class Programs extends StatefulWidget {
  @override
  _ProgramsState createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  final List<ProgramsItem> programs = [
    ProgramsItem(
      imageUrl: 'assets/images/program_1.jpg',
      title: 'The Weekend',
      date: '2025-12-21',
    ),
    ProgramsItem(
      imageUrl: 'assets/images/program_2.jpg',
      title: 'Fire Store',
      date: '2025-12-22',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Programmes",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "See all",
                  style: TextStyle(color: AppColors.inkWellSeeAll),
                ),
              ),
            ],
          ),
          Gap(20),
          SizedBox(
            height: 250,
            child: ListView.separated(
              separatorBuilder: (context, _) => SizedBox(width: 10),
              itemCount: programs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final program = programs[index];

                final [day, month] = program.convertDate();

                return Stack(
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      padding: EdgeInsetsGeometry.only(left: 16, bottom: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(program.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            program.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        height: 30, // Hauteur de l'ombre
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.5),
                            ],
                          ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 60,
                        height: 65,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryBlue,
                              AppColors.primaryRed,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Text(
                              month.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              day,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProgramsItem {
  final String imageUrl;
  final String title;
  final String date;

  ProgramsItem({
    required this.imageUrl,
    required this.title,
    required this.date,
  });

  List<String> convertDate() {
    DateTime dateTime = DateFormat("yyyy-MM-dd").parse(this.date);

    String formattedDate = DateFormat("d MMM").format(dateTime);
    return formattedDate.split(' ');
  }
}
