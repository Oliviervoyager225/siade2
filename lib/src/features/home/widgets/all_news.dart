import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/features/home/widgets/feeds.dart';
import 'package:siade2/src/features/socialnetwork/pages/page.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:siade2/src/commons/data/models.dart';

import '../../../../gen/assets.gen.dart';

class AllNews extends StatefulWidget {
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isLight ? Colors.white : null,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 30.0,
                right: 30.0,
                bottom: 15.0,
              ),
              child: Column(
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
                            color: isLight
                                ? Color(0xFF60438C).withOpacity(0.3)
                                : Colors.black,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),

                      isLight
                          ? Image.asset('assets/images/logo23.png', height: 20)
                          : Assets.images.logo.image(height: 20),
                    ],
                  ),
                  Gap(40),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      separatorBuilder: (context, _) => SizedBox(width: 10),
                      itemCount: news.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final newsItem = news[index];

                        return Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 140,
                              padding: EdgeInsetsGeometry.only(
                                left: 16,
                                bottom: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(newsItem.imageUrl),
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
                            Positioned.fill(
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: isLight
                                        ? [
                                            Colors.transparent,
                                            Color(0xFF60438C)
                                                .withValues(alpha: 0.5)
                                          ]
                                        : [
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
                              left: 25,
                              bottom: 5,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: isLight
                                          ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF60438C),
                                                Color(0xFF9E87CE)
                                              ],
                                            )
                                          : LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                AppColors.primaryBlue,
                                                AppColors.primaryRed,
                                              ],
                                            ),
                                    ),
                                  ),

                                  Positioned(
                                    left: 2,
                                    top: 2,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(newsItem.imageSender),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Gap(30),
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
                                color: isSelected
                                    ? Colors.transparent
                                    : (isLight
                                        ? Color(0xFF60438C)
                                        : Colors.white),
                              ),
                              borderRadius: BorderRadius.circular(30),
                              gradient: isSelected
                                  ? LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: isLight
                                          ? [
                                              Color(0xFF60438C),
                                              Color(0xFF60438C)
                                            ]
                                          : [
                                              AppColors.primaryBlue,
                                              AppColors.primaryRed,
                                            ],
                                    )
                                  : null,
                            ),
                            child: Text(
                              selectedCategory.name,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : (isLight
                                        ? Color(0xFF60438C)
                                        : Colors.white),
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20),
                ],
              ),
            ),
            Divider(
                color: isLight ? Color(0xFF60438C).withValues(alpha: 0.2) : AppColors.greySecondary, height: 1),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(child: Feed(posts: posts)),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          color: isLight ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.home_outlined, color: isLight ? Color(0xFF60438C) : Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.mark_as_unread_sharp, color: isLight ? Color(0xFF60438C) : Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePostScreen()),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isLight 
                          ? [Color(0xFF60438C), Color(0xFF9E87CE)]
                          : [AppColors.primaryBlue, AppColors.primaryRed],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none, color: isLight ? Color(0xFF60438C) : Colors.grey),
              ),
              IconButton(
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                icon: Icon(Icons.person_outline, color: isLight ? Color(0xFF60438C) : Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
