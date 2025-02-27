import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:smiring_app/presentation/utils/location_info.dart';

class TimezoneScrollCountryBar extends HookWidget {
  const TimezoneScrollCountryBar({
    super.key,
    required this.location,
  });

  final LocationInfo location;

  @override
  Widget build(BuildContext context) {


    tz.initializeTimeZones();
    var loc = tz.getLocation(location.cityId);
    var now = tz.TZDateTime.now(loc);
    final selectedHour = useState(now.hour.toString().padLeft(2, '0'));
    final selectedMinute = useState(now.minute.toString().padLeft(2, '0'));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          location.emoji,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(width: 20,),
        Text(
          location.locationName,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          width: 20,
        ),
        DropdownButton(
          value: selectedHour.value,
          items: List.generate(24, (i) {
            String value = i.toString().padLeft(2, '0');
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
                ),
            );
          }), 
          onChanged: (String? newValue) {
            if (newValue != null) {
              selectedHour.value = newValue;
            }
        }),
        const Text(
          ' : ', style: TextStyle(fontSize: 20),
        ),
        DropdownButton(
          value: selectedMinute.value,
          items: List.generate(60, (i) {
            String value = i.toString().padLeft(2, '0');
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 20),
                ),
            );
        }), 
        onChanged: (String? newValue) {
          if (newValue != null) {
            selectedMinute.value = newValue;
          }
        })
      ],
    );
  }
}
