import 'package:flutter/material.dart';
import 'package:flutter_all_in_one_ui/routclasses.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  bool changebutton=false;
  String name="";
  final _firstKey=GlobalKey<FormState>();

  gohome(BuildContext, context) async{
     if(_firstKey.currentState!.validate()) {
       setState(() {
         changebutton = true;
       });
       await Future.delayed(Duration(seconds: 1));
       await Navigator.pushNamed(context, MyRouts.homeRout);
       setState(() {
         changebutton = false;
       });
     }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _firstKey,
        child: Column(
          children: [
            Image.asset("assets/images/loingnor.png"),
            Text("Welcome $name",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 26),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 28),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username could not be empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name=value;
                        setState(() {
                        });
                      },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Passwrod",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password can't be empty";
                        }else if(value!.length<8){
                          return "password is should be more than 8 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30,),


                    InkWell(
                      onTap: () => gohome(BuildContext, context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height:  50,
                        width:changebutton?50: 110,
                        alignment: Alignment.center,
                        child: changebutton?Icon(Icons.done,color: Colors.white,):Text("Login",style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                          borderRadius: BorderRadius.circular(changebutton?50:8)
                        ),
                      ),
                    )
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
