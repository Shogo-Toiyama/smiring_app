import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/timedifference_simple_list_providers.dart';
import 'package:smiring_app/presentation/utils/location_info.dart';
import 'package:smiring_app/presentation/widgets/basic_app_bar.dart';
import 'package:smiring_app/presentation/widgets/location_picker.dart';
import 'package:smiring_app/presentation/widgets/timedifference_sidebar.dart';
import 'package:smiring_app/presentation/widgets/timezone_simple_list_country_bar.dart';

class TimezoneSimpleListPage extends HookConsumerWidget {
  const TimezoneSimpleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LocationInfo> currentLocations =
        ref.watch(selectedLocationIndexProvider);

    return Scaffold(
        appBar: const BasicaApBar(title: "Time Difference - Simple List"),
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    child: ReorderableListView(
                      onReorder: (oldIndex, newIndex) {
                        if (newIndex > oldIndex) newIndex--;
                        final updatedList =
                            List<LocationInfo>.from(currentLocations);
                        final movingBar = updatedList.removeAt(oldIndex);
                        updatedList.insert(newIndex, movingBar);
                        ref
                            .read(selectedLocationIndexProvider.notifier)
                            .updateList(updatedList);
                      },
                      children: [
                        for (int i = 0; i < currentLocations.length; i++)
                          TimezoneSimpleListCountryBar(
                              key: ValueKey(currentLocations[i].locationName),
                              location: currentLocations[i])
                      ],
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
                  showLocationPicker(context, 1);
                },
                child: const Icon(Icons.add),
              ),
            )
          ],
        ));
  }
}

void showLocationPicker(BuildContext context, int? changeIndex) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 450,
            width: 700,
            child: LocationPicker(changeIndex: changeIndex),
          ),
        );
      });
}
