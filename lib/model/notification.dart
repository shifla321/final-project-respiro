 
class NotificationModel {
  String? id;
  String msg;
  String toid;

  NotificationModel({
      this.id,
    required this.msg,
    required this.toid,
  });

  Map<String, dynamic> toJsone(idd) => {
        'id': idd,
        'toid': toid,
        'msg': msg,
      };

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      msg: json['msg'],
      toid: json['toid'],
    );
  }
}
