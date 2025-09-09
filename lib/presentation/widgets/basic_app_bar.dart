import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/basic_providers.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';
import 'package:smiring_app/presentation/utils/theme_colors.dart';
import 'package:smiring_app/presentation/widgets/app_bar_small_clock.dart';

class BasicAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    required this.title,
    this.height = kToolbarHeight,
    this.color = ThemeColors.smiringSkyBlue,
    this.backButton = true,
  });

  final String title;
  final double height;
  final Color color;
  final bool backButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LocationInfo> clockLocations = ref.watch(appBarSmallClockProvider);

    return Stack(
      children: [
        AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white)),
          actions: [
            SizedBox(
              width: 350,
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    SmallClock(clockLocation: clockLocations[i], index: i),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ],
          backgroundColor: color,
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (backButton)
                IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        Positioned(
            left: 70,
            child: Image.asset(
              'assets/images/SmiRing_logo.png',
              width: 60,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}