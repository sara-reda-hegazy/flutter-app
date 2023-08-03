 
import 'package:flutter/material.dart';
import 'package:hello_world/Dio/apiProvider.dart';
import 'package:hello_world/model/userModel.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  bool isloading=true;
  UserModel? userModel;
  getUser() async {
    userModel=await APIProvider().getUsers();
    setState(() {
      isloading=false;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title:const Center(child: Text("Your Personal Information",style:TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body:isloading?const CircularProgressIndicator(): Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
              Icon(Icons.account_circle,size:200,color: Colors.blue[100],) ,
            const SizedBox(height:30),
            
            Text("Name :${userModel?.name}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height:15),
            Text("Gender :${userModel?.gender}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height:15),
            Text("Age :${userModel?.age}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height:15),
            Text("Birthday :${userModel?.birthday}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height:15),
            Text("Phone :${userModel?.phone}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height:15),
            Text("Email :${userModel?.email}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height:15),
            Text("City :${userModel?.city}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            
            
          ],
        ),
      ),
    );
  }
}
 
  




















































































































































































































































