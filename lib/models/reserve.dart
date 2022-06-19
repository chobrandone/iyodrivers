class UserModel {
  String? rid;
  String? name;
  String? email;
  String? phoneNumber;
  String? brand;
  String? time;
  String? date;

  UserModel({this.rid,  this.name,this.email, this.phoneNumber,this.brand,this.date,this.time,});


  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': rid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'brand': brand,
      'date': date,
      'time': time,
    };
  }
}