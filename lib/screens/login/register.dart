import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screens/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String gender = "Male";
  int id = 1;
  TextEditingController _dateInput = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('images/login3d.png'), fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
              title: Text("Registration Screen"),
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          // height: MediaQuery.of(context).size.width / 3,
                          child: Center(
                              child: TextField(
                        controller: _dateInput,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Date of Birth',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  1950), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              _dateInput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(DateTime.now());
                            setState(() {
                              _dateInput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          }
                        },
                      ))),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: id,
                                onChanged: (val) {
                                  setState(() {
                                    id = 1;
                                    gender = "Male";
                                  });
                                },
                              ),
                              Text(
                                'Male',
                                style: new TextStyle(fontSize: 17.0),
                              ),
                              Radio(
                                value: 2,
                                groupValue: id,
                                onChanged: (val) {
                                  setState(() {
                                    id = 2;
                                    gender = "Female";
                                  });
                                },
                              ),
                              Text(
                                'Female',
                                style: new TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {
                            print(_firstNameController.text);
                            print(_lastNameController.text);
                            print(_dateInput);
                            print(gender);

                            submit();
                          },
                          child: Text(
                            "Continue",
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColor.deepOsrange)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> submit() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('userData');

    return users
        .add({
          'first_name': _firstNameController.text,
          'last_name': _lastNameController.text,
          'dob': _dateInput.text,
          'gender': gender
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
