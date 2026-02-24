import 'package:flutter/material.dart';
import 'package:siade2/gen/assets.gen.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: isLight ? Colors.white : null, // Dark mode falls back to theme or default
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: NestedScrollView(
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                expandedHeight: 10,
                elevation: 0,
                leadingWidth: 30,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 16,
                    width: 16,
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
                actions: [
                  isLight 
                      ? Image.asset('assets/images/logo23.png', height: 20)
                      : Assets.images.logo.image(height: 20)
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 100.w,
                      height: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                          colors: isLight
                              ? [Color(0xFF60438C), Color(0xFF9E87CE)] // Purple gradient for light mode
                              : [Color(0xff305481), Color(0xff08082D)],
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 45.w,
                      height: 6.h,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: isLight 
                            ? Colors.transparent 
                            : Colors.black.withValues(alpha: 0.5),
                        border: isLight ? Border.all(color: Color(0xFF60438C)) : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            shape: BoxShape.rectangle,
                            gradient: isLight
                                ? LinearGradient(colors: [Color(0xFF60438C), Color(0xFF60438C)]) // Solid purple for selected tab in light mode
                                : RadialGradient(
                                    radius: 2,
                                    colors: [
                                      Color(0xff2737CF).withValues(alpha: 0.4),
                                      Color(0xff6562FB).withValues(alpha: 1),
                                    ],
                                  ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: isLight ? Color(0xFF60438C) : Colors.grey,
                          tabs: const [
                            Tab(text: 'Images'),
                            Tab(text: 'Vidéos'),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],

            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: images.length,
                        (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PreviewImage(image: images[index]),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                              image: DecorationImage(
                                image: AssetImage(images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        pattern: [
                          QuiltedGridTile(1, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: videos.length,
                        (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PreviewVideo(video: videos[index]),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                              image: DecorationImage(
                                image: AssetImage(videos[index].thumbnailUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        pattern: [
                          QuiltedGridTile(1, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> images = [
  "assets/images/carousel_1.jpg",
  "assets/images/carousel_2.jpg",
  "assets/images/carousel_3.jpg",
  "assets/images/carousel_4.jpg",
  "assets/images/carousel_5.jpg",
  "assets/images/carousel_bottom_1.jpg",
  "assets/images/carousel_bottom_2.jpg",
  "assets/images/carousel_1.jpg",
  "assets/images/carousel_2.jpg",
  "assets/images/carousel_3.jpg",
  "assets/images/carousel_4.jpg",
  "assets/images/carousel_5.jpg",
  "assets/images/carousel_bottom_1.jpg",
  "assets/images/carousel_bottom_2.jpg",
];

class VideoData {
  final String url;
  final String title;
  final String thumbnailUrl;

  VideoData({
    required this.url,
    required this.title,
    required this.thumbnailUrl,
  });
}

List<VideoData> videos = [
  VideoData(
    url: 'assets/videos/video.mp4',
    title: 'Sample Video 1',
    thumbnailUrl: 'assets/images/carousel_5.jpg',
  ),
  VideoData(
    url: 'assets/videos/video.mp4',
    title: 'Sample Video 2',
    thumbnailUrl: 'assets/images/carousel_1.jpg',
  ),
  VideoData(
    url: 'assets/videos/video.mp4',
    title: 'Sample Video 1',
    thumbnailUrl: 'assets/images/carousel_2.jpg',
  ),
  VideoData(
    url: 'assets/videos/video.mp4',
    title: 'Sample Video 2',
    thumbnailUrl: 'assets/images/carousel_3.jpg',
  ),
  VideoData(
    url: 'assets/videos/video.mp4',
    title: 'Sample Video 1',
    thumbnailUrl: 'assets/images/carousel_4.jpg',
  ),
  VideoData(
    url: 'assets/videos/video.mp4',
    title: 'Sample Video 2',
    thumbnailUrl: 'assets/images/carousel_bottom_1.jpg',
  ),
  VideoData(
    url: 'assets/videos/video.mp4',
    title: 'Sample Video 1',
    thumbnailUrl: 'assets/images/carousel_bottom_2.jpg',
  ),
  VideoData(
    url: 'assets/videos/video.mp4',
    title: 'Sample Video 2',
    thumbnailUrl: 'assets/images/carousel_5.jpg',
  ),

  // Add more videos
];
