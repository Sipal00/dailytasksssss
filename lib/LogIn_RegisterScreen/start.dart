import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Start extends StatelessWidget {
    final FirebaseAuth _auth = FirebaseAuth.instance;

 Future<UserCredential> googleSignIn(context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser = await googleSignIn.signIn();
   if (googleUser != null) {
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

   if (googleAuth.idToken != null && googleAuth.accessToken != null) {
       final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

      await Navigator.pushReplacementNamed(context, "/");

       return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
     throw StateError('Sign in Aborted');
 }

  // navigateToLogin() async {
  //   Navigator.pushReplacementNamed(context, "/Login");
  // }

  // navigateToRegister() async {
  //   Navigator.pushReplacementNamed(context, "/SignUp");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50.0),
            Container(
              height: 400,
              width: double.infinity,
              child: Image.asset("asset/images/8.png"),
            ),
            const SizedBox(height: 30),
            RichText(
                text: const TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: ' Daily Tasks',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange))
                ])),
            const SizedBox(height: 15.0),
            const Text(
              'Manage your all daily task today with simple!',
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Login');
                  },
                  child: const Text('LOGIN'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15),
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/SignUp');
                  },
                  child: const Text('SIGNUP'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: const Size(150, 50),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            SignInButton(Buttons.Google,
                text: "Sign up with Google", onPressed: ()=> googleSignIn(context))
          ],
        ),
      ),
    );
  }
}
