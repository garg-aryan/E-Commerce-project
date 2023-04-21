import 'package:flutter/material.dart';
import 'package:flutter_all_in_one_ui/homepage%20work/cartpage.dart';
import 'package:flutter_all_in_one_ui/homepage.dart';
import 'package:flutter_all_in_one_ui/loginpage.dart';
import 'package:flutter_all_in_one_ui/routclasses.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
       "/":(context)=>HomePage(),
        MyRouts.homeRout:(context)=>HomePage(),
        MyRouts.loginRout:(context)=>LoginPage(),
        MyRouts.cartRout:(context)=>CartPage(),
      },
    );
  }
}
