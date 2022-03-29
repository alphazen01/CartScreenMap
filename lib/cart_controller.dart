import 'package:cart/cart_model.dart';
import 'package:cart/products_model.dart';
import 'package:flutter/cupertino.dart';

class CartController extends ChangeNotifier{

double total=0;


Map<int,CartModel> cartItems={};
List<CartModel>cartList =[];


void addProduct(ProductsModel product){
cartItems[product.id]=CartModel(item: product);
cartList=cartItems.values.toList();
notifyListeners();
}
void increment(int id){
 cartItems[id]?.quantity++;
  notifyListeners();
}

void decrement(int id){
  final CartModel? item=cartItems[id];
  if (item==null||item.quantity<2) {
    return;
  }else{
    cartItems[id]?.quantity--;
  notifyListeners();
  }
 
}



}