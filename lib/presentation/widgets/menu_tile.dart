import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smiring_app/presentation/utils/grid_menu_item_config.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({super.key, required this.item});
  final MenuItemConfig item;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(16),
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () => context.pushNamed(item.routeName, pathParameters: item.params),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 今はアイコン、将来は Image に差し替え
              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: item.assetPath == null
                    ? Icon(item.icon, size: 128)
                    : Image.asset(item.assetPath!), // ← 画像に切替可能
                ),
              ),
              const SizedBox(height: 12),
              Text(item.label, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
