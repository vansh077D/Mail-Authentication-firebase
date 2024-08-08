import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailing_auth/wrapper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController name=TextEditingController();

  signup()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:email.text,
        password: password.text);
    Get.offAll(wrapper());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title:Text('Signup'),
          backgroundColor: Colors.deepOrange,
        ),

        body:

        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset('assets/images/pic1.jpeg',height: 300,
                    fit: BoxFit.fitWidth,
                  ),
                ),

                SizedBox(height: 25,),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter your name'),
                ),
                SizedBox(height: 18,),

                TextField(
                  controller: email,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.mail),
                      hintText: 'Enter email'),
                ),
                SizedBox(height: 18,),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_sharp),
                      hintText: 'Enter password'),
                ),
                SizedBox(height: 30,),


                ElevatedButton(onPressed: (()=>signup()), child: Text('Signup',style: TextStyle(
                  fontSize: 23,
                ),),)
              ],
            ),
          ),
        )
    );
  }
}
