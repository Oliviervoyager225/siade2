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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    width: 100.w,
                    height: 300,
                    color: Colors.transparent,
                  ),
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
                        colorFilter: ColorFilter.mode(
                          Colors.black.withValues(alpha: 0.6),
                          BlendMode.color,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 30,
                  top: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
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
                  top: topBox,
                  child: Container(
                    height: photoProfileBoxSize,
                    width: photoProfileBoxSize,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.primaryBlue, AppColors.primaryRed],
                      ),
                      borderRadius: BorderRadius.circular(
                        photoProfileBoxSize / 2,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: topPhotProfile,
                  child: Container(
                    height: photoProfileSize,
                    width: photoProfileSize,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(photoProfileSize / 2),
                      image: DecorationImage(
                        image: AssetImage("assets/images/photo_profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 250,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 20.w,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.elevatedButtonBlue,
                        border: Border.all(color: AppColors.greySecondary),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.5.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fatemate',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          'Etudiante',
                          style: TextStyle(
                            color: AppColors.greySecondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 30.w,
                  top: 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greySecondary),
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 30)),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 15.h,
              decoration: BoxDecoration(
                color: AppColors.profileQrBox,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        'Des profils',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(
                        height: 35,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, _) => SizedBox(),
                          itemCount: profiles.length,
                          itemBuilder: (context, index) {
                            final image = profiles[index];

                            return Transform.translate(
                              offset: Offset(-15.0 * index, 0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(image),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: AppColors.qrBox,
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 7),
                          ),
                          child: Image.asset("assets/images/qr_code.png"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 30)),

          SliverPersistentHeader(
            // pinned: true,
            delegate: SliverTabBarDelegate(
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'Posts'),
                  Tab(text: 'Mes activités'),
                  Tab(text: 'Sessions suivies'),
                ],
                labelColor: AppColors.primarySocialBlue,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.primarySocialBlue,
                      width: 3,
                    ),
                  ),
                ),
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(child: Feed(posts: posts)),
            Text("Mes activités", style: TextStyle(color: Colors.white)),
            Text("Sessions suivies", style: TextStyle(color: Colors.white)),
          ],
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

  SliverTabBarDelegate(this.tabBar);

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
      // color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
