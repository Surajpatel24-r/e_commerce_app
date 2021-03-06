import 'package:e_commerce_app/screens/collections.dart';
import 'package:e_commerce_app/screens/login/login.dart';
import 'package:e_commerce_app/constants/constant.dart';
import 'package:e_commerce_app/screens/login/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('images/login3d.png'), fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
              title: Text("SignUp Screen"),
              backgroundColor: AppColor.deepOsrange,
              shadowColor: AppColor.deepOsrange),
          body: Stack(
            children: [
              Container(
                  // padding: const EdgeInsets.only(left: 35, top: 130),
                  // child: const Text('Welcome\nBack',
                  //     style: TextStyle(color: Colors.red, fontSize: 33)),
                  ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(35),
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       fillColor: Colors.grey.shade100,
                      //       filled: true,
                      //       hintText: 'Enter Name',
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10))),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       fillColor: Colors.grey.shade100,
                      //       filled: true,
                      //       hintText: 'Enter Phone Number',
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(10))),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Enter Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Enter Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {
                            signUp();
                          },
                          child: Text(
                            "Sign Up",
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColor.deepOsrange)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          const Text('Does you have account?'),
                          TextButton(
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     const Text('Register yourself'),
                      //     TextButton(
                      //       child: const Text(
                      //         'Register',
                      //         style: TextStyle(fontSize: 15),
                      //       ),
                      //       onPressed: () {
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => RegisterScreen(),
                      //             ));
                      //       },
                      //     )
                      //   ],
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      var userCredential = credential.user;
      if (userCredential!.uid.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            ));
      } else {
        Fluttertoast.showToast(msg: "Somthing Went Wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
