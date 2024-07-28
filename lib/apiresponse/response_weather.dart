import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:respiro_projectfltr/model/wether.dart';

class WetherDataProvider with ChangeNotifier {
  WetherModel? modelObj;
  // weather? wether;
  // Location? location;
  final key = "0da9f698b4e248edb9a44252242705";

  Future<String> getcurentweather(lat, lon) async {
    try {
      final url = Uri.parse(
          "http://api.weatherapi.com/v1/current.json?key=$key&q=$lat,$lon&aqi=yes");
      final response = await http.get(url);
// if(response.s)
      // log(response.body.toString());
      if (response.statusCode == 200) {
        final body = await jsonDecode(response.body);
        log(body.toString());
        modelObj = WetherModel.fromJson(body as Map<String, dynamic>);

        // log(" ${modelObj!.cityname.toString()}");
        // log("co skd ${modelObj!.co.toString()}");
      }

      return response.body;
    } catch (e) {
      throw e.toString();
    }

    //   final url = Uri.parse(
    //       "http://api.weatherapi.com/v1/current.json?key=$key&q=$lat,$lon&aqi=yes");
    //   final response = await http.get(url);

    //   if (response.statusCode == 200) {
    //     final body = response.body;

    //     location = Location.fromRawJson(body);
    //     log('Parsed location data: ${location.toString()}');
    //     return location!;
    //   } else {
    //     log("Erro");
    //     throw Exception('failed');
    //   }
  }
}
// "http://api.weatherapi.com/v1/current.json?key=0da9f698b4e248edb9a44252242705&q=America&aqi=yes"