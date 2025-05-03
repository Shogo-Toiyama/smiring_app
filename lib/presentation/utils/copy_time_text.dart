import 'package:smiring_app/presentation/utils/weekdays_list.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';
import 'package:timezone/timezone.dart' as tz;

String copyTimeText(
    List<LocationInfo> locationList, 
    DateTime utcTime,
    TimeDisplayFormat format) {
  String text = '';
  for (int i = 0; i < locationList.length; i++) {
    final loc = tz.getLocation(locationList[i].cityId);
    DateTime now = tz.TZDateTime.from(utcTime, loc);
    text += getFormattingTimeText(format, locationList[i], now);
    format.multiLines ? text += '\n' : text += ', ';
  }
  return text;
}

class TimeDisplayFormat {
  final bool multiLines;
  final bool emoji;
  final String locationName;
  final String date;
  final List<String> dateSeparator;
  final String weekday;
  final List ampm;
  final bool minute;
  final List<String> timeSeparator;

  TimeDisplayFormat(
    {this.multiLines = true,
    this.emoji = true,
    this.locationName = '',
    this.date = 'month',
    this.dateSeparator = DateSeparator.slash,
    this.weekday = 'japanese',
    this.ampm = Ampm.none,
    this.minute = true,
    this.timeSeparator = TimeSeparator.colon});
}

class Ampm {
  static const List none = [false, '', ''];
  static const List smallLetter = [false, 'am', 'pm'];
  static const List bigLetter = [false, 'AM', 'PM'];
  static const List japanese = [true, '午前', '午後'];
}

class DateSeparator {
  static const List<String> japanese = ['年', '月', '日'];
  static const List<String> slash = ['/', '/', ''];
  static const List<String> dot = ['.', '.', ''];
}

class TimeSeparator {
  static const List<String> japanese = ['時', '分'];
  static const List<String> colon = [':', ''];
  static const List<String> dot = ['.', ''];
}

String getFormattingTimeText(
    TimeDisplayFormat format, LocationInfo locationInfo, DateTime datetime) {
  String text = '';
  if (format.emoji) text += locationInfo.emoji;

  if (format.locationName == 'code') {
    text += locationInfo.names[0];
  } else if (format.locationName == 'english') {
    text += locationInfo.names[1];
  } else if (format.locationName == 'japanese') {
    text += locationInfo.names[2];
  } else if (format.locationName == 'timezone') {
    text += (datetime.isUtc ? locationInfo.timeZone[0] : locationInfo.timeZone[1]);
  } else {
    text += locationInfo.names[3];
  }
 
  text += ' ';

  if (format.date == 'year') {
    text += (datetime.year.toString() + format.dateSeparator[0]);
  }
  if (format.date == 'year' || format.date == 'month') {
    text += (datetime.month.toString() + format.dateSeparator[1]);
  }
  if (format.date == 'year' || format.date == 'month' || format.date == 'day') {
    text += (datetime.day.toString() + format.dateSeparator[2]);
  }

  if (format.weekday == 'japanese') {
    text += '(${weekdaysListJp[datetime.weekday]})';
  } else if (format.weekday == 'english') {
    text += ' (${weekdaysList[datetime.weekday]})';
  }

  text += ' ';

  if (format.ampm[0]) {
    text += (datetime.hour < 12 ? format.ampm[1] : format.ampm[2]); 
  }

  text += (datetime.hour.toString().padLeft(2, '0') + format.timeSeparator[0]);

  if (format.minute) {
    text += (datetime.minute.toString().padLeft(2, '0') + format.timeSeparator[1]);
  }

  if (!format.ampm[0]) {
    text += ' ';
    text += (datetime.hour < 12 ? format.ampm[1] : format.ampm[2]); 
  }

  return text;
}
