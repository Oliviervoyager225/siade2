import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models/program.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/features/home/widgets/all_programs.dart';
import 'package:siade2/src/theme/colors/app_colors.dart';

import '../../../../gen/assets.gen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _languageExpanded = false;
  String _selectedLanguage = 'Français';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff290F00).withValues(alpha: 0.56),
      body: Container(
        // margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xff0F090C).withValues(alpha: 0.56),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 36.0, bottom: 36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage(
                          'assets/images/photo_profile.jpg',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Fatemate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'PRODUCT DESIGNER',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: -11,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AppLayout()),
                      ),
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.greySecondary),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xffAB638C),
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // --- Langue Dropdown ---
              GestureDetector(
                onTap: () =>
                    setState(() => _languageExpanded = !_languageExpanded),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1B3A),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Assets.images.language.image(width: 25, height: 25),
                      const SizedBox(width: 10),
                      const Text(
                        'Langue',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        _languageExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),

              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLanguageOption('Anglais'),
                      _buildLanguageOption('Français'),
                    ],
                  ),
                ),
                crossFadeState: _languageExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 250),
              ),

              const SizedBox(height: 30),

              // --- Menu items ---
              _buildMenuItem(
                Assets.images.feed.image(width: 25, height: 25),
                'Programme',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllPrograms(programs: programs),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              _buildMenuItem(
                Assets.images.feed.image(width: 25, height: 25),
                'Galerie',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GalleryPage()),
                  );
                },
              ),
              const SizedBox(height: 40),
              _buildMenuItem(
                Assets.images.location.image(width: 25, height: 25),
                'Localisation',
                () {},
              ),
              const SizedBox(height: 40),
              _buildMenuItem(
                Assets.images.restaurant.image(width: 25, height: 25),
                'Resto SIADE',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RestaurantPage()),
                  );
                },
              ),

              const Spacer(),

              // --- Logo ---
              Center(
                child: Column(
                  children: [Image.asset('assets/images/logo.png', height: 40)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String lang) {
    final bool isSelected = lang == _selectedLanguage;
    return GestureDetector(
      onTap: () => setState(() => _selectedLanguage = lang),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          lang,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(Widget icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(child: icon),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
