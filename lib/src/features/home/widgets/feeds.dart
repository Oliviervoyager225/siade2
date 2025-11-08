import 'package:flutter/material.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import 'package:siade2/src/theme/colors/app_colors.dart';

import '../../../commons/data/models/models.dart';

class Feed extends StatefulWidget {
  final List<Post> posts;

  const Feed({super.key, required this.posts});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late List<Post> posts;

  @override
  void initState() {
    posts = widget.posts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: posts.map((post) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Posts(post: post),
            ),
            Divider(color: AppColors.greyDivider, height: 3),
          ],
        );
      }).toList(),
    );
  }
}
