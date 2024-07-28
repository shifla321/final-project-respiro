class DiseasesModel {
  String Name;
  String Image;
  String Note;
  String Effect;
  String overcome;
  String? id;
  String element;

  DiseasesModel({
    required this.Name,
    required this.Image,
    required this.Note,
    required this.Effect,
    required this.overcome,
    this.id,
    required this.element,
  });

  Map<String, dynamic> toJsone(idd) => {
        'Name': Name,
        'Image': Image,
        'Note': Note,
        'Effect': Effect,
        'Overcome': overcome,
        'id': idd,
        'element': element,
      };

  factory DiseasesModel.fromJson(Map<String, dynamic> json) {
    return DiseasesModel(
      Name: json['Name'],
      Image: json['Image'],
      Note: json['Note'],
      Effect: json['Effect'],
      overcome: json['Overcome'],
      id: json['id'],
      element: json['element'],
    );
  }
}
