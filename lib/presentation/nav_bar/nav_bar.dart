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
      controller = TabController(length: 3, vsync: this);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var selectedIndex = widget.currentIndex.clamp(0, controller.length - 1);
    controller.animateTo(selectedIndex);

    return Scaffold(
      key: globalScaffoldKey,
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1F4C6B), Color(0xFF2C6E9B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1F4C6B).withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TabBar(
              controller: controller,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              labelPadding: EdgeInsets.zero,
              onTap: navigateToOtherScreen,
              tabs: [
                _buildNavItem(
                  Icons.menu_book_rounded,
                  'Quran',
                  widget.currentIndex == 0,
                ),
                _buildNavItem(
                  Icons.bookmark_rounded,
                  'Bookmarks',
                  widget.currentIndex == 1,
                ),
                _buildNavItem(
                  Icons.settings_rounded,
                  'Settings',
                  widget.currentIndex == 2,
                ),
              ],
            ),
          ),
        ),
      ),
      body: widget.child,
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Tab(
      height: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white70,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? Colors.white : Colors.white70,
            ),
          ),
          if (isSelected) ...[
            const SizedBox(height: 4),
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void navigateToOtherScreen(int index) {
    var canPop = GoRouter.of(context).routerDelegate.canPop();
    
    switch (index) {
      case 0:
        AppRouter.go(RouteNames.home);
        break;
      case 1:
        canPop 
          ? AppRouter.replaceAndNavigate(RouteNames.bookmarkPage)
          : AppRouter.navigate(RouteNames.bookmarkPage);
        break;
      case 2:
        canPop
          ? AppRouter.replaceAndNavigate(RouteNames.settings)
          : AppRouter.navigate(RouteNames.settings);
        break;
    }
  }
}