import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siade2/l10n/app_localizations.dart';
import 'package:siade2/src/commons/data/models/program.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/features/home/widgets/all_programs.dart';
import 'package:siade2/src/features/socialnetwork/pages/page.dart';
import 'package:siade2/src/features/maps/pages/maps_page.dart';
import 'package:siade2/src/providers/providers.dart';
import 'package:siade2/src/theme/colors/app_colors.dart';

import '../../../../gen/assets.gen.dart';

//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _languageExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLanguage = localeProvider.locale?.languageCode == 'en'
        ? l10n.english
        : l10n.french;

    return Scaffold(
      backgroundColor: isLight
          ? const Color(0xFFEAEAEA)
          : const Color(0xFF0F0026),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: isLight
                ? Colors.white
                : const Color(0xFF1E1B3A).withOpacity(0.5),
            boxShadow: isLight
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Profile Header ---
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/images/photo_profile.jpg',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fatemate',
                            style: TextStyle(
                              color: isLight
                                  ? const Color(0xFF423B69)
                                  : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'PRODUCT DESIGNER',
                            style: TextStyle(
                              color: isLight ? Colors.black45 : Colors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isLight
                            ? const Color(0xFFF0F4FF)
                            : Colors.white10,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xffAB638C),
                        size: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // --- Menu Content ---
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // --- Langue Dropdown ---
                        GestureDetector(
                          onTap: () => setState(
                            () => _languageExpanded = !_languageExpanded,
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: const Color(0xFF423B69),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            child: Row(
                              children: [
                                Assets.images.language.image(
                                  width: 24,
                                  height: 24,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  l10n.language,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  _languageExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (_languageExpanded) ...[
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                _buildLanguageOption(
                                  l10n.english,
                                  'en',
                                  isLight,
                                  localeProvider,
                                ),
                                _buildLanguageOption(
                                  l10n.french,
                                  'fr',
                                  isLight,
                                  localeProvider,
                                ),
                              ],
                            ),
                          ),
                        ],

                        const SizedBox(height: 25),

                        // --- Section Thème ---
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: isLight
                                ? Colors.transparent
                                : Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Provider.of<ThemeProvider>(
                                          context,
                                        ).isDarkMode
                                        ? Icons.dark_mode
                                        : Icons.light_mode,
                                    color: isLight
                                        ? const Color(0xFF423B69)
                                        : Colors.white,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    l10n.darkMode,
                                    style: TextStyle(
                                      color: isLight
                                          ? const Color(
                                              0xFF423B69,
                                            ).withOpacity(0.8)
                                          : Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                value: Provider.of<ThemeProvider>(
                                  context,
                                ).isDarkMode,
                                onChanged: (_) {
                                  Provider.of<ThemeProvider>(
                                    context,
                                    listen: false,
                                  ).toggleTheme();
                                },
                                activeColor: const Color(0xffAB638C),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        // --- Other Menu items ---
                        _buildMenuItem(
                          Assets.images.feed.image(
                            width: 22,
                            height: 22,
                            color: isLight
                                ? const Color(0xFF423B69)
                                : Colors.white,
                          ),
                          l10n.program,
                          isLight,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AllPrograms(programs: programs),
                            ),
                          ),
                        ),
                        _buildMenuItem(
                          Assets.images.gallery.image(
                            width: 22,
                            height: 22,
                            color: isLight
                                ? const Color(0xFF423B69)
                                : Colors.white,
                          ),
                          l10n.gallery,
                          isLight,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GalleryPage(),
                            ),
                          ),
                        ),
                        _buildMenuItem(
                          Assets.images.location.image(
                            width: 22,
                            height: 22,
                            color: isLight
                                ? const Color(0xFF423B69)
                                : Colors.white,
                          ),
                          l10n.location,
                          isLight,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapsNavigationScreen(),
                            ),
                          ),
                        ),
                        _buildMenuItem(
                          Assets.images.live.image(
                            width: 22,
                            height: 22,
                            color: isLight
                                ? const Color(0xFF423B69)
                                : Colors.white,
                          ),
                          l10n.live,
                          isLight,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LiveStreamScreen(),
                            ),
                          ),
                        ),
                        _buildMenuItem(
                          Assets.images.restaurant.image(
                            width: 22,
                            height: 22,
                            color: isLight
                                ? const Color(0xFF423B69)
                                : Colors.white,
                          ),
                          l10n.restaurant,
                          isLight,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantPage(),
                            ),
                          ),
                        ),
                        _buildMenuItem(
                          const Icon(
                            Icons.settings,
                            color: Color(0xFF423B69),
                            size: 22,
                          ),
                          l10n.settings,
                          isLight,
                          () {
                            // Empty for now as requested
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // --- SIADE Logo at bottom ---
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                        children: [
                          TextSpan(
                            text: 'SI',
                            style: TextStyle(
                              color: isLight
                                  ? Colors.grey[400]
                                  : Colors.white24,
                            ),
                          ),
                          const TextSpan(
                            text: 'A',
                            style: TextStyle(color: Color(0xFF64B5F6)),
                          ),
                          TextSpan(
                            text: 'DE',
                            style: TextStyle(
                              color: isLight
                                  ? Colors.grey[400]
                                  : Colors.white24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    String label,
    String langCode,
    bool isLight,
    LocaleProvider localeProvider,
  ) {
    final bool isSelected = localeProvider.locale?.languageCode == langCode;
    return GestureDetector(
      onTap: () {
        localeProvider.setLocale(Locale(langCode));
        setState(() {
          _languageExpanded = false;
        });
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 6, left: 10, right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? (isLight ? const Color(0xFF635A8E) : Colors.white10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : (isLight
                      ? const Color(0xFF423B69).withOpacity(0.7)
                      : Colors.grey),
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    Widget icon,
    String label,
    bool isLight,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        child: Row(
          children: [
            SizedBox(width: 32, child: Center(child: icon)),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: isLight
                    ? const Color(0xFF423B69).withOpacity(0.8)
                    : Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
