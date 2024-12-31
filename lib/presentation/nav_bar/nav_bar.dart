import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_daily/core/router/app_router.dart';
import 'package:quran_daily/core/router/route_names.dart';

final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

class NavBar extends StatefulWidget {
  final int currentIndex;
  final Widget child;

  const NavBar({required this.currentIndex, required this.child, super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      controller = TabController(length: 5, vsync: this);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).extension<CustomColors>()!;
    // final localized = AppLocalizations.of(context)!;

    var selectedIndex = widget.currentIndex;
    if (selectedIndex < 0) {
      selectedIndex = 0;
    } else if (selectedIndex >= controller.length) {
      selectedIndex = controller.length - 1;
    }
    if (selectedIndex >= 0 && selectedIndex < controller.length) {
      controller.animateTo(selectedIndex);
    }

    return Scaffold(
      key: globalScaffoldKey,
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: Material(
        elevation: 8,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // No rounded corners
          side: BorderSide(
            color: Colors.grey, // Border color
            width: 0.1, // Border width
          ),
        ),
        child: SafeArea(
          child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            onTap: (index) {
              navigateToOtherScreen(index);
            },
            labelStyle: const TextStyle(
                fontSize: 11,
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
            unselectedLabelStyle: const TextStyle(
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis),
            tabs: [
              bottomNavItem(
                Icons.home,
                'Home',
                widget.currentIndex == 0,
              ),
              bottomNavItem(
                Icons.bookmark,
                'Bookmark',
                widget.currentIndex == 1,
              ),
              bottomNavItem(
                Icons.settings,
                'Settings',
                widget.currentIndex == 2,
              ),
            ],
          ),
        ),
      ),
      body: widget.child,
    );
  }

  Tab bottomNavItem(
    IconData img,
    String label,
    bool isSelected,
  ) {
    return Tab(
      icon: Icon(img),
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }

  void navigateToOtherScreen(int index) {
    var canPop = GoRouter.of(context).routerDelegate.canPop();

    if (index == 0) {
      AppRouter.go(RouteNames.home);
    } else if (index == 1) {
      if (canPop) {
        AppRouter.replaceAndNavigate(RouteNames.bookmarkPage);
      } else {
        AppRouter.navigate(RouteNames.bookmarkPage);
      }
    } else if (index == 2) {
      if (canPop) {
        AppRouter.replaceAndNavigate(RouteNames.settings);
      } else {
        AppRouter.navigate(RouteNames.settings);
      }
    }
  }
}
