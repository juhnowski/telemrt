import 'package:flutter/material.dart';
import 'package:telemrt/models/mrt.dart';

class MrtTile extends StatelessWidget {

  final Mrt mrt;
  MrtTile({this.mrt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar (
            radius: 25.0,
            backgroundColor: Colors.blueGrey,
            backgroundImage: AssetImage('assets/telemrt.png'),
          ),
          title: Text(mrt.name),
          subtitle: Column(
            children: <Widget>[
              Text('Имя: ${mrt.name}'),
              Text('Предзаказ: ${mrt.preorder} тыс. руб.'),
              Text('Уведомления по:${mrt.contacts}'),
              Text('Контактные данные: ${mrt.contact_details}'),
            ],
          ),
        ),
      ),
    );
  }
}
