import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/clothingProducts_screen.dart';
import 'package:hello_world/screens/developerTeam_screen.dart';
import 'package:hello_world/screens/electronicProducts/electronicDetails.dart';
import 'package:hello_world/screens/fruitProducts_screen.dart';
import 'package:hello_world/screens/homeLayout_screen.dart';
import 'package:hello_world/screens/login_screen.dart';
import 'package:hello_world/screens/into_screen.dart';
import 'package:hello_world/screens/powderProducts_screen.dart';
import 'package:hello_world/screens/products_screen.dart';
import 'package:hello_world/screens/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      
      ),
      home:const IntoScreen() ,
    // home:const ProductScreen(),
      routes: {
        "login":(context) => const LoginScreen(),
        "register":(context) =>const RegisterScreen(),
        "homelayout":(context) => HomeLayoutScreen(),
        "products":(context) =>const ProductScreen(),
        "electronicDetails":(context) =>const ElectronicDetails(),
        "fruits":(context) => const FruitScreen(),
        "closthes":(context) =>const ClothesScreen(),
        "powder":(context) => const WashingPowderScreen(),
        "team":(context) =>  DeveloperTeamScreen(),
      },
    );
  }
}
 
