import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    bool visible=true;

   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

    var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:   SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  SizedBox(height: 30,),

                const  Text("Login",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),
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
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    color:Colors.blue,
                    child: MaterialButton(onPressed: ()
                    {
                      if(formkey.currentState!.validate())
                      {
                        print(emailController.text);
                        print(passwordController.text);

                          FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text, 
                          password: passwordController.text).then((value){
                            print(value.user?.email);
                            print(value.user?.uid);
                          });

                           Navigator.of(context).pushNamed("homelayout");

                        // APIProvider().signInEmail(
                        //   email: emailController.text,
                        //    password: passwordController.text);
                      }
                    },
                    child:const Text("Login",style: TextStyle(color: Colors.white),
                      
                    )
                    ),
                  ),
                       const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(onPressed: (){
                         Navigator.of(context).pushNamed("register");
                      }, child: const Text("Register")),

                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
         
   