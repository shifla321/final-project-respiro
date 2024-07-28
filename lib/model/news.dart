class NewsModel {
  String News;
  String? id;
  String image;
  String link;

  NewsModel({
    required this.News,
    this.id,
    required this.image,
    required this.link,
  });

  Map<String, dynamic> tojsone(idd) => {
        'news': News,
        'Id': idd,
        'image': image,
        'link': link,
      };
  factory NewsModel.fromjsone(Map<String, dynamic> jsone) {
    return NewsModel(
      News: jsone['news'],
      id: jsone['id'],
      image: jsone['image'],
      link: jsone['link'],
    );
  }
}
