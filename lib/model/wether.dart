import 'dart:convert';

class WetherModel {
  final String cityname;
  final String locationtime;
  final double co;
  final double pm25;
  final double pm10;
  final double o3;
  final double no2;
  final double s02;
  final String id;

  WetherModel({
    required this.cityname,
    required this.co,
    required this.pm25,
    required this.pm10,
    required this.o3,
    required this.no2,
    required this.s02,
    required this.locationtime,
    required this.id,
  });

  factory WetherModel.fromJson(Map<String, dynamic> json) {
    return WetherModel(
      cityname: json['location']['name'],
      co: json["current"]["air_quality"]["co"],
      pm25: json['current']['air_quality']['pm2_5'],
      pm10: json['current']['air_quality']['pm10'],
      o3: json['current']['air_quality']['o3'],
      no2: json['current']['air_quality']['no2'],
      s02: json['current']['air_quality']['so2'],
      locationtime: json['location']['localtime'],
      id: ['id'].toString(),
    );
  }

  Map<String, dynamic> toJson(id) {
    return {
      // 'location': {
      //   'name': cityname,
      //   'localtime': locationtime,
      // },
      // 'current': {
      //   'air_quality': {
      //     'co': co,
      //     'pm2_5': pm25,
      //     'pm10': pm10,
      //     'o3': o3,
      //     'no2': no2,
      //     'so2': s02,
      //   },
      // },
      // 'id': id,
      'location': locationtime,
      'name': cityname,
      'co': co,
      'pm2_5': pm25,
      'pm10': pm10,
      'o3': o3,
      'no2': no2,
      'so2': s02,
      'id': id
    };
  }

  // Wether({
  //   required this.location,
  //   required this.current,
  // });
  // Location location;
  // Current current;
  // factory Wether.fromRawJson(String str) => Wether.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  // factory Wether.fromJson(Map<String, dynamic> json) => Wether(
  //       location: Location.fromJson(json["location"]),
  //       current: Current.fromJson(json["current"]),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "location": location.toJson(),
  //       "current": current.toJson(),
  //     };
}

class Current {
  int lastUpdatedEpoch;
  String lastUpdated;
  int tempC;
  double tempF;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  int pressureMb;
  double pressureIn;
  double precipMm;
  int precipIn;
  int humidity;
  int cloud;
  int feelslikeC;
  double feelslikeF;
  double windchillC;
  double windchillF;
  double heatindexC;
  double heatindexF;
  double dewpointC;
  double dewpointF;
  int visKm;
  int visMiles;
  int uv;
  double gustMph;
  double gustKph;
  Map<String, double> airQuality;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.airQuality,
  });

  factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"],
        tempF: json["temp_f"]?.toDouble(),
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"]?.toDouble(),
        precipIn: json["precip_in"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"],
        feelslikeF: json["feelslike_f"]?.toDouble(),
        windchillC: json["windchill_c"]?.toDouble(),
        windchillF: json["windchill_f"]?.toDouble(),
        heatindexC: json["heatindex_c"]?.toDouble(),
        heatindexF: json["heatindex_f"]?.toDouble(),
        dewpointC: json["dewpoint_c"]?.toDouble(),
        dewpointF: json["dewpoint_f"]?.toDouble(),
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        uv: json["uv"],
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
        airQuality: Map.from(json["air_quality"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "air_quality":
            Map.from(airQuality).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Condition {
  String text;
  String icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromRawJson(String str) =>
      Condition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
