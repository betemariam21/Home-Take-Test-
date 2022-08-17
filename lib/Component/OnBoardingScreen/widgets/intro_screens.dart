import 'package:flutter/material.dart';

class IntroScreen_1 extends StatelessWidget {
  const IntroScreen_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                width: 200,
                height: 200,
                image: AssetImage('assets/images/Signup_2.png')),
            SizedBox(height: 10,),
            Center(
              child: Text(
                'You can sign up to our app',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'QuickSand',
                fontSize: 18,

              ),
              ),
            ),
          ],
        ),

    );
  }
}
class IntroScreen_2 extends StatelessWidget {
  const IntroScreen_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
              width: 300,
              height: 200,
              image: AssetImage('assets/images/LogIn.png')),
          SizedBox(height: 10,),
          Center(
            child: Text(
              'You can login to our app ',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'QuickSand',
              fontSize: 18,

            ),
            ),
          ),
        ],
      ),

    );
  }
}
class IntroScreen_3 extends StatelessWidget {
  const IntroScreen_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          Image(
              width: 200,
              height: 200,
              image: AssetImage('assets/images/Resetpassword.png')),

          SizedBox(height: 10,),
          Center(
            child: Text(
              'You can reset your password',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'QuickSand',
              fontSize: 18,
            ),
            ),
          ),
        ],
      ),

    );
  }
}


