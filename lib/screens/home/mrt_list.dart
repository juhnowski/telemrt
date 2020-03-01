import 'package:telemrt/models/mrt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mrt_tile.dart';


class BtdList extends StatefulWidget {
  @override
  _BtdListState createState() => _BtdListState();
}

class _BtdListState extends State<BtdList> {
  @override
  Widget build(BuildContext context) {

    final mrts = Provider.of<List<Mrt>>(context) ?? [];


    return ListView.builder(
      itemCount: mrts.length,
      itemBuilder: (context, index) {
        return MrtTile(mrt: mrts[index]);
      },
    );
  }
}
