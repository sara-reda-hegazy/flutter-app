import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/Dio/apiProvider.dart';
import 'package:hello_world/model/productModel.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

//      bool isloading=true;
//  ProductModel ? productModel;
//   getProducts() async {
//      productModel=await APIProvider().getProducts();
//     setState(() {
//       isloading=false;
//     });
 // }

  // @override
  // void initState() {
  //   getProducts();
  //   super.initState();
  // }

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



































// SingleChildScrollView(
//         child: Column(
//           children: [
//            const SizedBox(height: 10,
//             ),
//             Expanded(
//               child: Stack(
//                 children: [
//                   Container(
//                     margin:const EdgeInsets.only(top: 70),
//                     decoration:const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular( 40),
//                         topRight: Radius.circular(40),
//                       ),
//                     ),
//                   ),
               
//                   Container(
//                     margin:const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 10,
//                     ),
//                     height: 190,
//                     child: Stack(
//                       alignment: Alignment.bottomCenter,
//                       children: [
//                         Container(
//                          height: 166,
//                          decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(22),
//                           color: Colors.white,
//                           boxShadow:const [
//                             BoxShadow(
//                               offset: Offset(0,15),
//                               blurRadius: 25,
//                               color: Colors.black12
//                             )
//                           ]
//                          ),
//                         ),
//                         Positioned(
//                           top: 0,
//                           right: 0,
//                           child: Container(
//                           padding:const EdgeInsets.symmetric(horizontal: 20),
//                           height: 160,
//                           width: 200,
//                           child: Image.network("${productModel?.image}",
//                           fit: BoxFit.cover,
//                           ),
//                         ),
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           left: 0,
//                           child:SizedBox(
//                             height: 136,
//                             width:size.width-200,
//                             child:  Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                const Spacer(),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                                   child: Text("Title: ${productModel?.title}",style:Theme.of(context).textTheme.bodyLarge,),
//                                 ),
//                                 const Spacer(),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                                   child: Text("SubTitle: ${productModel?.subTitle}",style:Theme.of(context).textTheme.bodySmall,
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 Padding(
//                                   padding: const EdgeInsets.all(20),
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5,
//                                     ),
//                                     decoration:BoxDecoration(
//                                       color: Colors.yellow,
//                                       borderRadius:BorderRadius.circular(22),
                                      
//                                     ),
//                                     child: Text("Price:${productModel?.price}\$"),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ) ),
//                       ],
//                     ),
//                   ),
//                 ],

//               )),
            
//           ],
          
//         ),
//       ),