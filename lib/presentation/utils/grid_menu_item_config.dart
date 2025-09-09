import 'package:flutter/material.dart';

class MenuItemConfig {
  final String id;
  final String label;
  final IconData icon;
  final String routeName;
  final String? assetPath; // 画像パス（将来の拡張用）
  final Map<String, String> params;
  const MenuItemConfig({
    required this.id,
    required this.label,
    required this.icon,
    required this.routeName,
    this.assetPath,
    this.params = const {},
  });
}

class MenuConfig {
  final String id;
  final String title;
  final List<MenuItemConfig> items;
  const MenuConfig({
    required this.id,
    required this.title,
    required this.items,
  });
}


class MenuRegistry{
  static final Map<String, MenuConfig> _menus = {
    'home': const MenuConfig(
      id: 'home',
      title: 'Home',
      items: [
        MenuItemConfig(
          id: 'sns-post-analysis',
          label: 'SNS Post Analysis',
          icon: Icons.analytics,
          routeName: 'menu',
          params: {'menuId': 'sns-post-analysis'},
        ),
        MenuItemConfig(
          id: 'time-difference',
          label: 'Time Difference',
          icon: Icons.watch_later,
          routeName: 'menu',
          params: {'menuId': 'time-difference'},
        ),
      ]
    ),
    'sns-post-analysis': const MenuConfig(
      id: 'sns-post-analysis',
      title: 'SNS Post Analysis',
      items: [
        MenuItemConfig(
          id: 'instagram_post_analysis',
          label: 'Instagram Post Analysis',
          icon: Icons.photo,
          routeName: 'menu',
          params: {'menuId': 'instagram-post-analysis'},
        ),
        MenuItemConfig(
          id: 'youtube_post_analysis',
          label: 'YouTube Post Analysis',
          icon: Icons.video_library,
          routeName: 'youtube-post-analysis',
        )
      ],
    ),
    'instagram-post-analysis': const MenuConfig(
      id: 'instagram-post-analysis',
      title: 'Instagram - Account Selection',
      items: [
        MenuItemConfig(id: 'insta-main', 
          label: 'Main Account', 
          icon: Icons.flag, 
          routeName: 'instagram-post-analysis', 
          params: {'account': 'main'},
        ),
        MenuItemConfig(
          id: 'insta-us',
          label: 'US Account',
          icon: Icons.flag,
          routeName: 'instagram-post-analysis',
          params: {'account': 'us'},
        ),
        MenuItemConfig(
          id: 'insta-cal',
          label: 'California Account',
          icon: Icons.flag,
          routeName: 'instagram-post-analysis',
          params: {'account': 'cal'},
        ),
        MenuItemConfig(
          id: 'insta-eu',
          label: 'EU Account',
          icon: Icons.flag,
          routeName: 'instagram-post-analysis',
          params: {'account': 'eu'},
        ),
        MenuItemConfig(
          id: 'insta-asia',
          label: 'Asia Account',
          icon: Icons.flag,
          routeName: 'instagram-post-analysis',
          params: {'account': 'asia'},
        ),
        MenuItemConfig(
          id: 'insta-mal',
          label: 'Malaysia Account',
          icon: Icons.flag,
          routeName: 'instagram-post-analysis',
          params: {'account': 'mal'},
        ),
        MenuItemConfig(
          id: 'insta-ca',
          label: 'Canada Account',
          icon: Icons.flag,
          routeName: 'instagram-post-analysis',
          params: {'account': 'ca'},
        ),
        MenuItemConfig(
          id: 'insta-au',
          label: 'Australia Account',
          icon: Icons.flag,
          routeName: 'instagram-post-analysis',
          params: {'account': 'au'},
        ),
      ],
    ),
    'time-difference': const MenuConfig(
      id: 'time-difference',
      title: 'Time Difference',
      items: [
        MenuItemConfig(
          id: 'tz-simple-list',
          label: 'Timezone Simple List',
          icon: Icons.list,
          routeName: 'tz-simple-list',
        ),
        MenuItemConfig(
          id: 'tz-table',
          label: 'Timezone Table',
          icon: Icons.table_chart,
          routeName: 'tz-table',
        ),
        MenuItemConfig(
          id: 'world-clock',
          label: 'World Clock',
          icon: Icons.public,
          routeName: 'world-clock',
        ),
      ],
    )
  };

  static MenuConfig byId(String id) => _menus[id]!;
  static List<MenuItemConfig> get homeItems => _menus['home']!.items;
}