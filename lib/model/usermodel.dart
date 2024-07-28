class Usermodel {
  String name;
  String email;
  String? id;
  String phone;
  String uid;

  Usermodel(
      {required this.name,
      required this.email,
      this.id,
      required this.phone,
      required this.uid});

  Map<String, dynamic> toJsone(idd) => {
        'name': name,
        'email': email,
        'id': idd,
        'phone': phone,
        'uid': uid,
      };

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      phone: json['phone'],
      uid: json['uid']
    );
  }
}


//  "name": nameController.text,
//               "email": emailController.text,
//               "password" : passwordController.text,
//               "phone":phoneController.text,
//               "id": uid,