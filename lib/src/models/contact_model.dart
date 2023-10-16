class ContactModel {
  final String fname;
  final String lname;
  final String address;
  final String phone;
  final String email;
  final String? id;

  ContactModel({required this.id, required this.fname, required this.lname, required this.address, required this.phone, required this.email});

  factory ContactModel.fromJSON(Map<String, dynamic> json) {
    return ContactModel(
        fname: json['firstName'],
        lname: json['lastName'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'], id: json['_id']);
  }
  Map<String, dynamic> toJSON() {
    return {
      "id": this.id,
      "firstName": this.fname,
      "lastName": this.lname,
      "email": this.email,
      "phone": this.phone,
      "address": this.address
    };
  }
}
