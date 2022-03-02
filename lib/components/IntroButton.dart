import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';

class IntroButtons extends StatelessWidget {
   IntroButtons({
    Key? key,
    required this.text,
     this.color,
     this.pressed
  }) : super(key: key);

  final String text;
  final Color? color;
  final VoidCallback? pressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: pressed, child: Text(text,  style: kOnboardTextBig.copyWith(fontSize: 20, color: color==null ? Colors.white : color,  fontWeight: FontWeight.w400),),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
      ),
    );
  }
}

class IntroButtonsTwo extends StatelessWidget {
  IntroButtonsTwo({
    Key? key,
    required this.text,
    this.color
  }) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text(text,  style: kOnboardTextBig.copyWith(fontSize: 20, color: color==null ? Colors.white : color,  fontWeight: FontWeight.w400),),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
      ),
    );
  }
}