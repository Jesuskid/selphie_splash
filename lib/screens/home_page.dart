import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text('SelfieSplash', style: kOnboardTextBig.copyWith(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600),),
        actions: [
          Icon(Icons.camera_enhance_outlined, color: Colors.black54, size: 35, ),
          SizedBox(width: 20,),
          Icon(Icons.message, color: Colors.black54, size: 35,),
          SizedBox(width: 20,),
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
                  FirebaseAuth.instance.signOut();
                }, child: Text('Log Out')),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 110,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weekly Motivation ☕', style: kOnboardTextSmall.copyWith(color: Colors.black54, fontWeight: FontWeight.w600),),
                      Text('"Dreams don\'t work unless you do"', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('- John C Maxwell', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 20)),
                        ],
                      ),
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
                PostItem(),
                Svlog(),
                SizedBox(height: 20,),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              Text('Alice Stark 🇺🇸'),
                              SizedBox(height: 10,),
                              Text('Selfie😂 . 20m . Happy🤗 '),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert, size: 25,)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(' #tags'),
                      Text(' #tags'),
                      Text(' #tags')
                    ],
                  ),
                  SizedBox(height: 20,),
                  //Image
                  Image.asset('assets/welcome.png',)
                ],
              ),
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
          ),
        ),
        Positioned(
          top: 620,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            height: 65,
            width: 364,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Pallets(icon: Icons.favorite_border, text: '1k',),
                    Pallets(icon: Icons.message_outlined, text: '43',),
                    Pallets(icon: Icons.account_circle_rounded, text: '26',),
                    Pallets(icon: Icons.share, text: '4',),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
            ),

          ),
        ),
      ],
    );
  }
}


class Svlog extends StatelessWidget {
  const Svlog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Container(
        height: 600,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                  Text('Alice Stark 🇺🇸'),
                                  SizedBox(height: 10,),
                                  Text('Svlog . 20m . Happy🤗 '),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.more_vert, size: 25,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(' #tags'),
                          Text(' #tags'),
                          Text(' #tags')
                        ],
                      ),
                      SizedBox(height: 20,),
                      //Image
                      Image.asset('assets/welcome.png',)
                    ],
                  ),
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
              ),
            ),
            Positioned(
              top: 535,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                height: 65,
                width: 364,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Pallets(icon: Icons.remove_red_eye, text: '1k',),
                        Pallets(icon: Icons.message_outlined, text: '43',),
                        Pallets(icon: Icons.account_circle_rounded, text: '26',),
                        Pallets(icon: Icons.share, text: '4',),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0), bottomRight:Radius.circular(30), bottomLeft: Radius.circular(30)),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Pallets extends StatelessWidget {
  const Pallets({
    Key? key,
    required this.icon,
    required this.text
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.grey.shade200,),
          SizedBox(width: 5,),
          Text(text, style: TextStyle(color: Colors.grey.shade200, fontSize: 20),)
        ],
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
