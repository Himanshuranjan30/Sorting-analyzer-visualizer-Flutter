import 'package:algoVisualizer/analysis.dart';
import 'package:algoVisualizer/visual.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Dashboard extends StatelessWidget {
  @override
  PersistentTabController _controller=PersistentTabController(initialIndex: 0);
   List<Widget> _buildScreens() {
        return [
        
        HomeScreen(),
        Visual()
        ];
    }


    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Icons.sort),
                title: ("Analyzer"),
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.visibility),
                title: ("Visualizer"),
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
            ),
        ];
    }


  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInBack,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.bounceOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.neumorphic, // Choose the nav bar style with this property.
    );
      
    
  }
}