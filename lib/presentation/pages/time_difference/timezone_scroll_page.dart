import 'package:flutter/material.dart';
import 'package:smiring_app/presentation/widgets/timezone_scroll_country_bar.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';

class TimezoneScrollPage extends StatelessWidget {
  const TimezoneScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    WorldLocations worldLocations = WorldLocations();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimezoneScrollCountryBar(location: worldLocations.london),
          const SizedBox(
            height: 50,
          ),
          TimezoneScrollCountryBar(location: worldLocations.kualaLumpur),
          const SizedBox(
            height: 50,
          ),
          TimezoneScrollCountryBar(location: worldLocations.california),
          const SizedBox(
            height: 50,
          ),
          TimezoneScrollCountryBar(location: worldLocations.bangkok),
          const SizedBox(
            height: 50,
          ),
          TimezoneScrollCountryBar(location: worldLocations.chicago),
          const SizedBox(
            height: 50,
          ),
          TimezoneScrollCountryBar(location: worldLocations.madrid),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    ));
  }
}
