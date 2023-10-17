import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Cart_provider.dart';
import 'package:shopping_app/HomeScreen.dart';

class ItemDetailPage extends StatefulWidget{
   final productlist;
   const ItemDetailPage({
     super.key,
     required this.productlist,
   }
   );
  @override
  State<ItemDetailPage> createState() {
    return _ItemDetailPageState();
  }
}
class _ItemDetailPageState extends State<ItemDetailPage> {
  int Selectedsize=0;
  @override
  void initState() {
    super.initState();
  }
   @override
  Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title:const Text('Detail',) ,
         centerTitle: true,
         leading:GestureDetector(child: const Icon(Icons.arrow_back_ios_new),
             onTap: (){
           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context) {
             return const MyHomePage();
           },
           ),
           (route) => false);
       },
       ),
       ),
       body: Center(
         child: Column(
              children: [
                const SizedBox(height: 28,),
                //title Of the Product
                Text('Men\'s Shoes',style: Theme.of(context).textTheme.displayLarge,
                ),
               const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('asset/images/image1.jpg',),
                ),
                const Spacer(flex: 2,),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                   color: Color.fromRGBO(245,247,249,1),
                  ),
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('\$ ${widget.productlist['price']}',style: Theme.of(context).textTheme.displayLarge),
                      SizedBox(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:widget.productlist['size'].length ,
                              itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  child: Chip(label:
                                      Text('${widget.productlist['size'][index]}',style:Theme.of(context).textTheme.displayMedium,
                                      ),
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                                    backgroundColor:(Selectedsize==index)?Colors.amber:const Color.fromRGBO(255, 255, 244, 1),
                                  ),
                                  onTap: (){
                                    Selectedsize=index;
                                    setState(() {
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Provider.of<CartProvider>(context,listen: false).AddProduct(
                                {
                                  'id':widget.productlist['id'],
                                  'title':widget.productlist['title'],
                                  'price':widget.productlist['price'],
                                  'company':widget.productlist['company'],
                                  'size':Selectedsize,
                                  'imageurl':widget.productlist['imageurl'],
                                }
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)
                            ),
                            ),
                            backgroundColor: Colors.amber,
                             minimumSize: const Size(double.infinity, 50),
                          ),
                          icon: const Icon(Icons.shopping_cart,color: Colors.black,),
                          label: Text('Add To Cart',style: Theme.of(context).textTheme.displayLarge,
                        ),
                     ),
                      ),
                    ],
                  ),
                ),
                //title Of the Product
              ],
         ),
       ),
     );
   }
}
