import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade/navigation/go_router.dart';
import 'package:trade/resources/resources.dart';
import 'package:trade/screens/trade_screen.dart/trade_scren_main.dart';
import 'package:trade/services/ui_services/app_colors.dart';
import 'package:trade/screens/top_traders_screen.dart/top_traders.dart';

class BottomBarNavigation extends StatefulWidget {
  final Widget child;
  const BottomBarNavigation({
    required this.child,
    super.key,
  });

  @override
  State<BottomBarNavigation> createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: widget.child,
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
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          NavigationUtils.mobileHandleTabTap(context, index);
        },
        items: <BottomNavigationBarItem>[
          _bottomNavigationBarItem(AppImages.activity, 'Trade',
              _currentIndex == 0 ? AppColors.green : AppColors.grey),
          _bottomNavigationBarItem(AppImages.user, 'Top',
              _currentIndex == 1 ? AppColors.green : AppColors.grey),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String image, String label, Color color) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        color: color,
      ),
      label: label,
    );
  }
}
