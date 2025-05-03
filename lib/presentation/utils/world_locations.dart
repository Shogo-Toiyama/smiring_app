class WorldLocations extends Iterable<LocationInfo> {
  WorldLocations._();

  static final WorldLocations _instance = WorldLocations._();
  factory WorldLocations() => _instance;

  static const LocationInfo hawaii = LocationInfo(
    locationName: 'Hawaii (USA)',
    cityId: 'Pacific/Honolulu',
    emoji: '🇺🇸',
    names: ['Haw(US)', 'Hawaii', 'ハワイ', 'HW'],
    timeZone: ['HST', 'HST'],
  );

  static const LocationInfo california = LocationInfo(
    locationName: 'California (USA)',
    cityId: 'America/Los_Angeles',
    emoji: '🇺🇸',
    names: ['Cal(US)', 'California', 'カリフォルニア', 'CA'],
    timeZone: ['PST', 'PDT'],
  );

  static const LocationInfo chicago = LocationInfo(
    locationName: 'Chicago (USA)',
    cityId: 'America/Chicago',
    emoji: '🇺🇸',
    names: ['Chi(US)', 'Chicago', 'シカゴ', 'CH'],
    timeZone: ['CST', 'CDT'],
  );

  static const LocationInfo newYork = LocationInfo(
    locationName: 'New York (USA)',
    cityId: 'America/New_York',
    emoji: '🇺🇸',
    names: ['NY(US)', 'New York', 'ニューヨーク', 'NY'],
    timeZone: ['EST', 'EDT'],
  );

  static const LocationInfo toronto = LocationInfo(
    locationName: 'Toronto (Canada)',
    cityId: 'America/Toronto',
    emoji: '🇨🇦',
    names: ['Tor(CA)', 'Toronto', 'トロント', 'TR'],
    timeZone: ['EST', 'EDT'],
  );

  static const LocationInfo london = LocationInfo(
    locationName: 'London (UK)',
    cityId: 'Europe/London',
    emoji: '🇬🇧',
    names: ['UK', 'London', 'イギリス', ''],
    timeZone: ['GMT', 'BST'],
  );

  static const LocationInfo madrid = LocationInfo(
    locationName: 'Madrid (Spain)',
    cityId: 'Europe/Madrid',
    emoji: '🇪🇸',
    names: ['ES', 'Spain', 'スペイン', ''],
    timeZone: ['CET', 'CEST'],
  );

  static const LocationInfo paris = LocationInfo(
    locationName: 'Paris (France)',
    cityId: 'Europe/Paris',
    emoji: '🇫🇷',
    names: ['FR', 'France', 'フランス', ''],
    timeZone: ['CET', 'CEST'],
  );

  static const LocationInfo bangkok = LocationInfo(
    locationName: 'Bangkok (Thailand)',
    cityId: 'Asia/Bangkok',
    emoji: '🇹🇭',
    names: ['TH', 'Thailand', 'タイ', ''],
    timeZone: ['ICT', 'ICT'],
  );

  static const LocationInfo kualaLumpur = LocationInfo(
    locationName: 'Kuala Lumpur (Malaysia)',
    cityId: 'Asia/Kuala_Lumpur',
    emoji: '🇲🇾',
    names: ['MY', 'Malaysia', 'マレーシア', ''],
    timeZone: ['MYT', 'MYT'],
  );

  static const LocationInfo shanghai = LocationInfo(
    locationName: 'Shanghai (China)',
    cityId: 'Asia/Shanghai',
    emoji: '🇨🇳',
    names: ['Sha(CN)', 'Shanghai', '上海', 'SH'],
    timeZone: ['CST', 'CST'],
  );

  static const LocationInfo taipei = LocationInfo(
    locationName: 'Taipei (Taiwan)',
    cityId: 'Asia/Taipei',
    emoji: '🇹🇼',
    names: ['TW', 'Taiwan', '台湾', ''],
    timeZone: ['CST', 'CST'],
  );

  static const LocationInfo tokyo = LocationInfo(
    locationName: 'Tokyo (Japan)',
    cityId: 'Asia/Tokyo',
    emoji: '🇯🇵',
    names: ['JP', 'Japan', '日本', ''],
    timeZone: ['JST', 'JST'],
  );

  static const LocationInfo sydney = LocationInfo(
    locationName: 'Sydney (Australia)',
    cityId: 'Australia/Sydney',
    emoji: '🇦🇺',
    names: ['Syd(AU)', 'Sydney', 'シドニー', 'SY'],
    timeZone: ['AEST', 'AEDT'],
  );

  @override
  Iterator<LocationInfo> get iterator => [
        hawaii,
        california,
        chicago,
        newYork,
        toronto,
        london,
        madrid,
        paris,
        bangkok,
        kualaLumpur,
        shanghai,
        taipei,
        tokyo,
        sydney
      ].iterator;
}


class LocationInfo {
  final String locationName;
  final List<String> names;
  //DateTime dateTime;
  final String cityId;
  final String emoji;
  final List<String> timeZone;

  const LocationInfo ({
      required this.locationName,
      required this.names,
      //required this.dateTime,
      required this.cityId,
      required this.emoji,
      required this.timeZone,
  });
}
