import 'package:flutter/material.dart';
import 'package:siade2/gen/assets.gen.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class AllSpeakers extends StatefulWidget {
  final List<Speaker> speakers;

  const AllSpeakers({super.key, required this.speakers});

  @override
  _AllSpeakersState createState() => _AllSpeakersState();
}

class _AllSpeakersState extends State<AllSpeakers> {
  final crossAxisCount = 2;

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
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

            Expanded(
              child: Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: widget.speakers.length,
                  itemBuilder: (context, index) {
                    final speaker = widget.speakers[index];
                    return SpeakerItem(speaker: speaker);
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
