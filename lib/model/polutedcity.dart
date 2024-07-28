class PolutedState {
  String country;
  String id;
  String Aqi;
  String image;
  List<Statemodel> statemodel;

  PolutedState({
    required this.country,
    required this.Aqi,
    required this.id,
    required this.image,
    required this.statemodel,
  });

  factory PolutedState.fromJson(Map<String, dynamic> jsone) {
    return PolutedState(
      country: jsone['Country'],
      Aqi: jsone['aqi'],
      id: jsone['id'],
      image: jsone['image'],
      statemodel: (jsone['State'] as List<dynamic>)
          .map((state) => Statemodel.fromjsone(state))
          .toList(),
    );
  }
}

class Statemodel {
  String state;
  String aqi;

  Statemodel({
    required this.state,
    required this.aqi,
  });

  factory Statemodel.fromjsone(Map<String, dynamic> jsone) {
    return Statemodel(
      state: jsone['State'],
      aqi: jsone['aqi'],
    );
  }
}
