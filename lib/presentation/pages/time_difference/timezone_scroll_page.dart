import 'package:flutter/material.dart';
import 'package:smiring_app/presentation/widgets/timezone_scroll_country_bar.dart';
import 'package:smiring_app/presentation/utils/world_places.dart';

class TimezoneScrollPage extends StatelessWidget {
  const TimezoneScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    WorldPlaces worldPlaces = WorldPlaces();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimezoneScrollCountryBar(place: worldPlaces.london),
            SizedBox(height: 50,),
            TimezoneScrollCountryBar(place: worldPlaces.california),
            SizedBox(height: 50,),
            TimezoneScrollCountryBar(place: worldPlaces.tokyo),
          ],
        ),
      )
    );
  }
}