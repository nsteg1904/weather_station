import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  final Function changeView;
  const NavBar({Key? key, required this.changeView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: const Color(0xFF0b1f39),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: GNav(
          backgroundColor: const Color(0xFF0b1f39),
          color: const Color(0xFF8c96a1),
          activeColor: const Color(0xFFd97104),
          tabBackgroundColor: const Color(0x406b6b6b),
          gap: 8,
          onTabChange: (index) {
            changeView(index);
          },
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.pivot_table_chart,
              text: '24 Stunden',
            ),
            GButton(
              icon: Icons.bar_chart,
              text: 'Statistiken',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}


