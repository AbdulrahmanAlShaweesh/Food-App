

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, body_might_complete_normally_nullable, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/login_screen.dart';
import 'package:food_delivery_app/Widgets/create_account_icons.dart';
import 'package:food_delivery_app/Widgets/custom_has_account.dart';
import 'package:food_delivery_app/Widgets/custom_text_field.dart';
import 'package:food_delivery_app/Widgets/custon_button.dart';
import 'package:food_delivery_app/Widgets/snack_bar_error.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Constants/app_colors.dart';

class RigisterScreen extends StatefulWidget {
  RigisterScreen({super.key});
  static String id = "SignUp Screen"; 

  @override
  State<RigisterScreen> createState() => _RigisterScreenState();
}

class _RigisterScreenState extends State<RigisterScreen> {
    
    String? userName;
    String? emial; 
    String? password; 
    GlobalKey<FormState> formKey = GlobalKey();
    bool isLoading = false; 
    bool _showPassword = true;  
    final RegExp  emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
 
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                ListView(  
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 470),
                      height: 155, 
                      color: KPrimaryColor,
                    ), 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(  
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 135,
                            child: Divider(
                              color: Colors.grey, 
                              thickness: 1.5, 
                              endIndent: 5, 
                            ),
                          ), 
                          Text("Sign Up With", style: TextStyle(fontSize: 20, color: KPrimaryColor),), 
                          Expanded(
                            child: SizedBox(
                              child: Divider(
                                indent: 5,
                                color: Colors.grey, 
                                thickness: 1.5,
                              ),
                            ),
                          ), 
                        ],
                      ),
                    ), 
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CreateAccountsIcon(),
                    ),
                  ],
                ),
                Positioned(
                  top: 120,
                  left: 15, 
                  right: 15,
                  child: Container(
                    height: 500, 
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [  
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.3), 
                          offset: Offset(0, 3), 
                          blurRadius: 10
                        ), 
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(  
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign Up", style: TextStyle(
                                fontSize: 50, 
                                fontWeight: FontWeight.bold, 
                                fontFamily: "mainFonts",  
                              ),
                            ), 
                          SizedBox(height: 20,), 
                          CustomTextField(
                            onSave: (data) {
                              userName = data;
                            }, 
                            validator: (data) {
                                if(data!.isEmpty){ 
                                  return "field is required";
                                }
                                else if(data.contains(emailValid) || data.contains(RegExp(r'[0-9]')) || data.contains(RegExp(r"[!!~#@$%^&*(){}+_,.?/]"))){
                                  return "only a charcherters required";
                                }
                                 
                              }, 
                            text: "Enter Username", 
                            icons: Icons.person, 
                            isPassword: false,
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 25,),  
                          CustomTextField(
                            onSave: (data) {
                              emial = data;
                            },
                            validator: (data) {
                                if(data!.isEmpty){ 
                                return "field is required";
                              }
                              if (!data.contains(emailValid)) {
                                return "inalid emmial address";
                              }
                              },  
                            text: "Enter Your Emial", 
                            icons: Icons.email, 
                            isPassword: false,
                            textInputType: TextInputType.text,
                          ), 
                          SizedBox(height: 25,), 
                          CustomTextField(

                            onSave: (data){
                              password = data;
                            },  
                            validator: (data) {
                                if(data!.isEmpty) {
                                  return "field is required"; 
                                }
                                else if(data.length < 8) {
                                  
                                  return "enter at least 8 charcheters";
                                }
                                if(!data.contains(RegExp(r"[0-9]") ) ) {
                                  
                                  return "enter at least one number";
                                }
                                else if(!data.contains(RegExp('[A-Z]'))){
                                  return "enter at least one upper charcheters";
                                }
                                else if(!data.contains(RegExp('[a-z]'))){
                                  return "enter at least one lower charcheters";
                                }
                                else if(!data.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))){
                                  return "enter at least one special charcheters";
                                }
                              }, 
                            text: "Enter Your Password", 
                            icons: Icons.lock, 
                            isPassword: _showPassword,
                            suficIcon: _showPassword == false? Icons.visibility:Icons.visibility_off, 
                            textInputType: TextInputType.emailAddress,
                             onPressed: (){
                                _showPassword = !_showPassword;
                                setState(() {
                                  
                                });
                            },
                          ), 
                          SizedBox(height: 25,), 
                          CustomButtom(
                            height: 45,
                            width: double.infinity,
                            onTap: () async{
                              if(formKey.currentState!.validate()){
                                isLoading = true;
                                try{ 
                                  UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: emial!,
                                    password: password!,
                                  );
                                  showSnakBarError(context, "Created Sucssfully");
                                  Navigator.pop(context); 
                                }on FirebaseAuthException catch(err) {
                                  if (err.code == 'weak-password') {
                                     showSnakBarError(context, "week Password");
                                  } else if (err.code == 'email-already-in-use') {
                                    showSnakBarError(context, "email already-in exit");
                                  }
                                }catch(err) {
                                  showSnakBarError(context, "there was an error");
                                  print(err);
                                }
                                isLoading =false; 
                              }
                              
                            },
                            text: "Register",
                          ),
                          SizedBox(height: 40,), 
                          HasAccount(
                            text: "Aleady have an account? ",
                            navigatePage: LoginScreen.id,
                          )
                        ],
                      ),
                    ),
                  ),
                ), 
              ],
            ),
          ),
        ),
      )
    );
  }
  
}

