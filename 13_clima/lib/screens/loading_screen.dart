import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';

const apiKey = '57dcb0312fe1966e9a2714a55edd9464';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? long;

  @override
  void initState() {
    super.initState();
    // getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    lat = location.lat;
    long = location.long;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');

    var weatherData = await networkHelper.getDate();
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();

    return const Scaffold();
  }
}
