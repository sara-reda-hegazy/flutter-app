
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  int ? id;
  int ? price;
  String ?title;
  String ?subTitle;
   String ?description;
  String ?image;
  ProductModel({this.id,this.price,this.title,this.subTitle,this.description,this.image});

 factory ProductModel.fromJson(Map<String,dynamic>json)=>ProductModel(
      id: json['id'], 
      price: json['price'],
       title: json['title'], 
      subTitle: json['subTitle'],
       description: json['description'], 
      image: json['image'],
         );

    // ProductModel.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>>snapshot)
    //  : id=snapshot['id'],
    //   price= snapshot['price'], 
    //    title= snapshot['title'], 
    //   subTitle= snapshot['subTitle'],
    //    description= snapshot['description'], 
    //   image=snapshot['image'];

        Map<String,dynamic>toJson()=>{
        'id':id,
        'price':price,
        'title':title,
        'subTitle':subTitle,
        'description':description,
        'image':image

        };
}