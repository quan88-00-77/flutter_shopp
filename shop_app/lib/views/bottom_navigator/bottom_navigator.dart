import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/styles.dart';
import '../../controller/bottom_navigator_controller.dart';
import '../home/home_screen.dart';
import '../notification/notification_screen.dart';
import '../profile_screen.dart/profile_screen.dart';
import '../shop/shop_screen.dart';

class BottomNavigator extends StatelessWidget {
  BottomNavigator({super.key});

  final controller = Get.put(BottomNavigatorController());

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _listscreen = [
      const BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.home,
              size: 32,
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.home_outlined,
              size: 32,
            ),
          ),
          label: 'Home'),
      const BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.shopping_bag_rounded,
              size: 32,
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 32,
            ),
          ),
          label: 'Shop'),
      const BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.notifications_rounded,
              size: 32,
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.notifications_outlined,
              size: 32,
            ),
          ),
          label: 'Notifications'),
      const BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.person_rounded,
              size: 32,
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.person_outline,
              size: 32,
            ),
          ),
          label: 'Profile')
    ];

    final List<Widget> _pages = <Widget>[
      const HomeScreen(),
      const ShopScreen(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];

    return GetX<BottomNavigatorController>(builder: (builder) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: _pages,
        ),
        bottomNavigationBar: SizedBox(
            height: 96,
            child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                unselectedLabelStyle:
                    interStyle.copyWith(color: Colors.black, fontSize: 10),
                selectedLabelStyle:
                    interStyle.copyWith(fontSize: 10, color: kPrimaryColor),
                selectedItemColor: kPrimaryColor,
                unselectedItemColor: Colors.black,
                elevation: 0.0,
                currentIndex: controller.currentIndex.value,
                onTap: ((value) {
                  controller.changeCurrentIndex(index: value);
                }),
                items: _listscreen)),
      );
    });
  }
}
