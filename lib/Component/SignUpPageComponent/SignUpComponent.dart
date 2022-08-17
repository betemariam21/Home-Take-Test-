import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/Component/HomePageComponent/homepagecomponent.dart';
import 'package:home/Component/LoginPageComponent/LoginComponent.dart';
import 'package:home/Services/FirebaseAuth.dart';
import 'package:home/Services/Validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? errorMessage = '';
  bool _isObscure = true;
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async{
    try{
      isLoading = true;
      await FirebaseAut().createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));

    } on FirebaseAuthException catch (e){
      setState(() {
        errorMessage = e.message;
        Fluttertoast.showToast(
            msg: "$errorMessage",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        isLoading = false;
      });
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
                  image: AssetImage('assets/images/Signup_2.png')),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
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
                    child: Padding(
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
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child:  Icon(
                      Icons.person,
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
                            Validator.validateName(value, context);
                            return error == '' ? null : error;
                          }
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Full name',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children:  [
                 const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child:  Icon(
                      Icons.phone,
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
                            Validator.validatePhone(value, context);
                            return error == '' ? null : error;
                          }
                        },
                        controller: phoneController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Phone',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextFormField(
                        obscureText: _isObscure,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null) {
                            String error =
                            Validator.validatePassword(value, context);
                            return error == '' ? null : error;
                          }
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          border: UnderlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(

              height: 15.0,
            ),
            Container(
                margin: const EdgeInsets.only(left: 30, right: 20),
                child: RichText(
                  text: const TextSpan(
                    text: 'By signing up you\'re agreeing to our',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                     ),
                    children: [
                      TextSpan(
                          text: ' our Terms & Conditions and Privacy Rules ', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                    ]

                  ),
                ),

                // child: const Text('By signing up you\'re agreeing to our Terms & Conditions and Privacy Rules',style: TextStyle(
                //   color: Colors.grey,
                //   fontSize: 12
                // ),
                // )
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: FlatButton(
                onPressed: (){
                  // isLoading = true;
                  createUserWithEmailAndPassword();
                },
                child: isLoading ? Container(
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
                      SizedBox(width: 30, height: 30, child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Signing You In...',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ) : Container(

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
                        Icons.check,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Continue',
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
                    margin: const EdgeInsets.only(left: 30, right: 20),
                    child: RichText(
                      text: const TextSpan(
                          text: 'Joined us before? ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                          ),
                          children: [
                            TextSpan(
                                text: 'Login ', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                          ]

                      ),
                    ),

                    // child: const Text('By signing up you\'re agreeing to our Terms & Conditions and Privacy Rules',style: TextStyle(
                    //   color: Colors.grey,
                    //   fontSize: 12
                    // ),
                    // )
                  ),
                ),

            ),
          ],
        ),
      ),
    );
  }
}
