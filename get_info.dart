import 'package:flutter/material.dart';
import 'menu_drawer.dart';
import 'package:contactus/contactus.dart';

class get_info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("About Developer", style: TextStyle(color: Colors.black, fontSize: 22)),
        ),
        drawer: MenuDrawer(),
        backgroundColor: Colors.white70,
        body: Container(
          padding: EdgeInsets.all(20),
          child:
            ContactUs(
            logo: AssetImage('lib/assets/icon/icon.png'),
            email: 'pruthvir.patil98@gmail.com',
            companyName: 'Pruthviraj R Patil',
            phoneNumber: '+918754487085',
            website: 'https://medium.com/@pruthvir.patil98',
            githubUserName: 'Pruthviraj98',
            linkedinURL: 'https://www.linkedin.com/in/pruthviraj1096/',
            tagLine: 'Student at New York University',
            instagram: '__pruthviraj',
          ),
      ),
    );
  }
}