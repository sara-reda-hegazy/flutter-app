import 'package:flutter/material.dart';

class IntoScreen extends StatelessWidget {
  const IntoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const SizedBox(),
              Image.asset("images/welcome.jpg"),
               SizedBox(
                height: 60,
                width: double.infinity,
                 child: MaterialButton(
                  onPressed: (){
                   Navigator.of(context).pushNamed("login");
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.lightBlue,
                  child:const Text("Get Started",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),
                  ),
                  ),
               )
            ],
          ),
        ),
      ) ,
    );
  }
}