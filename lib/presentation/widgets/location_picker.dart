import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/basic_providers.dart';
import 'package:smiring_app/application/state/timedifference_provider/timedifference_simple_list_providers.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocationPicker extends HookConsumerWidget {
  const LocationPicker(
      {super.key,
      required this.displayLocations,
      required this.onTapType,
      this.changeIndex = 0});

  final List<LocationInfo> displayLocations;
  final String onTapType;
  final int changeIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                for (LocationInfo loc in displayLocations)
                  LocationMenuTile(
                    locationInfo: loc,
                    onTapType: onTapType,
                    changeIndex: changeIndex,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocationMenuTile extends ConsumerWidget {
  const LocationMenuTile(
      {super.key,
      required this.locationInfo,
      required this.onTapType,
      required this.changeIndex});

  final String onTapType;
  final LocationInfo locationInfo;
  final int changeIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    tz.initializeTimeZones();
    final location = tz.getLocation(locationInfo.cityId);
    final localTime = tz.TZDateTime.from(ref.read(baseTimeProvider), location);

    final int offset = localTime.timeZoneOffset.inHours;
    final String offsetString = offset > 0
        ? '+$offset'
        : offset == 0
            ? '±0'
            : '$offset';

    final bool isDst = localTime.timeZoneOffset !=
        tz.TZDateTime(location, localTime.year, 1, 1).timeZoneOffset;

    return ListTile(
      onTap: () {
        if (onTapType == 'simple list') {
          ref
              .read(selectedLocationIndexProvider.notifier)
              .updateSelection(locationInfo);
        } else if (onTapType == 'app bar small clock') {
          ref
              .read(appBarSmallClockProvider.notifier)
              .updateSelection(changeIndex, locationInfo);
        }

        Navigator.of(context).pop();
      },
      title: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                '${locationInfo.emoji}  ${locationInfo.locationName}',
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 10),
              Text(
                (isDst ? locationInfo.timeZone[1] : locationInfo.timeZone[0]) +
                    (' ($offsetString)'),
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              )
            ],
          )),
    );
  }
}
