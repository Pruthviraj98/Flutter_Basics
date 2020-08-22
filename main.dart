import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyShopApp(),
  ));
}

class MyShopApp extends StatefulWidget{
  @override
  _shopListItem createState() => _shopListItem();
}
class _shopListItem extends State<MyShopApp>{
  final List<String> products=<String>[];
  final List<int> nProds=<int>[];
  TextEditingController ProductNameController=TextEditingController();


  void AddProduct(){
    setState(() {
      if(products.contains(ProductNameController.text)){
        int ind=products.indexOf(ProductNameController.text);
        nProds.insert(ind, nProds[ind]+1);
      }else {
        products.insert(0, ProductNameController.text);
        nProds.insert(0, 0);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          RaisedButton(
              child: Text('Add Item'),
              onPressed: (){
                AddProduct();
              }
          ),
          Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        title: Text('${products[index]} (${nProds[index]})',
                           style: TextStyle(fontSize: 16),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: (){
                              setState(() {
                                products.removeAt(index);
                              });
                            }
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