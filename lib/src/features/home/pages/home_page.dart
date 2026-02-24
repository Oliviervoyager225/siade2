import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:siade2/l10n/app_localizations.dart';
import 'package:siade2/src/features/home/widgets/widgets.dart';
import '../../../../gen/assets.gen.dart';
import '../../../commons/data/models.dart';
import 'package:provider/provider.dart';
import 'package:siade2/src/providers/providers.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      backgroundColor: isLight ? Colors.white : null,
      body: SingleChildScrollView(
        child: Column(
          spacing: 20.0,
          children: [
            Gap(15),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo SIADE - Updated to logo23.png
                  Image.asset(
                    'assets/images/logo23.png',
                    height: 18,
                    fit: BoxFit.contain,
                    color: isLight ? const Color(0xFF180468) : null,
                  ),
                  Row(
                    children: [
                      Assets.images.language.image(
                        width: 18,
                        height: 18,
                        color: isLight ? Color(0xFF180468) : null,
                      ),
                      PopupMenuButton<String>(
                        onSelected: (String code) {
                          localeProvider.setLocale(Locale(code));
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: isLight ? Color(0xFF180468) : Colors.white70,
                        ),
                        iconSize: 20,
                        itemBuilder: (context) => [
                          PopupMenuItem(value: 'fr', child: Text(l10n.french)),
                          PopupMenuItem(value: 'en', child: Text(l10n.english)),
                        ],
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
      ),
    );
  }
}
