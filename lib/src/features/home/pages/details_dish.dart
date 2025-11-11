import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class DetailsDish extends StatefulWidget {
  final String dish;

  const DetailsDish({super.key, required this.dish});

  @override
  _DetailsDishState createState() => _DetailsDishState();
}

class _DetailsDishState extends State<DetailsDish> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,
          expandedHeight: 340,
          leadingWidth: 100,
          toolbarHeight: 100,
          leading: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.greySecondary,
                    width: 0.5,
                  ),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xff2B2A60)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // spacing: 10,
                children: [
                  Text(
                    'Lorem',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    '1600.00',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            background: Image.asset(widget.dish, fit: BoxFit.cover),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.greySecondary,
                          width: 0.5,
                        ),
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),

                  SizedBox(width: 15),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.greySecondary,
                          width: 0.5,
                        ),
                      ),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SliverToBoxAdapter(
          child: Container(
            color: Colors.black.withValues(alpha: 0.5),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                "Lorem ipsum, or lipsum as it\n is sometimes known, is\n dummy text used in laying out\n print, graphic or web designs. \nThe passage is attributed to an unknown typesetter in the \n15th century who is thought to \nhave scrambled parts of \nCicero's De Finibus Bonorum \net Malorum for use in a type \nspecimen book. It usually \nbegins with",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
