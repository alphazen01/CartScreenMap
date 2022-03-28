import 'package:cart/products_model.dart';

class CartModel {

final ProductsModel item;
int quantity;

int get price=>item.price;


CartModel({
  required this.item,
   this.quantity=1
});







}