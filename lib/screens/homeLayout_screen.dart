import 'package:flutter/material.dart';
import 'package:hello_world/screens/category_screen.dart';
import 'package:hello_world/screens/home_screen.dart';
import 'package:hello_world/screens/personal_screen.dart';

class HomeLayoutScreen extends StatefulWidget {
  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  int currenIndex =0;
  List<Widget>screens=[
    const HomeScreen(),
    const PersonalScreen(),
    const CategoryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currenIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
           currentIndex: currenIndex,
           onTap: (value) {
             print(value);
             setState(() {
               currenIndex=value;
             });
           },
          items:const [
           BottomNavigationBarItem(icon: Icon(Icons.home),
           label: "Home"
           ),
            BottomNavigationBarItem(icon: Icon(Icons.account_box),
            label: "Account",
            ),
             BottomNavigationBarItem(icon: Icon(Icons.category_outlined),
             label: "category"
             ),
          ],
        ),
    );
  }
}