import 'package:geolocator/geolocator.dart';

class Location {
  late double? lat;
  late double? long;

  Location({this.lat, this.long});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      long = position.latitude;
    } catch (e) {
      print(e);
      lat = 32.632695;
      long = 51.365463;
    }
  }
}
