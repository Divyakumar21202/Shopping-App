import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier{
  final List<Map<String,dynamic>> CartUpdation=[];

  void AddProduct(Map<String,dynamic> LikedItem){
    CartUpdation.add(LikedItem);
    notifyListeners();
  }


  void DeleteProduct(Map<String,dynamic> UnlikeItem){
    CartUpdation.remove(UnlikeItem);
    notifyListeners();
  }



}