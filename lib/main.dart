
// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/catigory_Screen.dart';
import 'package:food_delivery_app/Screens/chat_screen.dart';
import 'package:food_delivery_app/Screens/checkout_screen.dart';
import 'package:food_delivery_app/Screens/home_screen.dart';
import 'package:food_delivery_app/Screens/login_screen.dart';
import 'package:food_delivery_app/Screens/profile_screen.dart';
import 'package:food_delivery_app/Screens/register_screen.dart';
import 'package:food_delivery_app/Screens/reset_password_screen.dart';
import 'package:food_delivery_app/Screens/verfity_emial_screen.dart';
import 'package:food_delivery_app/Services/cart.dart';
import 'package:food_delivery_app/Widgets/snack_bar_error.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    FoodDeleveryAndOrderApp()
  );
}

class FoodDeleveryAndOrderApp extends StatelessWidget {
  const FoodDeleveryAndOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( 
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          routes: {
            LoginScreen.id: (context) => LoginScreen(),
            RigisterScreen.id: (context) => RigisterScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            ChatWithUsScreen.id: (context) => ChatWithUsScreen(),
            CatigoryScreen.id: (context) => CatigoryScreen(),
            CheckOutScreen.id: (context) => CheckOutScreen(),
            ResetPassword.id : (context) => ResetPassword(),
          },
          // to keep user loged in after leaving the app without loging out
          home: StreamBuilder(  
             stream: FirebaseAuth.instance.authStateChanges(),
             builder: (context, snapShot){
                if(snapShot.connectionState == ConnectionState.waiting) { // 
                  return Center(child: CircularProgressIndicator());
                }
                else if(snapShot.hasError){
                  return showSnakBarError(context, "something went wrong");
                }
                else if(snapShot.hasData){
                  return EmailVerificationScreen();
                }
                else { 
                  return LoginScreen();
                }
             }, 
            
          ),
      ),
    );
  }
}