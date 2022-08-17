import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home/Component/EnterOtpPageComponent/EnterOtp.dart';
import 'package:home/Component/SignUpPageComponent/SignUpComponent.dart';
import 'package:home/Services/Validator.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _forgetPasswordForm() async{

    try
    {
    await _auth.sendPasswordResetEmail(email: emailController.text.trim());
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> EnterOtp()));
    Fluttertoast.showToast(msg: 'We have a recovery email to your account please go and copy that',backgroundColor: Colors.blue);


    } catch(error){
      Fluttertoast.showToast(msg: error.toString(),backgroundColor: Colors.blue);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Image(
                  height: 300,
                  width: double.infinity,
                  image: AssetImage('assets/images/Forgotpassword.png')),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text(
                'Forgot \nPassword?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 20),
                child: const Text('Don\'t worry! it happens. Please enter the address associated with your account ',style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12
                ),
                )

            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.alternate_email,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child:  Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        validator: (value) {
                          if (value != null) {
                            String error =
                            Validator.validateEmail(value, context);
                            return error == '' ? null : error;
                          }
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email id',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),

            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: FlatButton(
                onPressed: (){
                  _forgetPasswordForm();
                },
                child: Container(
                  width: 250,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 5,
                            color: Colors.black26)
                      ],
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
