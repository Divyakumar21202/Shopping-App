import 'package:flutter/material.dart';
import 'ItemListInCart.dart';
import 'ShoesCatalog.dart';
class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {
  List<String> items=[
    'All','Addidas','Bata','Nike','Puma',
  ];
  late String SelectedItem;
  @override
  void initState() {
    super.initState();
    SelectedItem=items[0];
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(

      body:
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: Column(
              children: [
                const SizedBox(height: 30,),

                //Part One :
                Container(height: 130,width: double.infinity,color: Colors.white,
                child:HomeFirstPart(),
                ),
                const SizedBox(height: 5,),

                //Second Part :
                SizedBox(height: 80,width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                      itemCount:items.length,
                      itemBuilder:
                      (context, index) {
                        return  Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {
                              SelectedItem=items[index];
                              setState((){
                              });
                            },
                            child: Chip(label: Text(items[index]),
                              labelStyle: const TextStyle(fontSize: 16 ),
                              backgroundColor:SelectedItem==items[index]?Colors.amberAccent:const Color.fromRGBO(245, 247, 249, 1),
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                            ),
                          ),
                        );
                    }
                  ),
                ),
                const SizedBox(height: 5,),
                ThirdView(),

              ],
            ),
          )
      );
  }
}

class HomeFirstPart extends StatelessWidget{
  HomeFirstPart({super.key});

  @override
  Widget build(BuildContext context){
    return const SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Text('Shoes\nCollection',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Lato'),),
          ),
          Expanded(child:
          SearchBar(hintText: 'Search',
            leading: Icon(Icons.search),

          ),
          ),
        ],
      ),
    );

  }

}