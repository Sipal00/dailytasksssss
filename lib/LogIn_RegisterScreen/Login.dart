import 'package:dailytasksssss/LogIn_RegisterScreen/SingUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final pass = TextEditingController();
  final email = TextEditingController();

  // late String _email, _password;

  // checkAuthentification() async {
  //   _auth.authStateChanges().listen((user) {
  //     if (user != null) {
  //       print(user);

  //       Navigator.pushReplacementNamed(context, "/");
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   this.checkAuthentification();
  // }

  // login() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();

  //     try {
  //       await _auth.signInWithEmailAndPassword(
  //           email: _email, password: _password);
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Image.asset("asset/images/6.png"),
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (input) {
                              if (input!.isEmpty) return 'Enter Email';
                            },
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email)),
                            // onSaved: (input) => _email = input!
                            controller: email,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            validator: (input) {
                              if (input!.length < 6)
                                return 'Provide Minimum 6 Character';
                            },
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            // onSaved: (input) => _password = input!
                            controller: pass,
                          ),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await _auth.signInWithEmailAndPassword(
                                  email: email.text, password: pass.text);

                              Navigator.pushReplacementNamed(
                                  context, '/Indexindex');
                            }
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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  child: const Text(
                    'Create an Account?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onTap: navigateToSignUp,
                )
              ],
            ),
          ),
        ));
  }
}

class forgetPassword extends StatelessWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
