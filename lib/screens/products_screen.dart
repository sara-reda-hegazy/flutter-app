import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final _productStream =FirebaseFirestore.instance.collection('categories').doc('XWMIQ1OD5UhhOwDdGO6k')
  .collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title:const Center(child: Text("Electronic Products",style:TextStyle(fontWeight: FontWeight.bold),
        ),
        ),
      ),
    
      body: StreamBuilder(
            stream: _productStream,
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
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () {
                             Navigator.of(context).pushNamed("electronicDetails");
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue[100],
                                boxShadow:const [
                                          BoxShadow(
                                            offset: Offset(0,15),
                                            blurRadius: 25,
                                            color: Colors.black26,
                                          ),
                                ],
                                      ),
                                      child: Row(
                                        children: [
                                          Image.network(docs[index]['image']),
                                         const SizedBox(width: 10,),
                        
                                         Column(
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(top:15),
                                               child: Text(docs[index]['title'],style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                             ),
                                            const SizedBox(height: 10,),
                                             Text(docs[index]['subTitle'],style:const TextStyle(fontSize:10,overflow:TextOverflow.ellipsis )),
                                           ],
                                         ),
                                         
                                        
                        
                                        ],
                                      )
                                     
                                    ),
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



































 