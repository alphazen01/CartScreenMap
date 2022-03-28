import 'dart:io';
import 'package:cart/products_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{


  DatabaseHelper();
  static final DatabaseHelper instance=DatabaseHelper();


 static Database? _database;
 Future <Database>get database async=>_database?? await _initDatabase();


  Future<Database>_initDatabase()async{
    Directory doucumentDirectory =await getApplicationDocumentsDirectory();


    String path=join(doucumentDirectory.path,"products.db");
    return await openDatabase(path,version: 1,onCreate: _onCreate);


  }
  Future _onCreate(Database db, int version)async{
    await db.execute(
      """
     CREATE TABLE products(
       id INTEGER PRIMARY KEY,
       title TEXT,
       image TEXT,
       price INTEGER,
       description TEXT
     ) 
      """
    );
  }
  Future <int>addProducts(ProductsModel productsModel)async{
    Database db = await instance.database;
    return await db.insert("products", productsModel.toMap());
  }



  Future<List<ProductsModel>>getCartList()async{
    Database db = await instance.database;
    var product=await db.query("products",orderBy:"id" );

   List<ProductsModel>productList=product.isNotEmpty?
 product.map((data) => ProductsModel.fromMap(data)).toList():[];

return productList;




  }








}