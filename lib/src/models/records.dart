class RecordModel {
  final String name, address, contacts, photo, url;

  const RecordModel(
      {required this.name,
      required this.address,
      required this.contacts,
      required this.photo,
      required this.url});

  factory RecordModel.fromJSON(Map<String, dynamic> json) {
    return RecordModel(
        name: json['name'],
        address: json['address'],
        contacts: json['contact'],
        photo: json['photo'],
        url: json['url']);
  }
}
