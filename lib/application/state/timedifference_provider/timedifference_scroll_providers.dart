import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/browser.dart';
import 'package:timezone/timezone.dart' as tz;

class BaseTimeNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now().toUtc();
  }

  void setBaseTime(DateTime newState, Location location){
    log('Inside setBaseTime');
    log('Original: $state');
    tz.TZDateTime localTime = tz.TZDateTime(location, newState.year, newState.month, newState.day, newState.hour, newState.minute);
    state = localTime.toUtc();
    log('Updated: $state');
  }
}

final baseTimeProvider = NotifierProvider<BaseTimeNotifier, DateTime>((){
  return BaseTimeNotifier();
});