import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Cart_provider.dart';
class MyCartList extends StatelessWidget{
  const MyCartList({super.key});
  @override
  Widget build(BuildContext context){
    final List<Map<String,dynamic>> Cart=Provider.of<CartProvider>(context).CartUpdation;

    return Scaffold(
      body: ListView.builder(
          itemCount: Cart.length,
          itemBuilder: (context,index){
            final CartItem=Cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(CartItem['imageurl'] as String,),
              ),
              title: Text('${Cart[index]['title']}',style: Theme.of(context).textTheme.bodyMedium,),
              subtitle: Text('8',style: Theme.of(context).textTheme.bodySmall,),
              trailing: IconButton(icon: Icon(Icons.delete),color: Colors.red,
                onPressed: () {
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Delete Item',style: Theme.of(context).textTheme.displayMedium,),
                    content: const Text('Are You Sure To Delete an item From the Cart ?'),
                    actions: [
                      TextButton(onPressed: (){
                        Provider.of<CartProvider>(context,listen: false).DeleteProduct(Cart[index]);
                        Navigator.of(context).pop();
                      },
                          child: const Text('Yes',style: TextStyle(color: Colors.red),)),
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      },
                          child: const Text('No',style: TextStyle(color: Colors.blue),)),
                    ],
                  );
                }
                );
                },
              ),
            );
      }
      ),
    );
  }
}