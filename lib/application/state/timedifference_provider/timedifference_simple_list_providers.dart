import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiring_app/presentation/utils/location_info.dart';
import 'package:timezone/browser.dart';
import 'package:timezone/timezone.dart' as tz;

class BaseTimeNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now().toUtc();
  }

  void setBaseTime(DateTime newDT, Location location) {
    tz.TZDateTime localTime = tz.TZDateTime(
        location, newDT.year, newDT.month, newDT.day, newDT.hour, newDT.minute);
    state = localTime.toUtc();
  }
}

final baseTimeProvider = NotifierProvider<BaseTimeNotifier, DateTime>(() {
  return BaseTimeNotifier();
});

class SelectedIndexNotifier extends Notifier<List<LocationInfo>> {
  @override
  List<LocationInfo> build() {
    return [];
  }

  void updateSelection(LocationInfo newLocInfo) {
    state = [...state, newLocInfo];
  }
}

final selectedIndexProvider =
    NotifierProvider<SelectedIndexNotifier, List<LocationInfo>>(() {
  return SelectedIndexNotifier();
});
