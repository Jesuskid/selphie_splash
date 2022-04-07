import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';


class DiscoverPeople extends StatelessWidget {
  const DiscoverPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          //IconButton(onPressed: (){}, icon: Icon(Icons.search,  size: 28, color: Colors.black.withOpacity(0.7),))
        ],
        elevation: 0.2,
        title: Text('Discover People', style: kOnboardTextBig.copyWith(color: Colors.black.withOpacity(0.7), fontSize: 24, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.26,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1,2),
                      blurRadius: 4,
                      spreadRadius: 2,
                      color: Colors.grey.withOpacity(0.1)
                  )
                ]
            ),
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text('Add people to your social circle', style: kOnboardTextSmall.copyWith(color: Colors.black87, fontWeight: FontWeight.bold, wordSpacing: 0.3),),
                  SizedBox(height: 15,),
                  Container(
                    height: size.height * 0.2 * 0.80,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Icon(Icons.book_rounded, size: 50, color: Colors.blue,),
                              SizedBox(height: 10,),
                              Text('Connect contacts', style: kLittleDarkGreyText,)
                            ],
                          ),
                        ),
                        SizedBox(width: 1, height: 90, child: Container(color:Colors.black26),),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Icon(Icons.location_on, size: 50, color: Colors.orange,),
                              SizedBox(height: 10,),
                              Text('Search Area', style: kLittleDarkGreyText,)
                            ],
                          ),
                        ),
                      ],
                    ),
                    ),
                ],
              ),
            ),
          ),


          //Messages
          Expanded(
              child: Container(
                height: size.height * (1-0.24),

                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [

                    InboxItem(),
                    InboxItem(),
                    InboxItem(),
                    InboxItem(),

                  ],
                ),

              ))

        ],
      ),
    );

  }
}



class InboxItem extends StatelessWidget {
  const InboxItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1,2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.1)
              )
            ]
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Alice Stark 🇬🇭', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text('How are you doing')
                    ],
                  ),
                ],),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){},
                        child: Text('Follow'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.delete_forever_outlined, color: Colors.red,)
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),

          ],
        )
    );
  }
}