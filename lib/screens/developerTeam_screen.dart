import 'package:flutter/material.dart';
import 'package:hello_world/Dio/apiProvider.dart';
import 'package:hello_world/model/developerModel.dart';

class DeveloperTeamScreen extends StatefulWidget {
    DeveloperTeamScreen({super.key});

  @override
  State<DeveloperTeamScreen> createState() => _DeveloperTeamScreenState();
}

class _DeveloperTeamScreenState extends State<DeveloperTeamScreen> {
bool isloading=true;

 DeveloperModel ? developerModel;

    getDeveloper() async {
    developerModel =await APIProvider().getDeveloper();
    setState(() {
      isloading=false;
    });
  }

  @override
  void initState() {
    getDeveloper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text("Developer Team",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body:isloading? const Center(child: CircularProgressIndicator()): Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CircleAvatar(
                              backgroundImage: NetworkImage("${developerModel!.image}"),
                              radius: 70,
                              
                          ),
            ),
                     const SizedBox(height: 20,),
                     Text("Name: ${developerModel!.name}",
                     style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                     Text("Email: ${developerModel!.email}",
                     style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                     Text("Phone: ${developerModel!.phone}",
                     style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                
          ],
        ),
      ),
    );
  }
}