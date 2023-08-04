//import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}


class _CategoryScreenState extends State<CategoryScreen> {


   
   final _categoryStream =FirebaseFirestore.instance.collection('categories').snapshots();
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.lightBlue,
       title:const Center(child: Text("Categories",style:TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: StreamBuilder(
            stream: _categoryStream,
            builder: (context, snapshot) {
              if(snapshot.hasError)
              {
                return const Text('Connection error');
              }
              if(snapshot.connectionState == ConnectionState.waiting)
              {
                return const Text('Loading...');
              }

              var docs =snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.only(top: 15,left: 15),
                child: ListView.separated(
                  itemBuilder:(context, index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(docs[index]['image']),
                          radius: 60,
                          
                          ),
                      const  SizedBox(width: 20,),
                               Padding(
                             padding: const EdgeInsets.only(top: 50),
                             child: MaterialButton(
                                       color: Colors.lightBlue,
                                        onPressed:(){   
                                          if(docs[index]['name']=='Electronics')
                                          {
                                             Navigator.of(context).pushNamed("products");
                                          }
                                          else if(docs[index]['name']=='Fruits')
                                          {
                                            Navigator.of(context).pushNamed("fruits");
                                          }
                                          else if(docs[index]['name']=='Clothes')
                                          {
                                            Navigator.of(context).pushNamed("closthes");
                                          }
                                          else if(docs[index]['name']=='Washing Powders')
                                          {
                                            Navigator.of(context).pushNamed("powder");
                                          }
                                
                                   } ,
                                       child: Text(docs[index]['name'],
                                      style:const TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white,
                                      ),
                                      ),
                             ),
                               ),
                                      
                      ],
                    );
                    
                  },
                   separatorBuilder:(context, index) =>const SizedBox(height: 25,), 
                   itemCount: docs.length),
              );
            },
            ),
    );
}
}











 