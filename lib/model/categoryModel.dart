import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  
  String ?name;
  String ?image;
  CategoryModel({this.name,this.image});

 factory CategoryModel.fromJson(Map<String,dynamic>json)=>CategoryModel(
     
      name: json['name'], 
      image: json['image'],
         );
         
        Map<String,dynamic>toJson()=>{
          
        'name':name,
        'image':image,

        };
}