import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smiring_app/presentation/pages/gird_menu/grid_menu_page.dart';
import 'package:smiring_app/presentation/pages/sns_post_analysis/instagram_post_analysis/instagram_post_analysis_page.dart';
import 'package:smiring_app/presentation/pages/sns_post_analysis/youtube_post_analysis/youtube_post_analysis_page.dart';
import 'package:smiring_app/presentation/pages/time_difference/world_clock_page.dart';
import 'package:smiring_app/presentation/pages/welcome/welcome_page.dart';
import 'package:smiring_app/presentation/pages/time_difference/timezone_table_page.dart';
import 'package:smiring_app/presentation/pages/time_difference/timezone_simple_list_page.dart';
import 'package:smiring_app/presentation/router/page_path.dart';
import 'package:smiring_app/presentation/utils/grid_menu_item_config.dart';
import 'package:smiring_app/presentation/widgets/basic_app_bar.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: PagePath.welcome, 
    routes: [
      ShellRoute(
        builder: (context, shellState, child) {
          final router = GoRouter.of(context);
          final matches = router.routerDelegate.currentConfiguration;
          final leaf = matches.last.matchedLocation;
          final showBack = leaf != PagePath.home;

          String title = 'SmiRing';
          if (leaf == PagePath.home) {
            title = 'Home';
          } 
          else if (leaf.startsWith('${PagePath.menu}/')) {
            final menuId = leaf.split('/').last;
            title = MenuRegistry.byId(menuId).title;
          } 
          else if (leaf == PagePath.timezoneSimpleList) {
            title = 'Time Difference - Simple List';
          } 
          else if (leaf == PagePath.timezoneTable) {
            title = 'Time Difference - Table';
          } 
          else if (leaf == PagePath.worldClock) {
            title = 'World Clock';
          } 
          else if (leaf.startsWith(PagePath.instagramPostAnalysis.split('/:').first)) {
            final account = leaf.split('/').last;
            title = 'Instagram Post Analysis - ${account.toUpperCase()}';
          } 
          else if (leaf == PagePath.youtubePostAnalysis) {
            title = 'YouTube Post Analysis';
          }

          // debugPrint('[shell] leaf=$leaf showBack=$showBack title=$title');

          return Scaffold(
            appBar: BasicAppBar(title: title, backButton: showBack),
            body: child,
          );
        },
        routes: [
          GoRoute(
            name: 'home',
            path: PagePath.home,
            builder: (c, s) => GridMenuPage(
              title: 'Home',
              items: MenuRegistry.homeItems
            ),
          ),
          GoRoute(
            name: 'menu',
            path: '${PagePath.menu}/:menuId',
            builder:(c, s) {
              final menuId = s.pathParameters['menuId']!;
              final menu = MenuRegistry.byId(menuId);
              return GridMenuPage(title: menu.title, items: menu.items);
            }
          ),
          GoRoute(
            name: 'tz-simple-list',
            path: PagePath.timezoneSimpleList,
            builder: (c, s) => const TimezoneSimpleListPage(),
          ),
          GoRoute(
            name: 'tz-table',
            path: PagePath.timezoneTable,
            builder: (c, s) => const TimezoneTablePage(),
          ),
          GoRoute(
            name: 'world-clock',
            path: PagePath.worldClock,
            builder: (c, s) => const WorldClockPage(),
          ),
          GoRoute(
            name: 'instagram-post-analysis',
            path: '${PagePath.instagramPostAnalysis}/:account',
            builder: (c, s) => InstagramPostAnalysisPage(account: s.pathParameters['account']!)
          ),
          GoRoute(
            name: 'youtube-post-analysis',
            path: PagePath.youtubePostAnalysis,
            builder: (c, s) => const YoutubePostAnalysisPage()
          ),
        ],
      ),
      GoRoute(
        path: PagePath.welcome, 
        builder: (c, s) => const WelcomePage(),
      ),
    ]);
  GoRouter getRouter() {
    return router;
  }
}
