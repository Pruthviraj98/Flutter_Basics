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
            padding: EdgeInsets.all(10),
            child: Center(child: Text("Shoptick Navigator", style: TextStyle(fontSize: 24),)),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Home'),
            onTap: () => navigateToPage(context, 'home'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Get Product In fo'),
            onTap: () => navigateToPage(context, 'get_wiki_info'),
          ),
        ],
      ),
    );
  }
}