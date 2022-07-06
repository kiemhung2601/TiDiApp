class Student {
  int? studentId;
  String? studentName;
  String? studentClass;
  String? studentMajor;
  String? schoolYear;
  String? address;
  String? mail;
  String? phone;
  String? gender;
  String? dateBorn;
  String? urlImage;

  Student(
      {this.studentId,
      this.studentName,
      this.studentClass,
      this.studentMajor,
      this.schoolYear,
      this.address,
      this.mail,
      this.phone,
      this.gender,
      this.dateBorn,
      this.urlImage});

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        studentId: json['studentId'],
        studentName: json['studentName'],
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
        'studentName': studentName,
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
