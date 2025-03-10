import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/timedifference_simple_list_providers.dart';
import 'package:smiring_app/presentation/utils/location_info.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';

class LocationPicker extends HookConsumerWidget {
  const LocationPicker({super.key, this.changeIndex});

  final int? changeIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LocationInfo> allLocation = [
      for (LocationInfo loc in WorldLocations()) loc
    ];
    List<LocationInfo> currentLocations =
        ref.read(selectedLocationIndexProvider);
    List<LocationInfo> remainingLocation =
        allLocation.toSet().difference(currentLocations.toSet()).toList();

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(children: [
            const Expanded(
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 10, left: 50),
                child: Text(
                  'Select location',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ),
          ]),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                for (LocationInfo loc in remainingLocation)
                  LocationMenuTile(locationInfo: loc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocationMenuTile extends ConsumerWidget {
  const LocationMenuTile({super.key, required this.locationInfo});

  final LocationInfo locationInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        ref
            .read(selectedLocationIndexProvider.notifier)
            .updateSelection(locationInfo);
        Navigator.of(context).pop();
      },
      title: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          '${locationInfo.emoji}  ${locationInfo.locationName}',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
