import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_daily/core/router/path_names.dart';
import 'package:quran_daily/core/router/route_names.dart';
import 'package:quran_daily/presentation/nav_bar/nav_bar.dart';
import 'package:quran_daily/presentation/pages/home_page/widgets/home_page.dart';
import 'package:quran_daily/presentation/pages/splash_page/widgets/splash_page.dart';
import 'package:quran_daily/presentation/pages/surah_detail_page/widgets/surah_detail_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();

  static const surahNumberKey = "surahNumber";

  static int getTabIndex(String name) {
    if (name == PathNames.home) {
      return 0;
    } else if (name == PathNames.bookmarkPage) {
      return 1;
    } else if (name == PathNames.settings) {
      return 2;
    } 
    return 3;
  }

  static void navigate(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
  }) {
    router.pushNamed(routeName, pathParameters: pathParameters);
  }

  static void go(String routeName) {
    router.goNamed(routeName);
  }

  static void replaceAndNavigate(String routeName) {
    router.pushReplacementNamed(routeName);
  }

  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: PathNames.root, 
    debugLogDiagnostics: true,
    routes: [
      // Splash Route
      GoRoute(
        name: RouteNames.splash,
        path: PathNames.splash,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const NoTransitionPage(
            child: SplashPage(),
          );
        },
      ),

      // Surah Details Route
      GoRoute(
        name: RouteNames.surahDetails,
        path: PathNames.surahDetails,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: SurahDetailPage(surahNumber: int.parse(state.pathParameters[surahNumberKey]!))
          );
        },
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        pageBuilder: (context, state, child) {
          int currentTabIndex = getTabIndex(
            state.fullPath ?? state.matchedLocation,
          );
          return MaterialPage(
            child: NavBar(
              currentIndex: currentTabIndex,
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            name: RouteNames.home,
            path: PathNames.home,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomePage(),
              );
            },
          ),
          // Bookmarks Route
          GoRoute(
            name: RouteNames.bookmarkPage,
            path: PathNames.bookmarkPage,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return NoTransitionPage(
                child: HomePage(),
              );
            },
          ),
          // Settings Route
          GoRoute(
            name: RouteNames.settings,
            path: PathNames.settings,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return NoTransitionPage(
                child: HomePage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
