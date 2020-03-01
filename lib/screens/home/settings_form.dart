import 'package:telemrt/models/user.dart';
import 'package:telemrt/services/database.dart';
import 'package:telemrt/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:telemrt/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> contactsList = ['email','сотовый','городской','sms','личная встреча'];

  String _name;
  String _contacts = 'email';
  int _deviceid = 100;
  String _contact_details;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {

          if(snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: textInputDecoration.copyWith(labelText: 'Имя *'),
                    initialValue: userData.name,
                    validator: (val) => val.isEmpty ? 'Введите имя' : null,
                    onChanged: (val) => setState(() => _name = val),
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(labelText: 'Контактные данные (email, тел.)'),
                    initialValue: userData.contact_details,
                    validator: (val) => val.isEmpty ? 'Контактные данные (email, тел.)' : null,
                    onChanged: (val) => setState(() => _contact_details = val),
                  ),
                  //dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _contacts ?? userData.contacts,
                    items: contactsList.map((c) {
                      print(c);
                      return DropdownMenuItem(
                        value: c,
                        child: Text('$c'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _contacts = val),
                  ),
                  //slider
                  Slider(
                    label: 'Предзаказ: ${_deviceid ?? userData.preorder} тыс.руб.',
                    value: (_deviceid ?? userData.preorder).toDouble(),
                    activeColor: Colors.blueGrey[_deviceid ?? userData.preorder],
                    inactiveColor: Colors.blueGrey[_deviceid ?? userData.preorder],
                    min: 10.0,
                    max: 900.0,
                    divisions: 80,
                    onChanged: (val) => setState(() => _deviceid=val.round()),
                  ),
                  RaisedButton(
                    color: Colors.blueGrey[400],
                    child: Text(
                        'Обновить',
                        style: TextStyle(color: Colors.white)
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        await DatabaseService(uid: user.uid).updateUserData(
                            _name ?? userData.name,
                            _contacts ?? userData.contacts,
                            _deviceid ?? userData.preorder,
                            _contact_details ?? userData.contact_details
                        );
                        Navigator.pop(context);
                      };
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        }
    );
  }
}
