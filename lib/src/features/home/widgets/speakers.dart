import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class Speakers extends StatefulWidget {
  @override
  _SpeakersState createState() => _SpeakersState();
}

class _SpeakersState extends State<Speakers> {
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
                "Speakers",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllSpeakers(speakers: speakers),
                    ),
                  );
                },
                child: Text(
                  "See all",
                  style: TextStyle(color: AppColors.gestureDetectorSeeAll),
                ),
              ),
            ],
          ),
          Gap(20),
          SizedBox(
            height: 149,
            child: ListView.separated(
              separatorBuilder: (context, _) => SizedBox(width: 10),
              itemCount: speakers.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final speaker = speakers[index];

                return Stack(
                  children: [
                    Container(
                      width: 149,
                      height: 149,
                      padding: EdgeInsetsGeometry.only(left: 16, bottom: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(speaker.imageUrl),
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
                            speaker.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            speaker.job,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
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
