import 'package:contacts_app/src/models/records.dart';
import 'package:flutter/material.dart';

class ContactListItemWidget extends StatelessWidget {
  const ContactListItemWidget({super.key, required this.recordModel});

  final RecordModel recordModel;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        ListTile(
          leading: CircleAvatar(child: Image.network(recordModel.photo, scale: 1.0,),),
          title: Text(recordModel.name),
          subtitle: Text(recordModel.address),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.call),),
        )
      ],

    );
  }
}
