import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


 final _homeStream =FirebaseFirestore.instance.collection('categories').snapshots();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text("Home",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        leading:const Icon(Icons.menu),
        actions: [
          InkWell(
            child:const Padding(
              padding:   EdgeInsets.only(right: 20),
              child:   Icon(Icons.settings),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("team");
            },
            )
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
                   boxShadow:const [
                              BoxShadow(
                                offset: Offset(0,15),
                                blurRadius: 25,
                                color: Colors.black26,
                              ),
                              ],
              ),
              child:const TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search)
                ),
              )
              ,
            ),
            const SizedBox(height: 20,),
           const Text("Categories in this App for more details click on category icon",
           style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),maxLines: 3,
           ),
           const SizedBox(height: 10,),
            Expanded(
              child: StreamBuilder(
                    stream: _homeStream,
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
                      return ListView.separated(
                        itemCount: docs.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 25,),
                        itemBuilder:(context, index) {
                          return  Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  //  color: Colors.blue[100],
                                    image: DecorationImage(
                                      image:NetworkImage( docs[index]['image'],
                                      ),
                                      fit: BoxFit.cover,
                                      ),
                                  ),
                                ),
                                
                              ],
                            );
                        } ,  
              
                );
              
              },
              ),
            ),
          ],
        ),
      ),
      );
}
}