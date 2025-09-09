import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';
import 'package:smiring_app/presentation/widgets/location_picker.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class SmallClock extends HookConsumerWidget {
  const SmallClock(
      {super.key, required this.clockLocation, required this.index});
  final LocationInfo clockLocation;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = useMemoized(
      () => tz.getLocation(clockLocation.cityId),
      [clockLocation.cityId],
    );

    final tick = useStream<int>(
      useMemoized(() => Stream.periodic(const Duration(seconds: 1), (i) => i), const []),
      initialData: 0,
    ).data!;

    final now = tz.TZDateTime.now(location);
    final hh = now.hour.toString().padLeft(2, '0');
    final mm = now.minute.toString().padLeft(2, '0');
    final colon = (tick % 2 == 0) ? ':' : '';

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: 
        GestureDetector(
          onTap: () {
            showLocationPicker(context, index);
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
            children: [
              Text(
                "${clockLocation.emoji + clockLocation.names[3]}  $hh",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                width: 5,
                child: Center(
                  child: Text(
                    colon,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Text(
                mm,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          )
        )));
  }
}

void showLocationPicker(BuildContext context, int i) {
  List<LocationInfo> allLocation = [
    for (LocationInfo loc in WorldLocations()) loc
  ];
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: 450,
            width: 700,
            child: LocationPicker(
              displayLocations: allLocation,
              onTapType: 'app bar small clock',
              changeIndex: i,
            ),
          ),
        );
      });
}
