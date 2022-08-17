import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/Component/EnterOtpPageComponent/EnterOtp.dart';
import 'package:home/Component/LoginPageComponent/LoginComponent.dart';
import 'package:home/Component/SignUpPageComponent/SignUpComponent.dart';
import 'package:home/Provider/MasterProvider.dart';
import 'package:home/Services/Validator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<ResetPassword> {

  late TextEditingController passwordController,confirmpasswordController;
  bool _isObscure = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
  }
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
                  image: AssetImage('assets/images/Resetpassword.png')),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child:  Text(
                'Reset \nPassword?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 300 ,
              width: 500,
              child: WebView(
                key: UniqueKey(),
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: masterProvider.getLink,
                  //initialUrl: 'https://my-new-project-470c1.firebaseapp.com/__/auth/action?mode=resetPassword&oobCode=o6MUC27auA7BII1u-vKeuM1nNNRKqy9B2dIVg3rqFV4AAAGCq2xBoA&apiKey=AIzaSyBuHDj9C968fu-7BogigMRNKe9ZfagRTCc&lang=en'
              ),

            ),

            // Container(
            //   margin: const EdgeInsets.only(left: 30),
            //   child: Row(
            //     children:  [
            //       const Padding(
            //         padding: EdgeInsets.only(top: 6),
            //         child: Icon(
            //           Icons.password,
            //           color: Colors.grey,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Expanded(
            //         child:  Padding(
            //           padding: const EdgeInsets.only(right: 20),
            //           child: TextFormField(
            //             obscureText: _isObscure,
            //             autovalidateMode: AutovalidateMode.onUserInteraction,
            //             validator: (value) {
            //               if (value != null) {
            //                 String error =
            //                 Validator.validatePassword(value, context);
            //                 return error == '' ? null : error;
            //               }
            //             },
            //             controller: passwordController,
            //             decoration: const InputDecoration(
            //               border: UnderlineInputBorder(),
            //               labelText: 'New password',
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 30),
            //   child: Row(
            //     children:  [
            //       const Padding(
            //         padding: EdgeInsets.only(top: 6),
            //         child: Icon(
            //           Icons.password,
            //           color: Colors.grey,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Expanded(
            //         child:  Padding(
            //           padding: const EdgeInsets.only(right: 20),
            //           child: TextFormField(
            //             obscureText: _isObscure,
            //             autovalidateMode: AutovalidateMode.onUserInteraction,
            //             validator: (value) {
            //               if (value != null) {
            //                 String error =
            //                 Validator.validateConfirmationPassword(value, passwordController.text,context);
            //                 return error == '' ? null : error;
            //               }
            //             },
            //             controller: confirmpasswordController,
            //             decoration: const InputDecoration(
            //               border: UnderlineInputBorder(),
            //               labelText: 'Confirm new password',
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 12.0,
            ),

            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LogIn()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
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
                        Icons.login,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Go To Login',
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
