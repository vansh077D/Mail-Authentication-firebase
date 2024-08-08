import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mailing_auth/verifyemails.dart';

import 'Loginpage.dart';
import 'homepage.dart';

class wrapper extends StatefulWidget {
  const wrapper({super.key});

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            print('Snapshaot has data');
            if(snapshot.data!.emailVerified){
              return Homepage();
            }else {
              return verify();
            }
          }
          else{
            return  Loginpage();
          }
        }


      ),
    );
  }
}
