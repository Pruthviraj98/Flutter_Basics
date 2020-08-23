import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {

  // Push the page and remove everything else
  navigateToPage(BuildContext context, String page) {
    Navigator.of(context).pushNamed(page);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // This could be mapped from a List of items
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Column(
                  children:[
                    Image.asset('lib/assets/icon/icon.png', width: 70, height: 70),
                    Text("Shoptick Navigator", style: TextStyle(fontSize: 24),),
                  ]
                )
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(20),
            leading: Icon(Icons.list),
            title: Text('Home', style: TextStyle(fontSize: 20)),
            onTap: () => navigateToPage(context, 'home'),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(20),
            leading: Icon(Icons.info),
            title: Text('Developer Info', style: TextStyle(fontSize: 20),),
            onTap: () => navigateToPage(context, 'get_wiki_info'),
          ),
        ],
      ),
    );
  }
}