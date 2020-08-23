import 'package:flutter/material.dart';
import 'menu_drawer.dart';
//import 'package:dartpedia/dartpedia.dart' as wiki;
import 'package:http/http.dart' as http;


class get_info extends StatefulWidget {
  @override
  _StateGetInfo createState() =>_StateGetInfo();
}

class _StateGetInfo extends State<get_info>{
  String informataion="Go ahead! Search Anything!!";

  TextEditingController WikiProductName =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Get Information of a Product"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
              controller: WikiProductName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search About Your Product',
              )
          ),
          RaisedButton(
              child: Text("Search"),
              onPressed: null, // assign wiki fun here later
          ),
          Expanded(
              child: Text(
                  informataion
              )
          ),
        ],
      ),
    );
  }
}