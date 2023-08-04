import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ElectronicDetails extends StatefulWidget {
  const ElectronicDetails({super.key});

  @override
  State<ElectronicDetails> createState() => _ElectronicDetailsState();
}

class _ElectronicDetailsState extends State<ElectronicDetails> {

  final _detailStream =FirebaseFirestore.instance.collection('categories').doc('XWMIQ1OD5UhhOwDdGO6k')
 .collection('products').snapshots();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title:const Center(child: Text("Details",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),),
      ),
      body:   StreamBuilder(
            stream: _detailStream,
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
                itemCount: docs.length,
                itemBuilder:(context, index) {
                  return  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue[100],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 100,
                                    backgroundImage:NetworkImage(docs[index]['image']) ,
                                  ),
                                ),
                               const SizedBox(height: 20,),
                               Text("Title:${docs[index]['title']}",
                               style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                               ),
                                Text("Price: ${docs[index]['price']}\$",
                               style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                               color: Color.fromARGB(255, 204, 155, 7),
                               ),
                               ),
                              ],
                            ),
                          ),
                          Text("Description: ${docs[index]['description']}",
                          style:const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),maxLines: 3,)
                        ],
                      ),
                  );
                } ,  
      
    );
      
  },
      ),
      );
}
}