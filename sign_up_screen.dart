import 'package:assignment/data_base.dart';
import 'package:assignment/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colortemplate.dart';


class SignUpBody extends StatefulWidget {
  SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String _selectedValue = "0";
  late String drop = '0';
  final DataBase _db = DataBase();

  final TextEditingController studentIdController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool successfully=false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView( // Wrap the Scaffold with SingleChildScrollView
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.1),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mediaQuery.size.height * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:50),
                      child: SizedBox(
                        height: mediaQuery.size.height * 0.04,
                        child: const Text('Sign up',
                            style: TextStyle(fontSize: 25, color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.04,
                    ),
                    CustomTextField(
                      controller: nameController,
                      labelText: 'Name',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your name';
                        } else if (RegExp(r"\s").hasMatch(nameController.text)) {
                          return 'Spaces are not allowed';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02,
                    ),
                    CustomTextField(
                      controller: studentIdController,
                      labelText: 'ID',
                      keyboardType: TextInputType.number,
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
                      controller: emailController,
                      labelText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your Email';
                        } else if (!(value.contains("@stud.fci-cu.edu.eg"))) {
                          return 'Email format should be (Ex. user@stud.fci-cu.edu.eg)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Select Level'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: const Text('1'),
                                    onTap: () {
                                      setState(() {
                                        drop = '1';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('2'),
                                    onTap: () {
                                      setState(() {
                                        drop = '2';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('3'),
                                    onTap: () {
                                      setState(() {
                                        drop = '3';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('4'),
                                    onTap: () {
                                      setState(() {
                                        drop = '4';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: mediaQuery.size.height * 0.054,
                        width: mediaQuery.size.width * 0.74,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 17.0),
                              child: Text(
                                "Level",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: kTextColorPurple, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:20.0),
                              child: Text(
                                drop,
                                style: const TextStyle(color: kTextColorBlack, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                        } else if (value.length < 8) {
                          return "Password should be at least 8 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02,
                    ),
                    CustomTextField(
                      controller: confirmPasswordController,
                      isObscureText: true,
                      labelText: "Confirm Password",
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Confirm  Password';
                        } else if (value.length < 8) {
                          return "Password should be at least 8 characters";
                        } else if (confirmPasswordController.text !=
                            passwordController.text) {
                          return "Your password does not match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Gender",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: kTextColorBlack, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.01,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                  value: 'Male',
                                  groupValue: _selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value!;
                                    });
                                  },
                                ),
                                const Text("Male",
                                    style: TextStyle(color: kTextColorBlack, fontSize: 15)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                  value: 'Female',
                                  groupValue: _selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValue = value!;
                                    });
                                  },
                                ),
                                const Text("Female",
                                    style: TextStyle(color: kTextColorBlack, fontSize: 15)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.02,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondColor,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                      ),
                      onPressed: () async {
                        await signUp(context);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 18, color: kTextColorWhite),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Already have an account? ',
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
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Login',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 15,
                                color: kTextColorPurple,
                                decoration: TextDecoration.underline,
                                decorationColor: kTextColorPurple,
                              )
                          )
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await _db.getID(id: studentIdController.text) == false) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: kSecondColor,
            content: Text("ID already exists",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: kTextColorWhite,
                ))));
      } else {
        _db.insertToDatabase(
            name: nameController.text,
            id: studentIdController.text,
            email: emailController.text,
            level: drop,
            gender: _selectedValue,
            password: passwordController.text,
            img:
                '/data/user/0/com.example.assignment/cache/15921847-6127-4e7c-9d6d-21149cd378ea/images.jpg');
      }
    }
  }
}
