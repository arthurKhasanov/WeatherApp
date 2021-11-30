import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocations() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low)
          .timeout(const Duration(seconds: 15));

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (error) {
      throw 'Location goes wrong: $error';
    }
  }
}
