import 'package:flutter/material.dart';
import '../../design_system/styles/color.dart';
import '../../design_system/styles/typography.dart';

class GojekBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const GojekBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsItems.greengojek,
      unselectedItemColor: ColorsItems.grey,
      selectedLabelStyle: SubheadBodyItems.p4,
      unselectedLabelStyle: SubheadBodyItems.p4,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          label: 'Promos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
      ],
    );
  }
}
