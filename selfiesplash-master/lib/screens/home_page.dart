import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
          Image.asset('assets/camera.png', width: 35, height: 35,),
          SizedBox(width: 20,),
          Image.asset('assets/chats.png', width: 35, height: 35,),
          SizedBox(width: 20,),
        ],
        toolbarHeight: 70,
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                TextButton(onPressed: (){
                  FirebaseAuth.instance.signOut();
                }, child: Text('Log Out')),
                Container(
                  height: 200,
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
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 110,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Weekly Motivation ☕', style: kOnboardTextSmall.copyWith(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 15),),
                      Text('"Dreams don\'t work unless you do"', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('- John C Maxwell', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15, fontStyle: FontStyle.italic)),
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
                SizedBox(height: 20,),
                SelfieItem(),
                SizedBox(height: 20,),
                MemeItem(),
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
            margin: EdgeInsets.only(left: 5, right: 5,),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                            radius: 28,
                            backgroundImage: AssetImage('assets/welcome.png'),),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alice Stark 🇺🇸', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(height: 8,),
                              Text('Post😂 . 20m . Happy🤗 '),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert, size: 25,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                  fontSize: 16),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
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
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 65,
            width: 365,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class SelfieItem extends StatelessWidget {
  const SelfieItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5,),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                            radius: 25,
                            backgroundImage: AssetImage('assets/welcome.png'),),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alice Stark 🇺🇸', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(height: 8,),
                              Text('Selfie😂 . 20m . Happy🤗 '),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert, size: 25,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                      fontSize: 16),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
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
          bottom: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 65,
            width: 365,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class MemeItem extends StatelessWidget {
  const MemeItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5,),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                            radius: 25,
                            backgroundImage: AssetImage('assets/welcome.png'),),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alice Stark 🇺🇸', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                              SizedBox(height: 8,),
                              Text('Meme😂 . 20m . Happy🤗 '),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.more_vert, size: 25,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black,
                      fontSize: 16),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
                      Text(' #tags', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16),),
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
          bottom: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 65,
            width: 365,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      Text("Where users tap to switchbetween tab/fragment pages of the Activity.", style: kOnboardTextSmallPost.copyWith(color: Colors.black, fontSize: 12),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(' #tags',),
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
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/welcome.png'), fit: BoxFit.cover),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 10,
                spreadRadius: 2,
                color: Colors.grey.withOpacity(0.3)
            ),

          ]
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 50,
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mark Alice', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                  fontSize: 12),),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Text('20m', style: TextStyle(color: Colors.white, fontSize: 12),),
                      SizedBox(width: 60,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('3.2K', style: TextStyle(color: Colors.white, fontSize: 12),),
                          SizedBox(width: 5,),
                          Icon(Icons.remove_red_eye, color: Colors.white, size: 18,)
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
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5)

              ),
              child: Text('6', style: TextStyle(color: Colors.white, fontSize: 15),),
            ),
          )
        ],
      )
    );
  }
}
