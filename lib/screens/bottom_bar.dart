import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade/resources/resources.dart';
import 'package:trade/screens/trade_screen.dart/trade_scren_main.dart';
import 'package:trade/services/ui_services/app_colors.dart';
import 'package:trade/screens/top_traders_screen.dart/top_traders.dart';

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({Key? key}) : super(key: key);

  @override
  State<BottomBarNavigation> createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int _selectedIndex = 0;

  // Create a PageController to manage pages
  final PageController _pageController = PageController();

  // Create a list of pages
  final List<Widget> _pages = [const TradeScreen(), const TopTradersScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Jump to the selected page using PageController
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.tabBarBottomColor,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.grey,
        selectedLabelStyle: GoogleFonts.nunitoSans(
          textStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            height: 12 / 10,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.nunitoSans(
          textStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            height: 12 / 10,
          ),
        ),
        items: <BottomNavigationBarItem>[
          _bottomNavigationBarItem(AppImages.activity, 'Trade'),
          _bottomNavigationBarItem(AppImages.user, 'Top'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String image, String label) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        color: _selectedIndex == _pages.indexOf(const TradeScreen())
            ? AppColors.green
            : AppColors.grey,
      ),
      label: label,
    );
  }
}
