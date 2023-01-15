// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp_with_otp/Screens/LogInPage.dart';
import 'package:newsapp_with_otp/view/home.dart';
import 'package:flutter/services.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/img/img3.jpg',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 53,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Color.fromARGB(255, 60, 4, 106),
                                width: 1.5)),
                        child: TextField(
                          onChanged: (value) {
                            code = value;
                            print(code);
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 60, 4, 106),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: MyPhone.varify,
                                smsCode: '720227');
                        print('the code is=$code');

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } catch (e) {
                        print('wrong otp');
                      }
                    },
                    child: Text("Verify Phone Number")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyPhone()));
                    },
                    child: Text(
                      "Edit Phone Number ?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: 250,
                child: Image.asset(
                  'assets/img/LOGO.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  const OtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '';
    return Container(
      height: 53,
      width: 53,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(color: Color.fromARGB(255, 60, 4, 106), width: 1.5)),
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            code = value;
            FocusScope.of(context).nextFocus();
          }
        },
        cursorColor: Colors.grey.shade100,
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
