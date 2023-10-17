import 'package:flutter/material.dart';
import 'ItemCardDesign.dart';
import 'package:shopping_app/GlobalVariables.dart';
import 'item_detail_page.dart';

class ThirdView extends StatelessWidget{
    ThirdView({super.key});
    Widget build(BuildContext context){
      return Expanded(
        child: ListView.builder(
            itemCount: newitems.length,
            itemBuilder:
            (context,index){
              final carditem=newitems[index];
              return GestureDetector(
                  child: MyItemCard(CurrentCard: carditem,),
              onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (context){
                       return ItemDetailPage(productlist: carditem,);
                  }
                ),
              );
            },
          );
         }
        ),
      );
    }
}