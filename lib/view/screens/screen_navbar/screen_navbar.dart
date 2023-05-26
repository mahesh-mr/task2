import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/controller/controller/controller_navigation.dart';
import 'package:test_task/view/screens/other_screens/screen_cart.dart';
import 'package:test_task/view/screens/other_screens/screen_catogory.dart';
import 'package:test_task/view/screens/other_screens/screen_saved.dart';
import 'package:test_task/view/screens/screen_home/screen_home.dart';
import 'package:test_task/view/style/color.dart';

class BottomNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home_filled,
                color: black,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.grid_view_outlined,
                color: black,
              ),
              icon: Icon(
                Icons.grid_view_rounded,
                color: grey,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: black,
              ),
              icon: Icon(
                Icons.favorite_border_outlined,
                color: grey,
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_cart,
                color: black,
              ),
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: grey,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
      body: Center(
        child: GetBuilder<NavigationController>(
          init: NavigationController(),
          builder: (controller) {
            return IndexedStack(
              index: controller.selectedIndex,
              children: [
                HomeScreen(),
                CategoriesScreen(),
                
                SaveScreen(),CartScreen(),
              ],
            );
          },
        ),
      ),
    );
  }
}
