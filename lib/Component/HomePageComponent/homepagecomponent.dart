import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home/Component/LoginPageComponent/LoginComponent.dart';
import 'package:home/Services/FirebaseAuth.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? errorMessage = '';
  Future<void> logout() async{
    try{
      await FirebaseAut().signOut();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) => const Homepage(),
      //   ),
      // );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));

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
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Image(
                height: 300,
                width: double.infinity,
                image: AssetImage('assets/images/Welcome.png')),
          ),
          Container(

            child: const Center(
              child:  Text(
                'Welcome Home',
                style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          FlatButton(
            onPressed: (){
              logout();
            },
            child: Center(
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                      'Logout :(',
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
    );
  }
}
