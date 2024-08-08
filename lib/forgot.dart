import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailing_auth/wrapper.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  TextEditingController email=TextEditingController();


  reset()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(
        email:email.text,);
    Get.offAll(wrapper());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('Forgot password'),
          backgroundColor: Colors.pinkAccent,
        ),

        body:

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Enter email'),
                ),
                SizedBox(height: 25,),

                ElevatedButton(onPressed: (()=>reset()), child: Text('sent',style: TextStyle(
                  fontSize: 23,
                ),),)
              ],
            ),
          ),
        )
    );
  }
}
