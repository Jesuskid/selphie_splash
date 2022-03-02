import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';

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
              Components(image: 'assets/welcome.png',
                component: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome to SelfieSplash', style: kOnboardTextBig,),
                      SizedBox(height: 25,),
                      Text('Tell your story with selfies', style: kOnboardTextSmall,),
                    ],
                  ),
                ),
              ),
              Components(image: 'assets/welcome.png',
                component: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.6,),
                    Text('Selfie of the week', style: kOnboardTextBig,),
                    SizedBox(height: 25,),
                    Text('Get the most admirations to win', style: kOnboardTextSmall,),
                  ],
                ),
              ),
              Components(image: 'assets/welcome.png',
                component: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SelfieSplash Family Color', style: kOnboardTextBig,),
                    SizedBox(height: 25,),
                    Text('Choose your family!', style: kOnboardTextSmall,),
                  ],
                ),
              ),
              Components(image: 'assets/welcome.png',
                component: Column(
                  children: [
                    SizedBox(height: 100,),
                    Text('Get Started!', style: kOnboardTextBig,),
                    SizedBox(height: 25,),
                    Text('The selfie world awaits you', style: kOnboardTextSmall,),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text('LOGIN', style:  kOnboardTextBig.copyWith(fontSize: 20, color: Colors.blueAccent, fontWeight: FontWeight.w400),),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18),
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
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(color: Colors.white))
              ),
              width: size.width,
              padding: EdgeInsets.all(10),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed:() => controller.jumpToPage(2),
                      child: Text('SKIP', style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),)),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        dotColor: Colors.grey,
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 16,
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
                  TextButton(onPressed:() {
                    controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  }, child: Text('NEXT', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),)
                ],
              ),

            ) :  Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(color: Colors.white))
              ),
              width: size.width,
              padding: EdgeInsets.all(10),
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        dotColor: Colors.grey,
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 16,
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
                  SizedBox(width: 100,),
                  TextButton(onPressed:() {
                  }, child: Text('START', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),)
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
    return ElevatedButton(onPressed: (){}, child: Text(text,  style: kOnboardTextBig.copyWith(fontSize: 20,  fontWeight: FontWeight.w400),),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 18),
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
          color: Colors.black.withOpacity(0.4),
          height: double.infinity,
          child: component
      ),
      decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage(image.toString()), fit: BoxFit.cover)
      ),
    );
  }
}
