import 'package:flutter/material.dart';
class MyItemCard extends StatelessWidget{
  final CurrentCard;
  const MyItemCard({super.key, required this.CurrentCard,});
  Widget build (BuildContext context){
    String title =CurrentCard['title'];
    String price=CurrentCard['price'].toString();
    final String imageUrl=CurrentCard['imageurl'];
    return Container(
      height: 260,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20)
      ),
        color: Colors.black,
          image: DecorationImage(image: AssetImage(imageUrl),
          fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title',style: const TextStyle(fontSize: 25,color: Colors.black),),
            Text('\$$price',style: const TextStyle(fontSize: 17,color: Colors.black)),
          ],
        ),
    );
}
}