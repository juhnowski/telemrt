import 'package:telemrt/demo/demo.dart';
import 'package:telemrt/models/mrt.dart';
import 'package:telemrt/screens/home/settings_form.dart';
import 'package:telemrt/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:telemrt/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mrt_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Mrt>>.value(
        value: DatabaseService().mrts,
        child: Scaffold(
          backgroundColor: Colors.blueGrey[50],
          appBar: AppBar(
            title: Text('MRT'),
            backgroundColor: Colors.blueGrey[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () => Navigator.push(context, Demo()),
                  icon: Icon(Icons.ondemand_video),
                  label: Text('Демо')),
              FlatButton.icon(
                  onPressed: () => _showSettingsPanel(),
                  icon: Icon(Icons.settings),
                  label: Text('Настройки')
              ),
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Выход'),
              ),
            ],
          ),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/telemrt-logo.png'),
                    fit: BoxFit.cover
                ),
              ),
              child: BtdList()
          ),
        )
    );
  }
}
