// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, body_might_complete_normally_nullable, unused_import, empty_catches, unused_local_variable, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/app_colors.dart';
import 'package:food_delivery_app/Screens/home_screen.dart';
import 'package:food_delivery_app/Screens/register_screen.dart';
import 'package:food_delivery_app/Screens/reset_password_screen.dart';
import 'package:food_delivery_app/Widgets/create_account_icons.dart';
import 'package:food_delivery_app/Widgets/custom_has_account.dart';
import 'package:food_delivery_app/Widgets/custom_text_field.dart';
import 'package:food_delivery_app/Widgets/custon_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Widgets/snack_bar_error.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static String id = "login screen"; 

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false; 
  String? emial; 
  String? password; 
  bool showPassword = true;
  IconData passwordIcon = Icons.visibility;
  final RegExp  emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      // .hasMatch(email); 
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
                          Text("Sign In With", style: TextStyle(fontSize: 20, color: KPrimaryColor),), 
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
                    )
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
                          Text("Logn In", style: TextStyle(
                                fontSize: 50, 
                                fontWeight: FontWeight.bold, 
                                fontFamily: "mainFonts",  
                              ),
                            ), 
                          SizedBox(height: 45,), 
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
                            
                            onPressed: (){
                              showPassword = !showPassword;
                              setState(() {
                                
                              });
                            },
                            suficIcon: showPassword == false? Icons.visibility:Icons.visibility_off, 
                            onSave: (data) {
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
                            isPassword: showPassword,
                            textInputType: TextInputType.visiblePassword,
                            
                          ), 
                          SizedBox(height: 10.0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(  
                              children: [
                                Expanded(child: SizedBox.shrink()), 
                                TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, ResetPassword.id);     
                                  }, 
                                  child: Text("Forgot Password", style: TextStyle(fontSize: 19.0, color: KPrimaryColor, letterSpacing: 0.8),)
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0,), 
                          CustomButtom(
                            height: 45, 
                            width: double.infinity,
                            onTap: () async{ 
                              if(formKey.currentState!.validate()){
                                
                                setState(() {
                                  isLoading = true;
                                });
                                try{ 
                                    
                                    UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: emial!,
                                    password: password!,
                                    );
                                  showSnakBarError(context, "login Suxssfully...");
                                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                                }on FirebaseAuthException catch (err){
                                   if(err.code == 'user-not-found'){
                                      showSnakBarError(context, 'No user found for that email.');
                                   }else if(err.code == 'wrong-password'){
                                      showSnakBarError(context, "Wrong password provided for that user.");
                                   }
                                }
                                catch(err) {
                                    showSnakBarError(context, "there was an error.");
                                } 
                                setState(() {
                                    isLoading = false;
                                });  
                              } 
                              if(!mounted){
                                  Navigator.pop(context);
                                } 
                            },
                            
                            text: "Login",
                          ),
                          SizedBox(height: 45,), 
                          HasAccount(
                            text: "Do'nt have an account? ",
                            navigatePage: RigisterScreen.id,
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