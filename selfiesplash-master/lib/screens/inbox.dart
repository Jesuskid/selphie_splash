import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,  size: 28, color: Colors.black.withOpacity(0.7),))
        ],
        elevation: 0.2,
        title: Text('My Inbox', style: kOnboardTextBig.copyWith(color: Colors.black.withOpacity(0.7), fontSize: 25, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Container(
              height: size.height * 0.24,
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
              child:Column(
                children: [
                  SizedBox(height: 15,),
                  Text('Favorites', style: kOnboardTextSmall.copyWith(color: Colors.black87),),
                  SizedBox(height: 15,),
                  Container(
                    height: size.height * 0.2 * 0.76,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                    children: [
                      UserProfiles(),
                      UserProfiles(),
                      UserProfiles(),
                      UserProfiles(),

                    ],
                    ),
                  ),
                ],
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
            )
          ],),
          SizedBox(height: 10,),
          Divider(height: 1,),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('10 munites ago'),
              Text('1 ', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),


            ],
          ),
        ],
      )
    );
  }
}

class UserProfiles extends StatelessWidget {
  const UserProfiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
              ),
              Container(height: 70,child: Text('🇬🇭')),
            ],
          ),
          SizedBox(height:8,),
          Text('Ama Govenor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
        ],
      ),
    );
  }
}
