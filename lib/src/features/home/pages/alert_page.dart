import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/theme/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({super.key});

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Alerts",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
        
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (_, _) => SizedBox(height: 50),
                itemCount: alerts.length,
                itemBuilder: (context, index) {
                  Alert item = alerts[index];
        
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          item.getDateString(),
                          style: TextStyle(
                            color: AppColors.greySecondary,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
        
                      Column(
                        children: item.alerts.map((alert) {
                          return Column(
                            spacing: 10,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: AppColors.darkGrey,
                                    radius: 40,
                                    child: Icon(Icons.thumb_up_alt_outlined, color: AppColors.primarySocialBlue,),
                                  ),
                                  title: Text(
                                    alert['title'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    alert['hour'],
                                    style: TextStyle(color: AppColors.greySecondary),
                                  ),
                                ),
                              ),
        
                              Divider(color: AppColors.greySecondary, height: 0.2),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
