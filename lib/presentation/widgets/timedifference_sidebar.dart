import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/timedifference_simple_list_providers.dart';
import 'package:smiring_app/presentation/utils/copy_time_text.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';
import 'package:smiring_app/presentation/utils/theme_colors.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimedifferenceSidebar extends ConsumerWidget {
  const TimedifferenceSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    tz.initializeTimeZones();
    TimeDisplayFormat format = TimeDisplayFormat();

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: ThemeColors.smiringDarkBlue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        List<LocationInfo> selectedLocation =
                            ref.read(selectedLocationIndexProvider);
                        List<LocationInfo> copy = [
                          for (int i = 0; i < selectedLocation.length; i++)
                            selectedLocation[i]
                        ];
                        List<LocationInfo> allLocation = [
                          for (LocationInfo loc in WorldLocations()) loc
                        ];
                        Map<LocationInfo, int> indexMap = {
                          for (int i = 0; i < allLocation.length; i++)
                            allLocation[i]: i
                        };
                        copy.sort(
                            (a, b) => indexMap[a]!.compareTo(indexMap[b]!));
                        ref
                            .read(selectedLocationIndexProvider.notifier)
                            .updateList(copy);
                      },
                      icon: const Icon(
                        Icons.swap_vert,
                        size: 40,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        DateTime basetime = ref.read(baseTimeProvider);
                        ref.read(baseTimeProvider.notifier).setBaseTime(
                            basetime.copyWith(minute: 0), tz.UTC, false);
                      },
                      icon: const Icon(
                        Icons.settings_backup_restore,
                        size: 40,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        ref
                            .read(baseTimeProvider.notifier)
                            .setBaseTime(DateTime.now(), tz.local, true);
                      },
                      icon: const Icon(
                        Icons.restore,
                        size: 40,
                        color: Colors.white,
                      ))
                ],
              ),
              IconButton(
                  onPressed: () {
                    List<LocationInfo> selectedLocation =
                        ref.read(selectedLocationIndexProvider);
                    DateTime utcTime = ref.read(baseTimeProvider);
                    String textCopy =
                        copyTimeText(selectedLocation, utcTime, format);
                    Clipboard.setData(ClipboardData(text: textCopy));
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 40,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 500,
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
        ],
      ),
    ));
  }
}
