import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClothesScreen extends StatefulWidget {
  const ClothesScreen({super.key});

  @override
  State<ClothesScreen> createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {

 

  final _clothesStream =FirebaseFirestore.instance.collection('categories').doc('n9gAYiw6Cy8vUPFeOqrA')
  .collection('clothingProducts').snapshots();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title:const Center(child: Text("Clothing Products",style:TextStyle(fontWeight: FontWeight.bold),
        ),
        ),
      ),
    
      body: StreamBuilder(
            stream: _clothesStream,
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
              return ListView.builder(
                itemBuilder:(context, index) {
                 return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue[100],
                              boxShadow:const [
                                        BoxShadow(
                                          offset: Offset(0,15),
                                          blurRadius: 25,
                                          color: Colors.black26
                                        ),
                              ],
                                    ),
                                    child: Row(
                                      children: [
                                        Image.network(docs[index]['image'],),
                                       const SizedBox(width: 10,),
                        
                                       Column(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only(top:15),
                                             child: Text(docs[index]['name'],style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                           ),
                                          const SizedBox(height: 10,),
                                           Text("Price: ${docs[index]['price']}\$",
                                           style:const TextStyle(fontSize:20,fontWeight: FontWeight.bold,
                                           color:Color.fromARGB(255, 204, 155, 7) )),
                                         ],
                                       ),
                                       
                                      
                        
                                      ],
                                    )
                                   
                                  ),
          )
        ],
      );

                  
    
                },
                 itemCount: docs.length);
            },
            ),
    );
  }
}
