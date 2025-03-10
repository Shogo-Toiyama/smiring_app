import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smiring_app/application/state/timedifference_provider/timedifference_simple_list_providers.dart';
import 'package:smiring_app/presentation/utils/weekdays_list.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:smiring_app/presentation/utils/location_info.dart';

class TimezoneSimpleListCountryBar extends HookConsumerWidget {
  const TimezoneSimpleListCountryBar({
    super.key,
    required this.location,
  });

  final LocationInfo location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    tz.initializeTimeZones();
    DateTime utcTime = ref.watch(baseTimeProvider);
    final loc = tz.getLocation(location.cityId);
    DateTime now = tz.TZDateTime.from(utcTime, loc);

    final selectedValues = useState<Map<String, String>>({
      "year": now.year.toString(),
      "month": now.month.toString().padLeft(2, '0'),
      "day": now.day.toString().padLeft(2, '0'),
      "hour": now.hour.toString().padLeft(2, '0'),
      "minute": now.minute.toString().padLeft(2, '0'),
    });

    useEffect(() {
      selectedValues.value = {
        "year": now.year.toString(),
        "month": now.month.toString().padLeft(2, '0'),
        "day": now.day.toString().padLeft(2, '0'),
        "hour": now.hour.toString().padLeft(2, '0'),
        "minute": now.minute.toString().padLeft(2, '0'),
      };
      return null;
    }, [utcTime]);

    void updateTime(String key, String newValue) {
      selectedValues.value = {...selectedValues.value, key: newValue};

      DateTime updatedTime = now.copyWith(
        year: stringToInt(selectedValues.value["year"]!),
        month: stringToInt(selectedValues.value["month"]!),
        day: stringToInt(selectedValues.value["day"]!),
        hour: stringToInt(selectedValues.value["hour"]!),
        minute: stringToInt(selectedValues.value["minute"]!),
      );

      ref.read(baseTimeProvider.notifier).setBaseTime(updatedTime, loc, false);
    }

    return SizedBox(
      key: key,
      width: 1000,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(location.emoji, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 20),
                    Text(location.locationName,
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Row(
                children: [
                  buildDropdown("year", 2020, 2030,
                      selectedValues.value["year"]!, updateTime),
                  const Text(' / ', style: TextStyle(fontSize: 20)),
                  buildDropdown("month", 1, 12, selectedValues.value["month"]!,
                      updateTime),
                  const Text(' / ', style: TextStyle(fontSize: 20)),
                  buildDropdown(
                      "day", 1, 31, selectedValues.value["day"]!, updateTime),
                  SizedBox(
                    width: 50,
                    child: Text(
                      ' ${weekdaysList[now.weekday]}   ',
                      style: TextStyle(
                        fontSize: 15,
                        color: now.weekday == 6
                            ? Colors.blue
                            : now.weekday == 7
                                ? Colors.red
                                : Colors.grey,
                      ),
                    ),
                  ),
                  buildDropdown(
                      "hour", 0, 23, selectedValues.value["hour"]!, updateTime),
                  const Text(' : ', style: TextStyle(fontSize: 20)),
                  buildDropdown("minute", 0, 59,
                      selectedValues.value["minute"]!, updateTime),
                ],
              ),
              const SizedBox(width: 30),
              IconButton(
                  onPressed: () {
                    ref
                        .read(selectedLocationIndexProvider.notifier)
                        .updateSelection(location);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ))
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

int stringToInt(String strVal) => int.tryParse(strVal) ?? 0;

Widget buildDropdown(String key, int min, int max, String currentValue,
    Function(String, String) onChanged) {
  return DropdownButton<String>(
    value: currentValue,
    items: List.generate(max - min + 1, (i) {
      String value = (i + min).toString().padLeft(2, '0');
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value, style: const TextStyle(fontSize: 20)),
      );
    }),
    onChanged: (String? newValue) {
      if (newValue != null) {
        onChanged(key, newValue);
      }
    },
  );
}
