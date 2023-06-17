// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable, empty_catches, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';
import 'package:food_delivery_app/Screens/login_screen.dart';
import 'package:food_delivery_app/Widgets/custom_text_field.dart';
import 'package:food_delivery_app/Widgets/custon_button.dart';
import 'package:food_delivery_app/Widgets/snack_bar_error.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  static String id = "reset password"; 

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> formKey = GlobalKey(); 
  String? emial; 
  final RegExp  emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: KPrimaryColor, 
        elevation: 0.0,
         title: Text("Reset Your Password", style: TextStyle(fontSize: 20.0),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form( 
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                 CustomTextField(
                    icons: Icons.email, 
                    isPassword: false, 
                    onSave: (data) {
                      emial = data; 
                    },
                    text: "enter your emial.", 
                    textInputType: TextInputType.emailAddress, 
                    validator: (data) {
                         if(data!.isEmpty){ 
                            return "field is required";
                         }
                         else if (!data.contains(emailValid)) {
                            return "inalid emial address";
                         }
                    },
                  
                 ), 
                 SizedBox(height: 25.0,), 
                 CustomButtom(
                  height: 45, 
                  width: 200,  
                  text: "Reset Password", 
                  onTap: (){
                    if(formKey.currentState!.validate()) {
                      CircularProgressIndicator();
                       confirm();
                    }
                  },
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  confirm() {
      showDialog(
    
    context: context, 
    builder: (context) {
        return AlertDialog(
        shape: RoundedRectangleBorder(  
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text("Confirm"),
        content: Text("Password reset confirmation .", style: TextStyle(fontSize: 18.0),),
        actions: [
              TextButton(onPressed: (){
                  Navigator.pop(context);
              }, 
              child: Text("Cancel", style: TextStyle(fontSize: 19.0),),
              ), 
              TextButton(onPressed: (){
                  resetPassword();
              }, 
              child: Text("confirm", style: TextStyle(fontSize: 19.0),), 
            ),
        ],
            );
    });
    
  }
  resetPassword() async{
     
     showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      }
     );
     try{ 
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emial!
        );
        showSnakBarError(context, "verify your emial address");
        Navigator.pushNamed(context, LoginScreen.id);
     }
      on FirebaseAuthException catch (err) {
        showSnakBarError(context, "error $err"); 
        
        Navigator.pop(context);
      
      }
      // if(!mounted) {
      //   Navigator.pop(context);
      // }
  }
}