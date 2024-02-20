class UserRegister {
  DateTime? lastLogin;
  String? password;
  String? address;
  String? gender;
  String? email;
  int? purpose;
  String? phone;
  DateTime? createTime;
  DateTime? dob;
  String? fullname;
  String? finding;
  int? status;
  int? distance;
  UserRegister({
    this.lastLogin,
    this.password,
    this.address,
    this.gender,
    this.email,
    this.purpose,
    this.phone,
    this.createTime,
    this.dob,
    this.fullname,
    this.finding,
    this.status,
    this.distance,
  });

  Map<String, dynamic> toMap() {
    return {
      'lastLogin': lastLogin?.toUtc().toIso8601String(),
      'password': password,
      'address': address,
      'gender': gender,
      'email': email,
      'purpose': purpose,
      'phone': phone,
      'createTime': createTime?.toUtc().toIso8601String(),
      'dob': dob?.toUtc().toIso8601String(),
      'fullname': fullname,
      'finding': finding,
      'status': status,
      'distance': distance,
    };
  }

  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      lastLogin: json['lastLogin']!= null
          ? DateTime.parse(json['createTime'])
          : null,
      password: json['password'],
      address: json['address'],
      gender: json['gender'],
      email: json['email'],
      purpose: json['purpose'],
      phone: json['phone'],
      createTime: json['createTime'] != null
          ? DateTime.parse(json['createTime'])
          : null,
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      fullname: json['fullname'],
      finding: json['finding'],
      status: json['status'],
      distance: json['distance'],
    );
  }
}
