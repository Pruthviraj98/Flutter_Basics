import 'package:flutter/material.dart';

// TUTORIAL- 1
//void main() => runApp(MyApp());
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Welcome to Flutter',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('MY WORLD IS Flutter!!!!!!'),
//        ),
//        body: Center(
//          child: Text('Hello Wwrld',
//              style: new TextStyle(
//                fontSize: 25.0,
//                color: Colors.blue,
//              )
//          ),
//        ),
//      ),
//    );
//  }
//}

// TUTORIAL- 2 - Using  Basic Widgets
//class MyAppBar extends StatelessWidget{
//  MyAppBar({this.title});
//// Fields in a Widget subclass are always marked "final".
//  final Widget title;
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      height: 70.0,// in logical pixels
//      padding: const EdgeInsets.symmetric(horizontal: 10.0),
//      decoration: BoxDecoration(color: Colors.red),
//      // Row is a horizontal, linear layout.
//      child: Row(
//        // <Widget> is the type of items in the list.
//        children: <Widget>[
//          IconButton(
//              icon: Icon(Icons.menu),
//              onPressed: null,
//              tooltip: 'Navigation menu',
//          ),
//          Expanded(
//            child: title,
//          ),
//          IconButton(
//            icon:Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          ),
//        ],
//      ),
//    );
//  }
//}
//class MyScaffold extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    // Material is a conceptual piece of paper on which the UI appears.
//    return Material(
//      // Column is a vertical, linear layout.
//      child: Column(
//        children: <Widget>[
//          MyAppBar(
//            title: Text(
//              'First App on Flutter',
//              style: Theme.of(context).primaryTextTheme.headline6,
//            )
//          ),
//          Expanded(
//            child: Center(
//              child: Text(
//                'Tutorials 2!!!'
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
//
//void main(){
//  runApp(
//      MaterialApp(
//        title: 'My App', // used by the OS task switcher
//        home: MyScaffold(),
//    )
//  );
//}

// Tutorial - 3 - Using Material Components

//void main(){
//  runApp(
//      MaterialApp(
//      title: "Flutter Tutorial",
//      home: TutorHome(),
//    )
//  );
//}
//
//class TutorHome extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // Scaffold is a layout for the major Material Components.
//    return Scaffold(
//      //unlike previous tutorial, Scaffold is already present in MaterialApp use it directly
//      appBar: AppBar(// an example of how a widget can be passed as arguments to other widgets
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          tooltip: 'Navigation menu',
//          onPressed: null,
//        ),
//         title: Text(
//           "Tutorial 3 - MaterialApp widget"
//         ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          ),
//        ],
//      ),
//      body: Center(
//        child: Text(
//          "Hi! there!, this is built using the MaterialApp Widget's element named Scaffold"
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        tooltip: 'Add',
//        child: Icon(Icons.add),
//        onPressed: null,
//      ),
//    );
//  }
//}

// Tutorials 4: Handling Gestures
//
//
//void main(){
//  runApp(
//      MaterialApp(
//        title: "My new app",
//        home: TutorialHome(),
//      )
//  );
//}
//
//class TutorialHome extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          tooltip: "Navigation menu",
//          onPressed: null,
//        ),
//        title: Text('Tutorial 4 Adding Button here'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          )
//        ],
//      ),
//      body: Center(
//        child: MyButton(),
//      ),
//    );
//  }
//}
//
//class MyButton extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () {
//        print('MyButton was tapped!');
//      },
//      child: Container(
//        height: 36.0,
//        padding: const EdgeInsets.all(8.0),
//        margin: const EdgeInsets.symmetric(horizontal: 8.0),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(5.0),
//          color: Colors.lightGreen[500],
//        ),
//        child: Center(
//          child: Text('Engage'),
//        ),
//      ),
//    );
//  }
//}


// TUTORIAL 5 : USING STATEFULWIDGET

//void main(){
//  runApp(
//      MaterialApp(
//       title: 'Tutorial 3 StatefulWidget Using',
//       home: TutorialFun(),
//  )
//  );
//}
//
//class TutorialFun extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(icon: Icon(Icons.menu), onPressed: null, tooltip: "Navigate",),
//        title: Text("Tutorial 5 - StatefulWidget Inclusion"),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.search), onPressed: null, tooltip: 'Search',)
//        ],
//      ),
//      body: Center(
//          child: Counter()
//      ),
//    );
//  }
//}
//
//class Counter extends StatefulWidget{
//  @override
//// This class is the configuration for the state. It holds the
//// values (in this case nothing) provided by the parent and used
//// by the build  method of the State. Fields in a Widget
//// subclass are always marked "final".
//  _CounterState createState() => _CounterState();
//}
//class _CounterState extends State<Counter>{
//
//  int _counter=0;
//  void _increment(){
//    setState(() {
//      // This call to setState tells the Flutter framework that
//      // something has changed in this State, which causes it to rerun
//      // the build method below so that the display can reflect the
//      // updated values. If you change _counter without calling
//      // setState(), then the build method won't be called again,
//      // and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisSize: MainAxisSize.min,//added this myself  to expt
//      children: <Widget>[
//        RaisedButton(
//            onPressed: _increment,
//            child: Text('Increment'),
//        ),
//        Text('  Count: $_counter')//way to use variables in output statements
//      ],
//    );
//  }
//
//}

// TUTORIAL 6: change notifications flow up the widget hierarchy while,
// current State flows "down' to the widgets that do the presentation

//void main(){
//  runApp(
//      MaterialApp(
//      title: 'Tutorials 6',
//      home: TutorialFun(),
//  )
//  );
//}
//
//class TutorialFun extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return(
//      Scaffold(
//        appBar: AppBar(
//          leading: IconButton(
//            icon: Icon(Icons.menu),
//            tooltip: 'Navigation Button',
//            onPressed: null,
//          ),
//          title: Text("TUTORIAL 6 : KUCH ALAG HEE CHEEZ ;)"),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.search),
//              onPressed: null,
//              tooltip: 'Search',
//            )
//          ],
//        ),
//        body: Center(
//          child: Counter()
//        )
//      )
//    );
//  }
//}
//
//class CounterDisplay extends StatelessWidget{
//  CounterDisplay({this.count});// as a class variable similar to that
//  final int count; // as a class variable similar to that
//
//  @override
//  Widget build(BuildContext context) {
//    return Text('   Count: $count');
//  }
//}
//
//class CounterIncrementor extends StatelessWidget{
//  CounterIncrementor({this.onPressed});
//  final VoidCallback onPressed; // similar to the class variable here this is a variable of type VoidCallBack
//
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton(
//      onPressed: onPressed,
//      child: Text('Increment'),
//    );
//  }
//}
//
//// only the last tutorial is deeper in explanation here
//
//class Counter extends StatefulWidget{
//  @override
//  _CounterState createState() => _CounterState();
//}
//
//class _CounterState extends State<Counter>{
//
//  int _counter=0;
//  void _increment(){
//    setState(() {
//      return ++_counter;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        CounterIncrementor(onPressed: _increment),
//        CounterDisplay(count: _counter),
//      ],
//    );
//  }
//
//}

// TUTORIAL 7: Shopping cart widget creation
//

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

