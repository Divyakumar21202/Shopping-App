import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Cart_provider.dart';
import 'HomeScreen.dart';
import 'ItemListInCart.dart';
void main(){
  runApp(const ShoppingApp());
}
class ShoppingApp extends StatefulWidget{
  const ShoppingApp({super.key});
  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}
class _ShoppingAppState extends State<ShoppingApp> {
  List<Widget> pages=[MyHomePage(),MyCartList()];
  int CurrentPage=0;
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        home: Scaffold(
          bottomNavigationBar:BottomNavigationBar(
            iconSize: 35,
            selectedFontSize: 0,//To Zero the height of the label of the icon
            unselectedFontSize: 0,//To Zero the height of the label of the icon
            items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_sharp),label: ''),
          ],
            currentIndex: CurrentPage,
            onTap: (value) {
              setState(() {
                CurrentPage=value;
              });
            },
          ),
          backgroundColor: Colors.white,
          //is used to set the page that is already scrolled and that the way it run not from the start
          body: IndexedStack(
            index: CurrentPage,
            children: pages,
          ),

        ),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(245,247,249,1),
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            displayLarge: TextStyle(
              fontSize: 36,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
            displayMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.italic,
            )
          ),
        ),
        title: 'Shopping App',
      ),
    );
  }
}