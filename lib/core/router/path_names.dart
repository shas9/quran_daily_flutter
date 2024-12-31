import 'package:quran_daily/core/router/app_router.dart';

class PathNames {
  PathNames._();
  static const root = home;

  static const splash = '/splash';

  static const home = '/home';
  static const surahDetails = '/surahDetails/:${AppRouter.surahNumberKey}';
  static const bookmarkPage = '/bookmarkPage';
  
  static const support = '/support';
  static const settings = '/settings';
}