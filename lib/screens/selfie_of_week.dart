import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';

class SelfiePage extends StatelessWidget {
  const SelfiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text('SelfieSplash', style: kOnboardTextBig.copyWith(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600),),
        actions: [
          Icon(CupertinoIcons.info, color: Colors.black54, size: 35, )
        ],
        toolbarHeight: 70,
      ),
      body: SafeArea(
          child:SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  TextButton(onPressed: (){
                   showDialog(context: context, builder: ModalWinner);

                  }, child: Text('Lauch alert')),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Selfie of the week (Ghana)🇬🇭', style: kOnboardTextSmall.copyWith(wordSpacing: 1, color: Colors.black54, fontWeight: FontWeight.w600),),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 4),
                              blurRadius: 10,
                              spreadRadius: 4,
                              color: Colors.grey.withOpacity(0.3)
                          )
                        ]
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 260,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Stories(),
                        Stories(),
                        Stories(),
                        Stories(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Selfie(),
                  Selfie(),
                  Selfie(),
                ],
              ),
            ),
          )
      ),
    );
  }
}



  Widget ModalWinner(BuildContext context) =>AlertDialog(
    contentPadding: EdgeInsets.all(10),
    backgroundColor: Colors.transparent,
    content: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      height:260,
      child: Column(
        children: [
          Image.asset('assets/award.png', scale: 4,),
          SizedBox(height: 10,),
          Text('Get the most admirations on your selfies every week to win', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ],
      ),
    ),
    actionsAlignment: MainAxisAlignment.center,
  );

class Selfie extends StatelessWidget {
  const Selfie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('SOTW(GHANA)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),),),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/welcome.png'),),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Alice Stark 🇬🇭 ', style: TextStyle(fontWeight: FontWeight.w800),),
                          SizedBox(width: 5,),
                          Icon(Icons.stars, color: Colors.yellowAccent,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text('Selfie😂 . 13/07/2022 . Happy🤗 '),
                    ],
                  ),
                ],
              ),
              Icon(Icons.more_vert, size: 25,)
            ],
          ),
          SizedBox(height: 10,),
          SizedBox(height: 20,),
          //Image
          Image.asset('assets/welcome.png',),
          SizedBox(height: 10,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 35,),
                SizedBox(width: 5,),
                Text('7K', style: TextStyle(fontSize: 20),)
              ],
            ),
          ),
          Row(
            children: [
              Text('SelfieTag: '),
              Text('#funSelfie', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),)
            ],
          ),
          Row(
            children: [
              Text('Country: '),
              Text('Ghana🇬🇭', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),)
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 10,
                spreadRadius: 4,
                color: Colors.grey.withOpacity(0.3)
            )
          ]
      ),
    );
  }
}

class Stories extends StatelessWidget {
  const Stories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        width: 200,
        height: 250,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/welcome.png'), fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 4),
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.2)
              ),

            ]
        ),
        child: Stack(
          children: [
            Positioned(
              top: 186,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 60,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('Mark Alice', style: TextStyle(color: Colors.white),),
                    Row(
                      children: [
                        Text('20m', style: TextStyle(color: Colors.white),),
                        SizedBox(width: 90,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('3.2k', style: TextStyle(color: Colors.white),),
                            SizedBox(width: 5,),
                            Icon(Icons.remove_red_eye, color: Colors.white,)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0), bottomRight:Radius.circular(20), bottomLeft: Radius.circular(20)),
                ),

              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)

                ),
                child: Text('6', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        )
    );
  }
}
