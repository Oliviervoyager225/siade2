import 'package:flutter/material.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/theme/theme.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List<String> languages = ['Français', 'Anglais'];

  int _currentIndex = 2;

  List<Map<String, dynamic>> menuItems = [
    {"widget": Placeholder(), "icon": Icons.newspaper_sharp},
    {"widget": Placeholder(), "icon": Icons.mark_as_unread_sharp},
    {"widget": HomePage(), "icon": Icons.home_outlined},
    {"widget": Placeholder(), "icon": Icons.notifications_none},
    {"widget": Placeholder(), "icon": Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: menuItems[_currentIndex]['widget'],
        bottomNavigationBar: Container(
          color: Colors.black,
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10),
          child: NavigationBar(
            indicatorShape: CircleBorder(),
            backgroundColor: Colors.black,
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: menuItems.map((item) {
              var index = menuItems.indexOf(item);
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
                    item['icon'],
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
