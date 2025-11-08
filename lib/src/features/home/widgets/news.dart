import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final List<NewsItem> news = [
    NewsItem(
      imageUrl: 'assets/images/story_1.jpg',
      imageSender: 'assets/images/profile_image.jpg',
    ),
    NewsItem(
      imageUrl: 'assets/images/story_2.jpg',
      imageSender: 'assets/images/profile_image.jpg',
    ),
    NewsItem(
      imageUrl: 'assets/images/story_3.jpg',
      imageSender: 'assets/images/profile_image.jpg',
    ),
    NewsItem(
      imageUrl: 'assets/images/story_4.jpg',
      imageSender: 'assets/images/profile_image.jpg',
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
                "Actualités",
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
                      padding: EdgeInsetsGeometry.only(left: 16, bottom: 6),
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
                      left: 25,
                      bottom: 5,
                      child: Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
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
                                  image: AssetImage(newsItem.imageSender),
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
        ],
      ),
    );
  }
}

class NewsItem {
  final String imageUrl;
  final String imageSender;

  NewsItem({required this.imageUrl, required this.imageSender});
}
