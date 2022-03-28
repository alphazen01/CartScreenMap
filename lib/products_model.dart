import 'package:flutter/cupertino.dart';

class ProductsModel{
final int id;
final String title; 
final String image;
final int price;



ProductsModel({
   Key? key,
   required this.id,
   required this.title,
   required this.image,
   required this.price

   });
   Map <String, dynamic>toMap()=>{
     "id":id,
     "title":title,
     "image":image,
     "price":price
   };

   factory ProductsModel.fromMap(Map<String, dynamic>data)=>ProductsModel(
     id: data["id"],
     title: data["title"], 
     image: data["image"], 
     price: data["price"]
     );









}