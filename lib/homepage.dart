import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final user=FirebaseAuth.instance.currentUser;  // for taking data of user

  signout()async{
    await FirebaseAuth.instance.signOut();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
   body: Center(
    child:
    Text('${user!.email}',style:
      TextStyle(
        color: Colors.purple,
        fontSize: 20,
      ),),
   ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=>signout()),
      child: Icon(Icons.login_rounded),
      ),


    );
  }
}
