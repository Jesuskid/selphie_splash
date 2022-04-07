import 'package:flutter/material.dart';
import '../constants.dart';


class ToolBar extends StatelessWidget {
  const ToolBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text('Splash A New?', style: kOnboardTextBig.copyWith(color: Colors.black.withOpacity(0.7), fontSize: 25, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          ContainerCardExpanded(child: RowField(emoji: '🔥', text: 'Moments',),),
          ContainerCardExpanded(child: RowField(emoji: '', text: 'Selfie',),),
          ContainerCardExpanded(child: RowField(emoji: '', text: 'Post',),),
          ContainerCardExpanded(child: RowField(emoji: '', text: 'Meme',),),
          ContainerCardExpanded(child: RowField(emoji: '', text: 'SVlog',),),
        ],
      ),
    );
  }
}

class RowField extends StatelessWidget {
  const RowField({Key? key, required this.emoji, required this.text} ) : super(key: key);
  final String emoji, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40,)),
          SizedBox(width: 10,),
          Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
        ],
      ),
    );
  }
}


class ContainerCardExpanded extends StatelessWidget {
  const ContainerCardExpanded({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      width: double.infinity,
      child: child,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.4))
          ]),
    ));
  }
}
