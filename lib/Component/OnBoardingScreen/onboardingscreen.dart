
import 'package:flutter/material.dart';
import 'package:home/Component/LoginPageComponent/LoginComponent.dart';
import 'package:home/Component/OnBoardingScreen/widgets/intro_screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          controller: _controller,
          children: [IntroScreen_1(), IntroScreen_2(), IntroScreen_3()],
        ),
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text('Skip',style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),)),
              SmoothPageIndicator(
                  effect: SlideEffect(
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      dotColor: Colors.white,
                      activeDotColor: Colors.black),
                  controller: _controller,
                  count: 3),
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text('Done',style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),))
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text('Next',style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),))
            ],
          ),
        )
      ],
    ));
  }
}
