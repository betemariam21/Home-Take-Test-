import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home/Component/ResetPasswordPageComponent/ResetPassword.dart';
import 'package:home/Component/SignUpPageComponent/SignUpComponent.dart';
import 'package:home/Provider/MasterProvider.dart';
import 'package:home/Services/Validator.dart';
import 'package:provider/provider.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<EnterOtp> {
  TextEditingController otpController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    MasterProvider masterProvider = Provider.of<MasterProvider>(context, listen: false);
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
                  image: AssetImage('assets/images/EnterOTP.png')),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text(
                'Enter Reset Link',
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
                child: const Text('A reset email have been sent to your email (please check your spam folder)',style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12
                ),
                )

            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.confirmation_num,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null) {
                            String error =
                            Validator.validatePassword(value, context,isOtp: true);
                            return error == '' ? null : error;
                          }
                        },
                        controller: otpController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter the link here',
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
                  if(otpController != ''){
                    masterProvider.setLink = otpController.text.trim();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                  }
                  else{
                    Fluttertoast.showToast(msg: 'Please enter the link send to you in your email');
                  }

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
                        Icons.confirmation_num,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Confirm',
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
