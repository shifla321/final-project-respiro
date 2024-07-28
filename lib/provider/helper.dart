import 'dart:async';
 
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperProvider with ChangeNotifier {
  final searchcontroller = TextEditingController();

  // double? lat;
  // double? lon;

  // Future latlog() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);

  //   // setState(() {
  //   lat = position.latitude;
  //   lon = position.longitude;
  //   // });

  //   notifyListeners();

  //   // log('user lat cehck click ${position.latitude} log ${position.longitude}  ===========================');
  // }

  clearcontroller() {
    searchcontroller.clear();
    notifyListeners();
  }

  bool isclick = false;

  click() {
    isclick = true;

    notifyListeners();
  }

  double? searchlatti;
  double? searchlont;

  Future getconvertlatlon(String text) async {
    List<Location> locations = await locationFromAddress(text);

    // log('helper lat lon   ${locations.first.latitude} ,  ${locations.first.longitude}=======================');

    searchlatti = locations.first.latitude;
    searchlont = locations.first.longitude;

    notifyListeners();
  }

  moovecameratolatlon(mapcontroller) {
    if (searchlatti != null && searchlont != null) {
      mapcontroller.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(searchlatti!, searchlatti!
              // double.parse(searchlatti.toString()),
              // double.parse(
              //   searchlont.toString(),
              // ),
              ),
        ),
      );
    }

    // notifyListeners();
  }
// int prdctprice(int companyPrice) {
//     double weight;
//     try {
//       weight = double.parse(prodcutweight.text);
//     } catch (e) {
//       print("Invalid weight input");
//       return 0;
//     }

//     int sum = (companyPrice * weight).toInt();

//     notifyListeners();

//     return sum;
//   }

  ///

  int? aqi;
  aqicalculate(
      String pmn2, String pm10, String o3, String co, String no2, String so2) {
    final double pmn2Value = double.parse(pmn2);
    final double pm10Value = double.parse(pm10);
    final double o3Value = double.parse(o3);
    final double coValue = double.parse(co);
    final double no2Value = double.parse(no2);
    final double so2Value = double.parse(so2);

    // Calculate individual AQI values
    final int pmn2AQI = calculateAQI(pmn2Value, pm25Breakpoints, pm25AqiValues);
    final int pm10AQI = calculateAQI(pm10Value, pm10Breakpoints, pm10AqiValues);
    final int o3AQI = calculateAQI(o3Value, o3Breakpoints, o3AqiValues);
    final int coAQI = calculateAQI(coValue, coBreakpoints, coAqiValues);
    final int no2AQI = calculateAQI(no2Value, no2Breakpoints, no2AqiValues);
    final int so2AQI = calculateAQI(so2Value, so2Breakpoints, so2AqiValues);

    final int overallAQI =
        max(pmn2AQI, max(pm10AQI, max(o3AQI, max(coAQI, max(no2AQI, so2AQI)))));

    aqi = overallAQI;
    notifyListeners();

    print(
        'aqi   $overallAQI=======================================================');
    return overallAQI;
  }

  int calculateAQI(
      double concentration, List<double> breakpoints, List<int> aqiValues) {
    for (int i = 0; i < breakpoints.length - 1; i++) {
      if (concentration >= breakpoints[i] &&
          concentration < breakpoints[i + 1]) {
        return ((aqiValues[i + 1] - aqiValues[i]) /
                    (breakpoints[i + 1] - breakpoints[i]) *
                    (concentration - breakpoints[i]) +
                aqiValues[i])
            .round();
      }
    }
    return -1; // or some error code
  }

  final List<double> pm25Breakpoints = [
    0.0,
    12.1,
    35.5,
    55.5,
    150.5,
    250.5,
    500.0
  ];
  final List<int> pm25AqiValues = [0, 51, 101, 151, 201, 301, 500];

  final List<double> pm10Breakpoints = [
    0.0,
    54.0,
    154.0,
    254.0,
    354.0,
    424.0,
    604.0
  ];
  final List<int> pm10AqiValues = [0, 51, 101, 151, 201, 301, 500];

  final List<double> o3Breakpoints = [
    0.0,
    0.055,
    0.071,
    0.086,
    0.105,
    0.200,
    0.604
  ];
  final List<int> o3AqiValues = [0, 51, 101, 151, 201, 301, 500];

  final List<double> coBreakpoints = [0.0, 4.5, 9.5, 12.5, 15.5, 30.5, 50.4];
  final List<int> coAqiValues = [0, 51, 101, 151, 201, 301, 500];

  final List<double> no2Breakpoints = [
    0.0,
    53.0,
    100.0,
    360.0,
    649.0,
    1249.0,
    2049.0
  ];
  final List<int> no2AqiValues = [0, 51, 101, 151, 201, 301, 500];

  final List<double> so2Breakpoints = [
    0.0,
    35.0,
    75.0,
    185.0,
    304.0,
    604.0,
    1004.0
  ];
  final List<int> so2AqiValues = [0, 51, 101, 151, 201, 301, 500];

////////////////////////////////////////
  double? lat;
  double? lon;

  Future latlog() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // setState(() {
    lat = position.latitude;
    lon = position.longitude;
    // });

    // log('user lat cehck click ${position.latitude} log ${position.longitude}  ===========================');
    notifyListeners();
  }

  Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Location services are disabled. Please enable the services',
      )));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
}
