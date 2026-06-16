import 'package:flutter/material.dart';
import 'package:ecodcf/core/design_system/colors/app_colors.dart';
import 'package:flutter/services.dart';

class EcoBottomNav extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const EcoBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final fontSize = mediaQuery.size.width > 600 ? 12.0 : 10.0;
    
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        HapticFeedback.lightImpact();
        onTap(index);
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.forestGreen,
      unselectedItemColor: AppColors.grey600,
      backgroundColor: Colors.white,
      selectedLabelStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: fontSize),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          activeIcon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics_outlined),
          activeIcon: Icon(Icons.analytics),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school_outlined),
          activeIcon: Icon(Icons.school),
          label: 'Academy',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
