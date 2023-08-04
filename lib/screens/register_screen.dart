
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/model/userModel.dart';

class RegisterScreen  extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
    bool visible=true;
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
     TextEditingController genderController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController birthdayController = TextEditingController();
     TextEditingController phoneNumberController = TextEditingController();
    var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const  Text("Register",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                   TextFormField(
                    controller:emailController,
                    validator:(value) {
                      if(value!.isEmpty)
                      {
                        return "Email must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted:(value) {
                      print(value);
                    },
                    onChanged:(value){
                      print(value);
                    },
                    decoration:const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                  
                    ),
                  ),
                     const SizedBox(
                    height: 40,
                  ),
                       TextFormField(
                        controller: passwordController,
                        obscureText: visible,
                        onFieldSubmitted:(value) {
                          print(value);
                        }, 
                    decoration:  InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon:const Icon(Icons.lock),
                      suffixIcon:IconButton(
                        onPressed:(){
                          setState(() {
                            visible =!visible;
                          });
                        },icon:visible ? const Icon(Icons.remove_red_eye):const Icon(Icons.visibility_off)),
                  
                    ),
                  ),
                       const SizedBox(
                    height: 40,
                  ),
                    TextFormField(
                    controller:nameController,
                    validator:(value) {
                      if(value!.isEmpty)
                      {
                        return "Name must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    onFieldSubmitted:(value) {
                      print(value);
                    },
                    onChanged:(value){
                      print(value);
                    },
                    decoration:const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                                 const SizedBox(
                    height: 40,
                  ),
                    TextFormField(
                    controller:genderController,
                    validator:(value) {
                      if(value!.isEmpty)
                      {
                        return "Gender must not be empty";
                      }
                      return null;
                    },
                    onFieldSubmitted:(value) {
                      print(value);
                    },
                    onChanged:(value){
                      print(value);
                    },
                    decoration:const InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(),
                    ),
                  ),
                         const SizedBox(
                    height: 40,
                  ),
                    TextFormField(
                    controller:ageController,
                    validator:(value) {
                      if(value!.isEmpty)
                      {
                        return "age must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onFieldSubmitted:(value) {
                      print(value);
                    },
                    onChanged:(value){
                      print(value);
                    },
                    decoration:const InputDecoration(
                      labelText: "Age",
                      border: OutlineInputBorder(),
                    ),
                  ),
                         const SizedBox(
                    height: 40,
                  ),
                    TextFormField(
                    controller:birthdayController,
                    validator:(value) {
                      if(value!.isEmpty)
                      {
                        return "birthday must not be empty";
                      }
                      return null;
                    },
                   // keyboardType: TextInputType.datetime,
                    onFieldSubmitted:(value) {
                      print(value);
                    },
                    onChanged:(value){
                      print(value);
                    },
                    decoration:const InputDecoration(
                      labelText: "Birthday",
                      border: OutlineInputBorder(),
                    ),
                  ),
                          const SizedBox(
                    height: 40,
                  ),
                    TextFormField(
                    controller:phoneNumberController,
                    validator:(value) {
                      if(value!.isEmpty)
                      {
                        return "phone must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted:(value) {
                      print(value);
                    },
                    onChanged:(value){
                      print(value);
                    },
                    decoration:const InputDecoration(
                      labelText: "Phone_Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                          const SizedBox(
                    height: 40,
                  ),
                    TextFormField(
                    controller:cityController,
                    validator:(value) {
                      if(value!.isEmpty)
                      {
                        return "city must not be empty";
                      }
                      return null;
                    },
                   // keyboardType: TextInputType,
                    onFieldSubmitted:(value) {
                      print(value);
                    },
                    onChanged:(value){
                      print(value);
                    },
                    decoration:const InputDecoration(
                      labelText: "City",
                      border: OutlineInputBorder(),
                    ),
                  ),
                     const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    color:Colors.blue,
                    child: MaterialButton(onPressed: ()
                    async {
                      if(formkey.currentState!.validate())
                      {
                        print(emailController.text);
                        print(passwordController.text);

                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text, 
                          password: passwordController.text).then((value){
                            print(value.user?.email);
                            print(value.user?.uid);
                          });


                                   
                            final String name = nameController.text;
                            final int age = int.parse(ageController.text);
                            final String city = cityController.text;
                            final String birthday =(birthdayController.text);
                            final int phone = int.parse(phoneNumberController.text);
                            final String gender = genderController.text;
                           final String email =emailController.text;
            
                            final docUser = FirebaseFirestore.instance.collection( "users").doc(email);
                              
                            final user = UserModel(
                               name:name,
                               gender: gender,
                              age:age,
                              city:city,
                              birthday:birthday,
                              phone:phone,
                              email:email,
                              );
                              final json = user.toJson();
                            await docUser.set(json);
                      }
                    },
                    child:const Text("Register",style: TextStyle(color: Colors.white),
                      
                    )
                    ),
                  ),
                       const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You have an account?"),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushNamed("login");
                      }, child: const Text("Login")),

                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}