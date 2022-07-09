class Person {
  int? studentId;
  String? name;
  String? studentClass;
  String? studentMajor;
  String? schoolYear;
  String? address;
  String? mail;
  String? phone;
  String? gender;
  String? dateBorn;
  String? urlImage;

  Person(
      {this.studentId,
      this.name,
      this.studentClass,
      this.studentMajor,
      this.schoolYear,
      this.address,
      this.mail,
      this.phone,
      this.gender,
      this.dateBorn,
      this.urlImage});

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        studentId: json['studentId'],
        name: json['name'],
        studentClass: json['studentClass'],
        studentMajor: json['studentMajor'],
        schoolYear: json['schoolYear'],
        address: json['address'],
        mail: json['mail'],
        phone: json['phone'],
        gender: json['gender'],
        dateBorn: json['dateBorn'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'studentId': studentId,
        'name': name,
        'studentClass': studentClass,
        'studentMajor': studentMajor,
        'schoolYear': schoolYear,
        'address': address,
        'mail': mail,
        'phone': phone,
        'gender': gender,
        'dateBorn': dateBorn,
        'urlImage': urlImage,
      };
}
