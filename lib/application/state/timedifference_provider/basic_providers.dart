import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smiring_app/presentation/utils/world_locations.dart';

// -----------------------------------------------------------------------------
// class ExampleNotifier extends Notifier<Type> {
//   @override
//   Type build() {
//     return initValue;
//   }

//   void function() {

//   }
// }

// final exampleProvider = NotifierProvider<ExampleNotifier, Type>(() {
//   return ExampleNotifier();
// });
// -----------------------------------------------------------------------------

class AppBarSmallClockNotifier extends Notifier<List<LocationInfo>> {
  @override
  List<LocationInfo> build() {
    return [
      WorldLocations.tokyo,
      WorldLocations.california,
      WorldLocations.paris,
    ];
  }

  void updateSelection(int changeIndex, LocationInfo locationInfo) {
    List<LocationInfo> updatedList = [state[0], state[1], state[2]];
    updatedList[changeIndex] = locationInfo;
    state = updatedList;
  }
}

final appBarSmallClockProvider =
    NotifierProvider<AppBarSmallClockNotifier, List<LocationInfo>>(() {
  return AppBarSmallClockNotifier();
});
