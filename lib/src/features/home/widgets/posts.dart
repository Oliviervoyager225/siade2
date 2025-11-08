import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

import '../../../commons/data/models/models.dart';

class Posts extends StatefulWidget {
  final Post post;

  const Posts({super.key, required this.post});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  late Post post;
  late List<String> images;

  late PageController _imagesController;
  int _currentIndex = 0;

  @override
  void initState() {
    post = widget.post;
    images = post.postImages;
    super.initState();

    _imagesController = PageController();
  }

  @override
  void dispose() {
    _imagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(post.imagePoster),
            radius: 25,
          ),
          title: Text(
            post.namePoster,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            post.namePoster,
            style: TextStyle(color: Colors.grey, fontSize: 13.sp),
          ),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ),
        images.length > 0
            ? Column(
                spacing: 20,
                children: [
                  // SizedBox(
                  //   height: 180.0,
                  //   child: PageView.builder(
                  //     controller: _imagesController,
                  //     onPageChanged: (index) {
                  //       setState(() {
                  //         _currentIndex = index;
                  //       });
                  //     },
                  //     itemCount: images.length,
                  //     itemBuilder: (context, index) {
                  //       final item = images[index];
                  //
                  //       return Container(height: 180, width: 90.w);
                  //     },
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (index) => GestureDetector(
                        onTap: () {
                          _imagesController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          width: _currentIndex == index ? 24.0 : 12.0,
                          height: 12.0,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? AppColors.primarySocialPink
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
