import 'package:cart/cart.dart';
import 'package:cart/cart_controller.dart';
import 'package:cart/data.dart';
import 'package:cart/database_helper.dart';
import 'package:cart/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
   ProductList({ Key? key }) : super(key: key);
final List<ProductsModel>products=List.generate(
  data.length, (index) => ProductsModel.fromMap(data[index]),
  );
   
 
  DatabaseHelper? databaseHelper=DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    final CartController cartController=Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductList"),
        leading: IconButton(
          onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()));  
          }, 
          icon: Icon(Icons.shop)
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:products.length ,
              itemBuilder: (context,index){
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            height: 100,
                            width: 100,
                            image: NetworkImage(products[index].image),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].title,
                                  style: TextStyle(fontSize: 20),
                                ),
                                  Text(
                                  products[index].price.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                 Row(
                      children: [
                        IconButton(
                          onPressed: (){
                           cartController.addProduct(products[index]);
                           
                          }, 
                          icon: Icon(Icons.add)
                        ),
                        
                      ],
                    )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}