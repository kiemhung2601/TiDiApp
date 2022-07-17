class Person {
  String? id;
  int? mssv;
  String? myClass;
  String? job;
  String? course;
  bool? gender;
  String? birthday;
  String? username;
  String? fullname;
  String? address;
  String? mail;
  String? phone;
  int? role;
  double? swScore;
  int? isLock;
  String? avtImage;
  String? position;

  Person({
    this.id,
    this.mssv,
    this.myClass,
    this.job,
    this.course,
    this.gender,
    this.birthday,
    this.username,
    this.fullname,
    this.address,
    this.mail,
    this.phone,
    this.role,
    this.swScore,
    this.isLock,
    this.avtImage,
    this.position,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json['_id'] ?? '',
        mssv: json['mssv'] ?? -1,
        myClass: json['myClass'] ?? '',
        job: json['job'] ?? '',
        course: json['course'] ?? '',
        gender: json['gender'] ?? true,
        birthday: json['birthday'] ?? '',
        username: json['username'] ?? '',
        fullname: json['fullname'] ?? '',
        address: json['address'] ?? '',
        mail: json['mail'] ?? '',
        phone: json['phone'] ?? '',
        role: json['role'] ?? 2,
        swScore: json['swScore'].toDouble(),
        isLock: json['isLock'] ?? 0,
        avtImage: json['avtImage'] ?? '',
        position: json['position'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'mssv': mssv,
        'myClass': myClass,
        'job': job,
        'course': course,
        'gender': gender,
        'birthday': birthday,
        'username': username,
        'fullname': fullname,
        'address': address,
        'mail': mail,
        'phone': phone,
        'role': role,
        'swScore': swScore,
        'isLock': isLock,
        'avtImage': avtImage,
        'position': position,
      };
}

// class PersonRespone {
//   String msg;
//   int status;
//   Person? data;
//
//   PersonRespone({
//     this.msg = '',
//     this.status = -100,
//     this.data,
//   });
//
//   factory PersonRespone.fromJson(Map<String, dynamic> json) {
//     Person? data;
//     if(json['data'] != null ){
//       data = Person.fromJson(json['data']);
//     }
//     return PersonRespone(
//       msg: json['msg'] ?? '',
//       status:  json['status'] ?? - 100,
//       data: data,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'msg': msg,
//     'status': status,
//     'data': data,
//   };
// }
