// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSiginServices {
  signWithGoogle() async{
    // interactive sign procsess. 
    final GoogleSignInAccount? siginUser = await GoogleSignIn().signIn(); 

    // obtian auth detials
    final GoogleSignInAuthentication userAuth = await siginUser!.authentication; 

    // create a new crdintial
      final credential = GoogleAuthProvider.credential(
        accessToken: userAuth.accessToken, 
        idToken: userAuth.idToken
      );
      // finally, let user sing. 
      return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}