import 'package:flutter/material.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/theme/theme.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    CustomDrawer(),
    ChatPage(),
    HomePage(),
    AlertPage(),
    ProfilePage(),
  ];

  final List<dynamic> icons = [
    Icons.newspaper_sharp,
    Icons.mark_as_unread_sharp,
    Icons.home_outlined,
    Icons.notifications_none,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: Container(
          color: Colors.black,
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10),
          child: NavigationBar(
            indicatorShape: CircleBorder(),
            backgroundColor: Colors.black,
            selectedIndex: _currentIndex,
            destinations: icons.map((item) {
              var index = icons.indexOf(item);
              bool isSelected = _currentIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: AnimatedContainer(
                  width: 60,
                  height: 60,
                  duration: Duration(milliseconds: 0),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryBlue,
                              AppColors.primaryRed,
                            ],
                          )
                        : null,
                    color: isSelected ? null : Colors.transparent,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    item,
                    color: isSelected ? Colors.white : Colors.grey,
                    size: isSelected ? 30 : 24,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
