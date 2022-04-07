import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index){
              if( index == 3){
                setState(() {
                  isLastPage = true;
                });
              }else{
                setState(() {
                  isLastPage=false;
                });
              }
            },
            controller: controller,
            children: [
              Components(image: 'assets/onboard1.png',
                component: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/onboard_logo.png', scale: 1.5,),
                      Text('Welcome to SelfieSplash!', style: GoogleFonts.varelaRound(fontSize: 28, fontWeight: FontWeight.w500,
                          color: Colors.white),),
                      SizedBox(height: 25,),
                      Text('Tell your story with selfies!', style: GoogleFonts.varelaRound(fontSize: 22, fontWeight: FontWeight.w400,
                      color: Colors.white),),

                    ],
                  ),
                ),
              ),
              Components(image: 'assets/onboard2.png',
                component: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/admires.png', scale: 1,),
                    SizedBox(height: 25,),
                    Text('Selfie of the Week', style: GoogleFonts.varelaRound(fontSize: 28, fontWeight: FontWeight.w500,
                        color: Colors.white),),
                    SizedBox(height: 25,),
                    Text('Get the most likes to win!', style: GoogleFonts.varelaRound(fontSize: 22, fontWeight: FontWeight.w400,
                        color: Colors.white),),
                  ],
                ),
              ),
              Components(image: 'assets/onboard3.png',
                component: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SelfieSplash Color Family', style: GoogleFonts.varelaRound(fontSize: 28, fontWeight: FontWeight.w500,
                        color: Colors.white),),
                    SizedBox(height: 25,),
                    Text('Choose your family!', style: GoogleFonts.varelaRound(fontSize: 22, fontWeight: FontWeight.w400,
                        color: Colors.white),),
                  ],
                ),
              ),
              Components(image: 'assets/onboard4.jpg',
                component: Column(
                  children: [
                    SizedBox(height: 100,),
                    Text('Get Started!', style: GoogleFonts.varelaRound(fontSize: 28, fontWeight: FontWeight.w500,
                        color: Colors.white),),
                    SizedBox(height: 25,),
                    Text('The selfie world awaits you!', style: GoogleFonts.varelaRound(fontSize: 22, fontWeight: FontWeight.w400,
                        color: Colors.white),),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){Navigator.pushNamed(context, 'login');}, child: Text('LOGIN',
                          style:  GoogleFonts.varelaRound(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.w400),),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 65, vertical: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                          ),
                        ),
                        SizedBox(width: 10,),
                        IntroButtons(text: 'SIGN UP',),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.9,
            child: isLastPage == false ? Container(
              /*
              *decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.white))
              ),*/
              width: size.width,
              padding: const EdgeInsets.all(10),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*
                  *TextButton(
                      onPressed:() => controller.jumpToPage(4),
                      child: Text('SKIP', style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),)),*/
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        dotColor: Colors.grey,
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 15,
                        radius: 10,
                        activeDotColor: Colors.white,
                        strokeWidth: 1.0,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn),
                    ),
                  ),
                  /*
                  *TextButton(onPressed:() {
                    controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  }, child: Text('NEXT', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),)*/
                ],
              ),

            ) :  Container(
              /*
              *decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.white))
              ),*/
              width: size.width,
              padding: EdgeInsets.all(10),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        dotColor: Colors.grey,
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 15,
                        radius: 10,
                        activeDotColor: Colors.white,
                        strokeWidth: 1.0,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn),
                    ),
                  ),
                  /*
                  *SizedBox(width: 100,),

                  TextButton(onPressed:() {
                  }, child: Text('START', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),)*/
                ],
              ),

            ),
          ),
        ]
      ),
    );
  }
}

class IntroButtons extends StatelessWidget {
  const IntroButtons({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){Navigator.pushNamed(context, 'signUp');}, child: Text(text,
      style: GoogleFonts.varelaRound(fontSize: 18, fontWeight: FontWeight.w400),),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 55, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
      ),
    );
  }
}

class Components extends StatelessWidget {
  const Components({
    Key? key,
    required this.image,
    this.component
  }) : super(key: key);

  final String image;
  final Widget? component;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          color: Colors.black.withOpacity(0.3),
          height: double.infinity,
          child: component
      ),
      decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage(image.toString()), fit: BoxFit.cover)
      ),
    );
  }
}
