import 'package:flutter/widgets.dart';
import 'package:smiring_app/presentation/utils/place_info.dart';

class TimezoneScrollCountryBar extends StatelessWidget {
  const TimezoneScrollCountryBar({
    super.key,
    required this.place,
  });

  final PlaceInfo place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          place.placeName,
          style: TextStyle(fontSize: 40),
        ),
        SizedBox(width: 20,),
        Text(
          '${place.dateTime.hour}:${place.dateTime.minute}',
          style: TextStyle(fontSize: 40),
        )
      ],
    );
  }
}