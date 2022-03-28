import 'package:cart/cart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
       title: Text("HomeScreen"),
     ),
     body: Column(
       children: [
         Expanded(
           child: GridView.builder(
             itemCount: 5,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               mainAxisSpacing: 2,
               crossAxisSpacing:2 ,
               crossAxisCount: 2
               ), 
             itemBuilder: (BuildContext, index ){
              return Container(
                height: 100,
                width: 100,
                color: Colors.tealAccent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Title",
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                         ClipOval(
                            child: Material(
                              color: Colors.redAccent,
                              child: IconButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()));
                                }, 
                                icon: Icon(Icons.add)
                              ),
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