import 'package:assignment/data_base.dart';
import 'package:assignment/profile_screen.dart';
import 'package:assignment/sign_up_page.dart';
import 'package:assignment/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'colortemplate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login_page';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final DataBase _db = DataBase();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: mediaQuery.size.height * 0.05,
                    ),
                    child: const Text('Login',
                        style: TextStyle(fontSize: 30, color: Colors.black)),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: mediaQuery.size.height * 0.03,
                      ),
                      CustomTextField(
                        controller: idController,
                        labelText: 'ID',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your ID';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.02,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        isObscureText: true,
                        labelText: "Password",
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your Password';
                          } else if (value.length < 4 || value.length > 20) {
                            return "Password should be from 3 to 20 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kSecondColor,
                            minimumSize: const Size(200, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Login',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 20,
                                color: kTextColorWhite,
                              ),
                              textAlign: TextAlign.center
                            ),
                          onPressed: () async {
                            await login(context);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Don’t have an account?',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 15,
                                color: Colors.black,
                                // decoration: TextDecoration.underline
                              )),
                          TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()),
                                );
                              },
                              child: const Text('Sign Up',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 15,
                                    color: kTextColorPurple,
                                    decoration: TextDecoration.underline,
                                    decorationColor: kTextColorPurple,
                                  )))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      dynamic result = await _db.login(
          id: idController.text, password: passwordController.text);

      if (result[0]) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: kSecondColor,
            content: Text("Logged in successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: kTextColorWhite,
                ))));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileScreen(data: result[1])),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: kSecondColor,
            content: Text(
              "Check your ID or password and try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: kTextColorWhite,
              ),
            ),
          ),
        );
      }
    }
  }

  Future<void> compareInputToFields() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'key',
      appId: 'id',
      messagingSenderId: 'sendid',
      projectId: 'myapp',
      storageBucket: 'myapp-b9yt18.appspot.com',
    ));
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var docSnapshot;
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('Students').doc().get();
          var data = docSnapshot.data();
      String id = documentSnapshot.get('ID');
      String password = documentSnapshot.get('Password');
      if (idController.text == id && passwordController.text == password) {
        print('Inputs matches');
      } else {
        print('Input does not match the field value.');
      }
    } catch (e) {
      print('Error comparing input to fields: $e');
    }
  }
}

