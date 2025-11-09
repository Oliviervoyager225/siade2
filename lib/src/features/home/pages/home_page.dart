import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import '../../../../gen/assets.gen.dart';
import '../../../commons/data/models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> languages = ['Français', 'Anglais'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 20.0,
        children: [
          Gap(15),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.images.logo.image(height: 20),
                Row(
                  children: [
                    Assets.images.language.image(width: 18, height: 18),
                    PopupMenuButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 20,
                      iconColor: Colors.white70,
                      itemBuilder: (context) => languages.map((item) {
                        return PopupMenuItem(value: item, child: Text(item));
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CarouselImages(),
          Speakers(),
          Exponents(),
          Programs(),
          News(),
          Feed(posts: posts),
        ],
      ),
    );
  }
}
