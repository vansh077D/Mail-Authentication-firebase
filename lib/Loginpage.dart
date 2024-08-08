import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mailing_auth/forgot.dart';
import 'package:mailing_auth/signup.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  bool isloading = false;

  signin()async{
    setState(() {
      isloading = true;
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:email.text, password: password.text);
    }on FirebaseAuthException catch(e){
//exception realted to firebase
   Get.snackbar('error msg', e.code);
    }
    catch(e){
      // exception related to flutter
      Get.snackbar('error msg', e.toString());
    }
    setState(() {
      isloading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return isloading? Center(child: CircularProgressIndicator(),):

    Scaffold(

   appBar: AppBar(
     title:Text('Login Page' ,style: TextStyle(
       fontSize: 25,
       color: Colors.black,
       fontWeight: FontWeight.bold
     ),),
     backgroundColor: Colors.cyan,
   ),

    body:

    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset('assets/images/pic2.jpeg',height: 300,
                  fit: BoxFit.fitWidth,),

              ),

              SizedBox(height: 25,),
              TextField(

                controller: email,

                decoration:
                InputDecoration(prefixIcon: Icon(Icons.mail),

                    hintText: 'Enter email'),
              ),
              SizedBox(height: 18,),

              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: 'Enter password'),
              ),
              SizedBox(height: 14,),
              ElevatedButton(onPressed: (()=>signin()), child: Text('LOGIN',style: TextStyle(
                fontSize: 19
              ),),),
              SizedBox(height: 14,),
              Text('Dont have an have an account? click on register button below',style: TextStyle(
                fontSize: 12,
              ),),
              SizedBox(height: 14,),
              ElevatedButton(onPressed: (()=>Get.to(Signup())), child: Text('Register now',style: TextStyle(
                fontSize: 20,
              ),),),
              SizedBox(height: 17,),
              Text('Forget password?',style: TextStyle(
                fontSize: 14,
              ),),
              ElevatedButton(onPressed: (()=>Get.to(Forgot())), child: Text('Forgot password',style: TextStyle(
                fontSize: 19,
              ),),)

            ],
          ),
        ),
      ),
    )
    );
  }
}
