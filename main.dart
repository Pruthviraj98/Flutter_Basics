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
    ProductNameController.clear();
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


  _incrementProductNum (index) async{
    SharedPreferences prefs2=await SharedPreferences.getInstance();

    setState(() {
      nProds=prefs2.getStringList('nProds');
      int temp=int.parse(nProds[index]);
      temp+=1;
      nProds[index]=temp.toString();
      prefs2.setStringList('nProds', nProds);
    });

  }



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
              drawer: MenuDrawer(),
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: Text("Today's shopping list", style: TextStyle(color: Colors.black, fontSize: 22)),
              ),
              body:

              Stack(
                children:<Widget>[
                  Center(
                    child: new Image.asset(
                      'lib/assets/icon/bg1.png',
                      width: size.width,
                      height: size.height,
                      fit: BoxFit.fill,
                      colorBlendMode: BlendMode.softLight,
                    ),
                  ),


                  Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child:
                      Container(
                        child:
                        TextField(
                          controller: ProductNameController,
                          decoration: InputDecoration(
                            filled: true, // this was a pain in the ass
                            fillColor: Colors.white70,
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20.0),
                             ),
                             labelText: "Add Product",
                          ),
                        ),
                      ),
                      ),
                  RaisedButton.icon(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
                      label: Text('Add Item', style: TextStyle(fontSize: 18),),
                      onPressed: (){
                        _incrementLists();
                      },
                      icon: Icon(Icons.shopping_cart),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      splashColor: Colors.blue
                  ),
                  Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(10),
                            itemCount: products.length,
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70
                                ),
                                child:
                                ListTile(
                                    title:
                                    Text((index+1).toString()+'.  '+ (products[index][0]).toUpperCase()+ products[index].substring(1, products[index].length),
                                       style: TextStyle(fontSize: 18, color: Colors.black),
                                    ),
                                    trailing:
                                    Wrap(
                                      spacing: 0, // space between two icons
                                      children: <Widget>[
                                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))), child: IconButton(icon: Icon(Icons.exposure_neg_1), onPressed:() => _decrementProductNum(index), color: Colors.black)), // icon-1
                                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))), child: RaisedButton.icon(label:Text('${nProds[index]}', style: TextStyle(fontSize: 18, color: Colors.black)), onPressed: null, icon: Icon(Icons.equalizer, color: Colors.black,),)),
                                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))), child: IconButton(icon: Icon(Icons.exposure_plus_1), onPressed:() => _incrementProductNum(index), color: Colors.black)), // icon-2
                                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))), child: IconButton(icon: Icon(Icons.close), onPressed: () => _decrementLists(index), color: Colors.redAccent)), // icon-3
                                      ],
                                    ),
                                  ),
                              );
                            }
                        )
                  ),

                ],
              ),],
              ),
            );
  }

}
