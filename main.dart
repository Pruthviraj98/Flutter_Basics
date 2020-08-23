import 'package:flutter/material.dart';
import 'menu_drawer.dart';
import 'get_info.dart' as getinfo;
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopTick',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        'home':(context)=>new MyShopApp(),
        'get_wiki_info': (BuildContext context) => new getinfo.get_info(),
      },
      initialRoute: 'home',
    );
  }
}


class MyShopApp extends StatefulWidget{
  @override
  _shopListItem createState() => _shopListItem();
}

class _shopListItem extends State<MyShopApp>{
  List<String> products=<String>[];
  List<String> nProds=<String>[];
  TextEditingController ProductNameController=TextEditingController();

  @override

  void initState(){
    super.initState();
    _loadLists();
  }

  //Loading Lists as well as counts on start

  _loadLists() async{
    SharedPreferences prefs1=await SharedPreferences.getInstance();
    SharedPreferences prefs2=await SharedPreferences.getInstance();

    setState(() {
      products=(prefs1.getStringList('products'))??<String>[];
      nProds=(prefs2.getStringList('nProds'))??<String>[];
    });
  }


  //Adding elements to Lists after the click

  _incrementLists() async{
    if(ProductNameController.text==""){
//      print("Im here!!");
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 5), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: Text('Alert!! - Please enter name of the product'),
            );
          });
    }else{
        SharedPreferences prefs1=await SharedPreferences.getInstance();
        SharedPreferences prefs2=await SharedPreferences.getInstance();

        setState(() {
          products= prefs1.getStringList('products')??<String>[];
          nProds=prefs2.getStringList('nProds')??<String>[];

          if(products.contains(ProductNameController.text)){

            int ind=products.indexOf(ProductNameController.text);
            int temp=int.parse(nProds[ind]) +1;
            nProds[ind]=temp.toString();
            prefs2.setStringList('nProds', nProds);

          }else {
            products.insert(0, ProductNameController.text);
            prefs1.setStringList('products', products);

            nProds.insert(0, 1.toString());
            prefs2.setStringList('nProds', nProds);
          }
        });
    }
  }

  _decrementLists(index) async{
      SharedPreferences prefs1=await SharedPreferences.getInstance();
      SharedPreferences prefs2=await SharedPreferences.getInstance();

      setState(() {
           products= prefs1.getStringList('products');
           nProds=prefs2.getStringList('nProds');

           products.removeAt(index);
           nProds.removeAt(index);

           prefs1.setStringList('products', products);
           prefs2.setStringList('nProds', nProds);
      });
    }

  _decrementProductNum (index) async{
    SharedPreferences prefs1=await SharedPreferences.getInstance();
    SharedPreferences prefs2=await SharedPreferences.getInstance();

    setState(() {
      products= prefs1.getStringList('products');
      nProds=prefs2.getStringList('nProds');

      int temp=int.parse(nProds[index]);

      if(temp==1){
        products.removeAt(index);
        nProds.removeAt(index);
      }else{
        temp-=1;
        nProds[index]=temp.toString();
      }

      prefs1.setStringList('products', products);
      prefs2.setStringList('nProds', nProds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Today's shopping list"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child:
              Container(
                child:
                TextField(
                  controller: ProductNameController,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'Add Item',
                  ),
                ),
              ),
              ),
          RaisedButton.icon(
              label: Text('Add Item'),
              onPressed: (){
                _incrementLists();
              },
              icon: Icon(Icons.shopping_cart),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              splashColor: Colors.blue
          ),
          Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        title:
                        Text('${products[index]},  Quantity - (${nProds[index]})',
                           style: TextStyle(fontSize: 18),
                        ),
                        trailing:
                        Wrap(
                          spacing: 12, // space between two icons
                          children: <Widget>[
                            IconButton(icon: Icon(Icons.close), onPressed: () => _decrementLists(index)), // icon-1
                            IconButton(icon: Icon(Icons.remove_circle_outline), onPressed:() => _decrementProductNum(index)), // icon-2
                          ],
                        ),


                      );
                    }
                )

          )
        ],
      ),
    );
  }

}
