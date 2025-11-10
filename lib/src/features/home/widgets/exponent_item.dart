import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class ExponentItem extends StatefulWidget {
  final Exponent exponent;

  const ExponentItem({super.key, required this.exponent});

  @override
  _ExponentItemState createState() => _ExponentItemState();
}

class _ExponentItemState extends State<ExponentItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsExponents(exponent: widget.exponent),
          ),
        );
      },
      child: Container(
        // width: 40.w,
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Color(0xff1F0D68),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(widget.exponent.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Share an event to with friends and get 1 ticket.',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
