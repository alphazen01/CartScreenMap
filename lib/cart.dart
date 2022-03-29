import 'package:cart/cart_controller.dart';
import 'package:cart/data.dart';
import 'package:cart/database_helper.dart';
import 'package:cart/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  DatabaseHelper? databaseHelper = DatabaseHelper();
  final List<ProductsModel>products=List.generate(
  data.length, (index) => ProductsModel.fromMap(data[index]),
  );

  @override
  Widget build(BuildContext context) {
    final CartController cartController=Provider.of<CartController>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("CartScreen"),
      ),
      body: Column(
        children: [
          Expanded(
            child:Consumer<CartController>(
              builder: (context, artController, child) {
               return  ListView.separated(
                itemCount:cartController.cartList.length ,
                itemBuilder: 
                  (context, index) {
                  return CartItem(
                    name: cartController.cartList[index].item.title, 
                    price: cartController.cartList[index].item.price.toString(), 
                    quantity: cartController.cartList[index].quantity.toString(), 
                    cartController: cartController, 
                    id: cartController.cartList[index].item.id,
                    image:cartController.cartList[index].item.image
                    );
                },
                separatorBuilder: (context, index){
                 return Divider(
                   color: Colors.grey,
                   
                 );
                },
              );
              },
            ) 

           
            
          ),
          Row(
            children: [
              Consumer<CartController>(
                builder: (context, cartController, child) {
                   double total=0;
                   cartController.cartList.forEach((element) {total+=(element.price*element.quantity);});
                  return Text(
                  "Total: "+total.toString(),
                  style: TextStyle(
                    fontSize: 40
                  ),
                  
                );
                },

              )
            ],
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String price;
  final String name;
  final String quantity;
  final CartController cartController;
  final int id;
  final String image;

  const CartItem({
    Key? key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.cartController,
    required this.id,
    required this.image
 
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: Colors.tealAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(image),
          Text(name),
          Text(price),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {

                cartController.increment(id);
              }, icon: Icon(Icons.add)),
              Text(quantity),
              IconButton(onPressed: () {
                cartController.decrement(id);
              }, icon: Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}
