import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/features/home/widgets/details_speakers.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class SpeakerItem extends StatefulWidget {
  final Speaker speaker;

  const SpeakerItem({super.key, required this.speaker});

  @override
  _SpakerItemState createState() => _SpakerItemState();
}

class _SpakerItemState extends State<SpeakerItem> {
  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsSpeakers(speaker: widget.speaker))
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: 155,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              border: Border.all(color: isLight ? Colors.transparent : Colors.white, width: 1),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: isLight 
                    ? [Color(0xFF60438C), Color(0xFFF0F0F0)] // Purple to Light Grey
                    : [Color(0xff040126), Color(0xff3A1521)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                Text(
                  widget.speaker.name,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                Text(
                  widget.speaker.job,
                  style: TextStyle(
                    color: isLight ? Colors.black : AppColors.primaryRed,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      
          Container(
            width: 150,
            height: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: AssetImage(widget.speaker.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
