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
    final isLight = Theme.of(context).brightness == Brightness.light;
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
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Reduced vertical padding
        decoration: BoxDecoration(
          color: isLight ? Color(0xFF60438C) : Color(0xff1F0D68), // Purple in Light, Dark Blue in Dark
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          spacing: 5, // Reduced spacing to avoid overflow
          children: [
            Container(
              width: double.infinity,
              height: 120,
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
              style: TextStyle(color: Colors.white, fontSize: 13),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
            SizedBox(height: 5), // Spacer causing overflow in GridView usage. Fixed height spacing instead.
            // Added Buttons to match Screenshot
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 30, // Reduced height slightly
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Visiter Stand',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 8, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 30, // Reduced height
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: isLight 
                            ? [Colors.white.withValues(alpha: 0.4), Color(0xFF472181)] 
                            : [AppColors.primaryRed, AppColors.primaryBlue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      'Telecharger',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 8, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
