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
    final isLight = Theme.of(context).brightness == Brightness.light;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isLight ? Colors.white : null, // Set background color for the layout itself
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: Container(
          color: isLight ? const Color(0xFFEAEAEA) : Colors.black, // #EAEAEA background for light mode
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10),
          child: NavigationBar(
            indicatorShape: CircleBorder(),
            backgroundColor: isLight ? const Color(0xFFEAEAEA) : Colors.black, // Match container
            elevation: isLight ? 0 : 0, // Set to 0 to match the flat look in the image
            shadowColor: isLight ? Colors.black12 : null,
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
                            colors: isLight 
                                ? [Color(0xFF60438C), Colors.white] 
                                : [AppColors.primaryBlue, AppColors.primaryRed],
                          )
                        : null,
                    color: isSelected ? null : Colors.transparent,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    item,
                    color: isSelected 
                        ? Colors.white // Selected icon is always white
                        : (isLight ? Color(0xFF60438C) : Colors.grey), // Unselected icon color
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
