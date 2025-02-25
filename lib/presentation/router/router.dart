import 'package:go_router/go_router.dart';
import 'package:smiring_app/presentation/pages/home/home_page.dart';
import 'package:smiring_app/presentation/pages/welcome/welcome_page.dart';
import 'package:smiring_app/presentation/pages/time_difference/timezone_table_page.dart';
import 'package:smiring_app/presentation/pages/time_difference/timezone_scroll_page.dart';
import 'package:smiring_app/presentation/router/page_path.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: '/', 
    routes: [
      GoRoute(
        path: PagePath.welcome,
        builder: (context, state) => const WelcomePage()
        ),
        GoRoute(
        path: PagePath.home,
        builder: (context, state) => const HomePage()
        ),
        GoRoute(
        path: PagePath.timezoneTable,
        builder: (context, state) => const TimezoneTablePage()
        ),
        GoRoute(
        path: PagePath.timezoneScroll,
        builder: (context, state) => const TimezoneScrollPage()
        ),
    ]
  );
  GoRouter getRouter() {
    return router;
  }
}
