import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:smiring_app/presentation/utils/location_info.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class BasicaApBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicaApBar(
      {super.key,
      required this.title,
      this.height = kToolbarHeight,
      this.color = Colors.blue,
      this.clockLocations = const [WorldLocations.tokyo]});

  final String title;
  final double height;
  final Color color;
  final List<LocationInfo> clockLocations;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white)),
          actions: [
            SmallClock(clockLocation: clockLocations[0]),
            const SizedBox(
              width: 40,
            )
          ],
          backgroundColor: color,
        ),
        Positioned(
            left: 100,
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

class SmallClock extends HookWidget {
  const SmallClock({super.key, required this.clockLocation});
  final LocationInfo clockLocation;
  @override
  Widget build(BuildContext context) {
    final timer = useRef<Timer?>(null);
    tz.initializeTimeZones();
    final loc = tz.getLocation(clockLocation.cityId);
    DateTime now = tz.TZDateTime.now(loc);
    final hour = useState<int>(now.hour);
    final min = useState<int>(now.minute);

    useEffect(() {
      timer.value = Timer.periodic(const Duration(seconds: 3), (t) {
        now = tz.TZDateTime.now(loc);
        if (hour.value != now.hour) {
          hour.value = now.hour;
        }
        if (min.value != now.minute) {
          min.value = now.minute;
        }
      });
      return () {
        timer.value?.cancel();
      };
    }, []);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "${clockLocation.emoji}  ${hour.value.toString().padLeft(2, '0')}:${min.value.toString().padLeft(2, '0')}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
