// import 'dart:convert';
// import 'dart:developer';

// import 'package:respiro_projectfltr/apiresponse/response_weather.dart';
// import 'package:respiro_projectfltr/model/wether.dart';

// class WeatherRepositry {
//   final WetherDataProvider wetherDataProvider;

//   WeatherRepositry({required this.wetherDataProvider});

//   Future<WetherModel> getcurentwether(lat, lon) async {
//     try {
//       final wetherdata = await wetherDataProvider.getcurentweather(lat, lon);
//       final data = jsonDecode(wetherdata);

//       log('res log   ${data.toString()}');

//       if (data.statusCode != 200) {
//         return throw 'issue';
//       }

//       return WetherModel.fromJson(data);
//     } catch (e) {
//       throw e.toString();
//     }
//   }
// }
