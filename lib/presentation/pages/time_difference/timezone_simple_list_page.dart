import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/timedifference_simple_list_providers.dart';
import 'package:smiring_app/presentation/utils/location_info.dart';
import 'package:smiring_app/presentation/widgets/timedifference_sidebar.dart';
import 'package:smiring_app/presentation/widgets/timezone_simple_list_country_bar.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';

class TimezoneSimpleListPage extends HookConsumerWidget {
  const TimezoneSimpleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WorldLocations worldLocations = WorldLocations();
    List<LocationInfo> currentLocations = ref.watch(selectedIndexProvider);

    return Scaffold(
        body: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < currentLocations.length; i++)
                        TimezoneSimpleListCountryBar(
                            location: currentLocations[i])
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 300,
              child: TimedifferenceSidebar(),
            ),
          ],
        ),
        Positioned(
          right: 350,
          bottom: 50,
          child: FloatingActionButton(
            onPressed: () {
              ref
                  .read(selectedIndexProvider.notifier)
                  .updateSelection(worldLocations.bangkok);
              log(ref.read(selectedIndexProvider).toString());
            },
            child: const Icon(Icons.add),
          ),
        )
      ],
    ));
  }
}
