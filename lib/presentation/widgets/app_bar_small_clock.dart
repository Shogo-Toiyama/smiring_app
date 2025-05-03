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
    final timer = useRef<Timer?>(null);
    tz.initializeTimeZones();
    final loc = useRef<Location>(tz.getLocation(clockLocation.cityId));
    DateTime now = tz.TZDateTime.now(loc.value);
    final hour = useState<int>(now.hour);
    final min = useState<int>(now.minute);
    final colon = useState<String>(':');
    bool isColon = true;

    useEffect(() {
      loc.value = tz.getLocation(clockLocation.cityId);
      timer.value = Timer.periodic(const Duration(seconds: 1), (t) {
        log(clockLocation.cityId);
        now = tz.TZDateTime.now(loc.value);
        if (hour.value != now.hour) {
          hour.value = now.hour;
        }
        if (min.value != now.minute) {
          min.value = now.minute;
        }
        colon.value = isColon ? ':' : '';
        isColon = !isColon;
      });
      return () {
        timer.value?.cancel();
      };
    }, [clockLocation]);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            showLocationPicker(context, index);
          },
          child: Row(
            children: [
              Text(
                "${clockLocation.emoji + clockLocation.names[3]}  ${hour.value.toString().padLeft(2, '0')}",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                width: 5,
                child: Center(
                  child: Text(
                    colon.value,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Text(
                min.value.toString().padLeft(2, '0'),
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ));
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
