class Contact {
  String? id;
  String? sclname;
  String? scladdress;
  String? sclworktime;
  String? sclworktimesunday;
  String? sclhotline;
  String? sclmail;
  String? sclweb;

  Contact({
    this.id,
    this.sclname,
    this.scladdress,
    this.sclworktime,
    this.sclworktimesunday,
    this.sclhotline,
    this.sclmail,
    this.sclweb,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json['_id'] ?? '',
    sclname: json['sclname'] ?? '',
    scladdress: json['scladdress'] ?? '',
    sclworktime: json['sclworktime'] ?? '',
    sclworktimesunday: json['sclworktimesunday'] ?? '',
    sclhotline: json['sclhotline'] ?? '',
    sclmail: json['sclmail'] ?? '',
    sclweb: json['sclweb'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'sclname': sclname,
    'scladdress': scladdress,
    'sclworktime': sclworktime,
    'sclworktimesunday': sclworktimesunday,
    'sclhotline': sclhotline,
    'sclmail': sclmail,
    'sclweb': sclweb,
  };
}