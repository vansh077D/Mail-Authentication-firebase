import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailing_auth/wrapper.dart';

class verify extends StatefulWidget {
  const verify({super.key});

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {

  @override
  void initState() {
    // TODO: implement initState
    sendverifylink();
    super.initState();
  }

  sendverifylink()async{
    final user=FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value)=>{
  Get.snackbar('Link sent','A link has been sent to your email check', margin: EdgeInsets.all(30),snackPosition: SnackPosition.BOTTOM)
    });
  }
reload ()async{
    await FirebaseAuth.instance.currentUser!.reload().then((value)=>{
      Get.offAll(wrapper())
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
      ),
      body: Center(
        child:
        Text('Open your email and click on link & then verify it  ',style:
        TextStyle(
          color: Colors.purple,
          fontSize: 20,
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=>reload()),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
