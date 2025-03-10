import 'package:smiring_app/presentation/utils/location_info.dart';

class WorldLocations extends Iterable<LocationInfo>{
  WorldLocations._();

  static final WorldLocations _instance = WorldLocations._();
  factory WorldLocations() => _instance;

  static const LocationInfo bangkok = LocationInfo(
      locationName: 'Bangkok (Thailand)',
      cityId: 'Asia/Bangkok',
      // dateTime: DateTime.now(),
      emoji: '🇹🇭',
    );
  static const LocationInfo california = LocationInfo(
      locationName: 'California (USA)',
      cityId: 'America/Los_Angeles',
      // dateTime: DateTime.now(),
      emoji: '🇺🇸'
    );
  static const LocationInfo chicago = LocationInfo(
      locationName: 'Chicago (USA)',
      cityId: 'America/Chicago',
      // dateTime: DateTime.now(),
      emoji: '🇺🇸'
    );
  static const LocationInfo hawaii = LocationInfo(
      locationName: 'Hawaii (USA)',
      cityId: 'Pacific/Honolulu',
      // dateTime: DateTime.now(),
      emoji: '🇺🇸'
    );
  static const LocationInfo kualaLumpur = LocationInfo(
      locationName: 'Kuala Lumpur (Malaysia)',
      cityId: 'Asia/Kuala_Lumpur',
      // dateTime: DateTime.now(),
      emoji: '🇲🇾',
    );
  static const LocationInfo london = LocationInfo(
      locationName: 'London (UK)',
      cityId: 'Europe/London',
      // dateTime: DateTime.now(),
      emoji: '🇬🇧'
    );
  static const LocationInfo madrid = LocationInfo(
      locationName: 'Madrid (Spain)',
      cityId: 'Europe/Madrid',
      // dateTime: DateTime.now(),
      emoji: '🇪🇸',
    );
  static const LocationInfo newYork = LocationInfo(
      locationName: 'New York (USA)',
      cityId: 'America/New_York',
      // dateTime: DateTime.now(),
      emoji: '🇺🇸'
    );
  static const LocationInfo paris = LocationInfo(
      locationName: 'Paris (France)',
      cityId: 'Europe/Paris',
      // dateTime: DateTime.now(),
      emoji: '🇫🇷'
    );
  static const LocationInfo shanghai = LocationInfo(
      locationName: 'Shanghai (China)',
      cityId: 'Asia/Shanghai',
      // dateTime: DateTime.now(),
      emoji: '🇨🇳',
    );
  static const LocationInfo sydney = LocationInfo(
      locationName: 'Sydney (Australia)',
      cityId: 'Australia/Sydney',
      // dateTime: DateTime.now(),
      emoji: '🇦🇺',
    );
  static const LocationInfo taipei = LocationInfo(
      locationName: 'Taipei (Taiwan)',
      cityId: 'Asia/Taipei',
      // dateTime: DateTime.now(),
      emoji: '🇹🇼',
    );
  static const LocationInfo tokyo = LocationInfo(
      locationName: 'Tokyo (Japan)',
      cityId: 'Asia/Tokyo',
      // dateTime: DateTime.now(),
      emoji: '🇯🇵'
    );
  static const LocationInfo toronto = LocationInfo(
      locationName: 'Toronto (USA)',
      cityId: 'America/Toronto',
      // dateTime: DateTime.now(),
      emoji: '🇺🇸'
    );

    @override
  Iterator<LocationInfo> get iterator => [
        bangkok,
        california,
        chicago,
        hawaii,
        kualaLumpur,
        london,
        madrid,
        newYork,
        paris,
        shanghai,
        sydney,
        taipei,
        tokyo,
        toronto
      ].iterator;
}
