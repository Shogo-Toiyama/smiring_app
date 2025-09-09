import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';
import 'package:timezone/browser.dart';
import 'package:timezone/timezone.dart' as tz;

class BaseTimeNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now().toUtc();
  }

  void setBaseTime(DateTime newDT, Location location, bool reset) {
    if (reset) {
      state = DateTime.now().toUtc();
    } else {
    tz.TZDateTime localTime = tz.TZDateTime(
        location, newDT.year, newDT.month, newDT.day, newDT.hour, newDT.minute);
    state = localTime.toUtc();
    }
  }
}

final baseTimeProvider = NotifierProvider<BaseTimeNotifier, DateTime>(() {
  return BaseTimeNotifier();
});

class SelectedLocationIndexNotifier extends Notifier<List<LocationInfo>> {
  @override
  List<LocationInfo> build() {
    return [WorldLocations.tokyo];
  }

  void updateSelection(LocationInfo newLocInfo) {
    for (int i = 0; i < state.length; i++) {
      if (state[i].locationName == newLocInfo.locationName) {
        List<LocationInfo> newState = List.from(state);
        newState.removeAt(i);
        state = newState;
        return;
      }
    }
    state = [...state, newLocInfo];
    log('selection updated');
  }

  void updateList(List<LocationInfo> newList) {
    state = newList;
  }
}

final selectedLocationIndexProvider =
    NotifierProvider<SelectedLocationIndexNotifier, List<LocationInfo>>(() {
  return SelectedLocationIndexNotifier();
});
