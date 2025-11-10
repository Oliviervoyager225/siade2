import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:sizer/sizer.dart';

import '../../../commons/data/models.dart';

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

  bool hasLiked = false;
  bool isSaved = false;

  @override
  void initState() {
    post = widget.post;
    images = post.postImages;
    hasLiked = post.hasLiked;
    isSaved = post.isSaved;
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
            post.elapsedTime,
            style: TextStyle(color: Colors.grey, fontSize: 13.sp),
          ),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ),

        
        post.postLegend.isNotEmpty ?
        Text(
          post.postLegend,
          style: TextStyle(
            color: Colors.white,
          ),
        ): SizedBox(),

        images.isNotEmpty
            ? Column(
                spacing: 20,
                children: [
                  SizedBox(
                    height: 180.0,
                    child: PageView.builder(
                      controller: _imagesController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        final image = images[index];

                        return Container(
                          height: 180,
                          width: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  images.length > 1
                      ? Row(
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
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                width: _currentIndex == index ? 10.0 : 8.0,
                                height: _currentIndex == index ? 10.0 : 8.0,
                                decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? AppColors.primarySocialPink
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              )
            : SizedBox(),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (hasLiked) {
                        post.likes += 1;
                      } else {
                        post.likes -= 1;
                      }

                      setState(() {
                        hasLiked = !hasLiked;
                        post.hasLiked = !post.hasLiked;
                      });
                    },
                    icon: Icon(
                      hasLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                  post.likes > 0
                      ? Text(
                          '${post.likes}',
                          style: TextStyle(color: Colors.white),
                        )
                      : SizedBox(),

                  SizedBox(width: 8),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sms_outlined,
                      color: Colors.white,
                    ),
                  ),
                  post.commentsNumber > 0
                      ? Text(
                          '${post.commentsNumber}',
                          style: TextStyle(color: Colors.white),
                        )
                      : SizedBox(),
                  
                  SizedBox(width: 8),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.file_upload_outlined,
                      color: Colors.white,
                    ),
                  ),
                  post.shares > 0
                      ? Text(
                          '${post.shares}',
                          style: TextStyle(color: Colors.white),
                        )
                      : SizedBox(),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  isSaved = !isSaved;
                  post.isSaved = !post.isSaved;
                });
              },
              icon: Icon(
                isSaved ? Icons.bookmark : Icons.bookmark_outline_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
