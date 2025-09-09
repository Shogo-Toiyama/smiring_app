import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/basic_providers.dart';
import 'package:smiring_app/presentation/utils/grid_menu_item_config.dart';
import 'package:smiring_app/presentation/widgets/menu_tile.dart';

class GridMenuPage extends HookConsumerWidget {
  const GridMenuPage({super.key, required this.title, required this.items});
  final String title;
  final List<MenuItemConfig> items;

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180,
          mainAxisSpacing: 10, 
          crossAxisSpacing: 10, 
          childAspectRatio: 1
        ),
        itemCount: items.length,
        itemBuilder: (_, i) => MenuTile(item: items[i]),
      ),
    );
  }
}