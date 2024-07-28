class AdwiseModel {
  String Advidename;
  String adviceimage;
  List advices;
  String? id;

  AdwiseModel({
    required this.Advidename,
    required this.adviceimage,
    required this.advices,
    this.id,
  });

  Map<String, dynamic> toJson(idd) => {
        'Advicename': Advidename,
        'AdviceImage': adviceimage,
        'Advice': advices,
        'id': idd,
      };

  factory AdwiseModel.fromjson(Map<String, dynamic> json) {
    return AdwiseModel(
      Advidename: json['Advicename'],
      adviceimage: json['AdviceImage'],
      advices: json['Advice'],
      id: json['id'],
    );
  }
}
