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
    final isLight = Theme.of(context).brightness == Brightness.light;
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
                  color: Theme.of(context).brightness == Brightness.light
                      ? Color(0xFF180468)
                      : Colors.white,
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
                    ),
                    
                    // Gradient Overlay (Purple for Light Mode, Dark for Dark Mode or user preference)
                    // User asked for "60438C" (Purple) filter to help visibility
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 60, // Height to cover names
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              (isLight ? Color(0xFF60438C) : Colors.black).withOpacity(0.0),
                              (isLight ? Color(0xFF60438C) : Colors.black).withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Text Content (On Top)
                    Positioned(
                      bottom: 6,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: Colors.white, // Keep white text as it's now on a dark/purple background
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Gradient overlay removed as per user request for both modes
                    // if (isLight) ...
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
