import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';
import 'Home_page.dart';
import 'cart_page.dart';
import 'Profile_page.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _index = 0;

  final pages = const [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      body: pages[_index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: t.translate("home"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: t.translate("cart"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: t.translate("profile"),
          ),
        ],
      ),
    );
  }
}
