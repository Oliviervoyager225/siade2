import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import 'package:siade2/src/theme/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final double bannerHeight = 200.0;
  final double photoProfileBoxSize = 150.0;

  double get photoProfileSize => photoProfileBoxSize * 0.95;

  double get topBox => bannerHeight - photoProfileBoxSize / 2;
  double get topPhotProfile => bannerHeight - photoProfileSize / 2;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight ? Colors.white : null,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100.w,
                  height: bannerHeight + 100,
                  color: Colors.transparent,
                ),

                Positioned(
                  top: 0,
                  child: Container(
                    width: 100.w,
                    height: bannerHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile_banner.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 30,
                  top: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: bannerHeight - 60,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF07026F), Color(0xFFA01E38)],
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "assets/images/photo_profile.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, 10),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                   Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Fatemate',
                        style: TextStyle(
                          color: isLight ? Color(0xFF60438C) : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        'Etudiante',
                        style: TextStyle(
                          color: isLight ? Colors.black54 : AppColors.greySecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 25.w,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 30)),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF60438C), Color(0xFF60438C)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Des profils',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 35,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(profiles.length, (index) {
                            return Align(
                              widthFactor: 0.7,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage(profiles[index]),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileInfosPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/images/qr_code.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 30)),

          SliverPersistentHeader(
            pinned: true,
            delegate: SliverTabBarDelegate(
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'Posts'),
                  Tab(text: 'Mes activités'),
                  Tab(text: 'sessions suivies'),
                ],
                labelColor: isLight ? Color(0xFF60438C) : AppColors.primarySocialBlue,
                unselectedLabelColor: isLight ? Colors.black45 : Colors.white,
                indicatorColor: isLight ? Color(0xFF60438C) : AppColors.primarySocialBlue,
                indicatorWeight: 3,
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isLight: isLight,
            ),
          ),
        ],
        body: Container(
          color: isLight ? Colors.white : null,
          child: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(child: Feed(posts: posts)),
              Center(child: Text("Mes activités", style: TextStyle(color: isLight ? Colors.black : Colors.white))),
              Center(child: Text("Sessions suivies", style: TextStyle(color: isLight ? Colors.black : Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> profiles = [
  "assets/images/profile_1.jpg",
  "assets/images/profile_2.jpg",
  "assets/images/profile_1.jpg",
  "assets/images/profile_2.jpg",
];

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final bool isLight;

  SliverTabBarDelegate(this.tabBar, {required this.isLight});

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: isLight ? Colors.white : Colors.black,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
