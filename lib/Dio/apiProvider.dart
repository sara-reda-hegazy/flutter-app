import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hello_world/model/categoryModel.dart';
import 'package:hello_world/model/developerModel.dart';
import 'package:hello_world/model/productModel.dart';
 
 
import 'package:hello_world/model/userModel.dart';
 
 
//.doc(userModel.email)
class APIProvider
{
 
  final String baseURL="http://159.89.4.181:2000/api/v1";
   
  ProductModel productModel = ProductModel();
     getProducts()
    async {
      
      await FirebaseFirestore.instance.collection("categories")
      .doc("XWMIQ1OD5UhhOwDdGO6k").collection("products").doc()
      .get()
      .then((value){
       productModel =ProductModel.fromJson((value.data()!));
       
      });
      return productModel;
    }
  
  
    CategoryModel categoryModel =CategoryModel();
    getCategory()
    async {
      await FirebaseFirestore.instance.collection("categories")
      .doc("XWMIQ1OD5UhhOwDdGO6k")
      .get()
      .then((value){
       categoryModel =CategoryModel.fromJson((value.data()!));
       print(categoryModel.name);
      });
      return categoryModel;
    }
    

  UserModel userModel =UserModel();
 Future<UserModel> getUsers()
async {
  await FirebaseFirestore.instance.collection("users")
  .doc(FirebaseAuth.instance.currentUser!.email)
  .get()
  .then((value){
      userModel = UserModel.fromJson(value.data()!);
      print(userModel.email);
    
}); 
return userModel;
}


 DeveloperModel developerModel = DeveloperModel();
 Future<DeveloperModel> getDeveloper()
async {
  await FirebaseFirestore.instance.collection("developerTeam")
  .doc("mnAPuEQDbGlH2xhnV7Pe")
  .get()
  .then((value){
      developerModel = DeveloperModel.fromJson(value.data()!);
      print(developerModel.email);
    
}); 
return developerModel;
}





  signInEmail({required String email , required String password})
  async {
    try
    {
    FormData formData = FormData.fromMap(
      {
           "email":email,
           "password":password,
      },
    );
   
    Response response = await Dio().post("$baseURL/auth/email/signin",data: formData);
    print(response.data);
     
  }
  catch(e)
  {
  if(e is DioException) {
    print( e.response);
  }
  }
}


   
}