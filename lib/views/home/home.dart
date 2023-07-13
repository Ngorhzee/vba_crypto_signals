import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:vbacrypto_signal/core/constants/assets.dart';
import 'package:vbacrypto_signal/core/utils/colors.dart';

import '../dashboard/dashboard.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const ButtonNavIcon(
          icon: SvgAssets.graph,
          size: Size(50, 50),
        ),
        inactiveIcon: SvgPicture.asset(
          SvgAssets.graph,
          height: 60,
          width: 60,
          color: AppColors.hintTextColor,
          //fit: BoxFit.cover,
        ),
        // title: ("Home"),
        activeColorPrimary: const Color(0x7FEAB96B),
        // activeColorSecondary: AppColors.black,
        // textStyle: AppTextStyle.button.copyWith(
        //   fontWeight: FontWeight.w700,
        //   fontSize: 14,
        //   color: AppColors.black,
        // ),
        inactiveColorPrimary: AppColors.textColor,
      ),
      PersistentBottomNavBarItem(
        icon: const ButtonNavIcon(
          icon: SvgAssets.activity,
          size: Size(24, 24),
        ),
        inactiveIcon: SvgPicture.asset(
          SvgAssets.activity,
          height: 24,
          width: 24,
          //fit: BoxFit.cover,
        ),

        activeColorPrimary: const Color(0x7FEAB96B),
        // activeColorSecondary: AppColors.black,
        // textStyle: AppTextStyle.button.copyWith(
        //   fontWeight: FontWeight.w700,
        //   fontSize: 14,
        //   color: AppColors.black,
        // ),
        inactiveColorPrimary: AppColors.hintTextColor,
      ),
      PersistentBottomNavBarItem(
        icon: const ButtonNavIcon(
          icon: SvgAssets.settings,
          size: Size(24, 24),
        ),
        inactiveIcon: SvgPicture.asset(
          SvgAssets.settings,
          height: 24,
          width: 24,
          //fit: BoxFit.cover,
        ),
        activeColorPrimary: const Color(0x7FEAB96B),
        // activeColorSecondary: AppColors.black,
        // textStyle: AppTextStyle.button.copyWith(
        //   fontWeight: FontWeight.w700,
        //   fontSize: 14,
        //   color: AppColors.black,
        // ),
        inactiveColorPrimary: AppColors.hintTextColor,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const DashboardView(),
      const Scaffold(),
      const Scaffold(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      navBarHeight: 85,
      //margin: const EdgeInsets.all(10),
      bottomScreenMargin: 0,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0xff344555), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        colorBehindNavBar: AppColors.textColor.withOpacity(.5),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}

class ButtonNavIcon extends StatelessWidget {
  const ButtonNavIcon({super.key, required this.icon, required this.size});
  final String icon;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x7FEAB96B),
              blurRadius: 50,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: SvgPicture.asset(
          icon,
          color: AppColors.buttonColor,
          height: size.height,
          width: size.width,
        ));
  }
}
