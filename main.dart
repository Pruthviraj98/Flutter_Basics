import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
      title: "Tutorial 7- Shopping App",
      home: TutorialSevenShoppingList(
        products: <Product>[
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate Chips')
        ],
      ),
   )
  );
}

////////////////////////////////////////
class TutorialSevenShoppingList extends StatefulWidget{
  TutorialSevenShoppingList({Key key, this.products}):super(key:key);//Classname(key, paramName) key because it holds another widget that changes
  final List<Product> products;//paramname

  _TutorialShoppingState createState()=>_TutorialShoppingState();
}

class Product{
  Product({this.name}); // Classname(paramName)
  final String name;//paramname
}

class _TutorialShoppingState extends State<TutorialSevenShoppingList>{
  // Set is a collection of objects where each object can occur only once
  //
  Set<Product> TutorialShoppingCart = Set<Product>();//assigned var that changes

 //define function that helps in changing the above variable
  void _handleCartChanged(Product product, bool inCart) {
      setState(() {
        if (!inCart) {
          TutorialShoppingCart.add(product);
        }else {
          TutorialShoppingCart.remove(product);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        children: widget.products.map((Product product){
          return ShoppingListItem(//shopping list item class is defined below
          product: product,
          inCart: TutorialShoppingCart.contains(product),
          onCartChanged: _handleCartChanged,
          ///////////////cont here////////////////////////////////
          );
      }).toList(),
    ),
    );
  }
}


typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({this.product, this.inCart, this.onCartChanged}):super(key:ObjectKey(product));
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

//now define functions here
  TextStyle _getTextStyle(BuildContext context){
    if(!inCart) {
      return null;
    }
    else{
      return TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
     }
    }

 //override here
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(product.name[0]),
      ),//put the first name in circle
      title: Text(
        product.name,
        style: _getTextStyle(context),// has to be dynamic. i.e. changes if cancelled or not
      ),
    );
  }
}
//////////////////////////////////////////

