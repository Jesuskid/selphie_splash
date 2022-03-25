import 'package:flutter/material.dart';
import '../constants.dart';


class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          Text('Splash', style: kOnboardTextBig.copyWith(color: Colors.black.withOpacity(0.7), fontSize: 25, fontWeight: FontWeight.w600),)
        ],
        elevation: 0.2,
        title: Text('New Selfie', style: kOnboardTextBig.copyWith(color: Colors.black.withOpacity(0.7), fontSize: 25, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/welcome.png', scale:5,),),
              InputBoxes(borderRadius: 10, hintText: 'Add Caption',),
              InputBoxes(borderRadius: 30, hintText: 'Add Selfie Tag (i.e #kaks #ajax # ho)', textAlign: TextAlign.center,),
              InputBoxes(borderRadius: 30, hintText: 'Add Mood', textAlign: TextAlign.center,),
              InputBoxes(borderRadius: 30, hintText: 'Tag People', textAlign: TextAlign.center,),
              InputBoxes(borderRadius: 30, hintText: 'Add Location', textAlign: TextAlign.center,),

            ]
          ),
        ),
      ),
    );
  }
}

class InputBoxes extends StatelessWidget {
  InputBoxes({
    Key? key,
    required this.borderRadius,
    required this.hintText,
    this.style,
    this.textAlign
  }) : super(key: key);

  final double borderRadius;
  final String hintText;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: BorderRadius.circular(borderRadius)
      ),
        child: TextField(
          textAlign: textAlign != null ? textAlign! : TextAlign.start,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintText: hintText,
            hintStyle: style
          ),
        )
    );
  }
}
