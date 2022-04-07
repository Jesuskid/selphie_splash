import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import 'package:selphie_splash/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
        actions: [
          //IconButton(onPressed: (){}, icon: Icon(Icons.search,  size: 28, color: Colors.black.withOpacity(0.7),))
        ],
        elevation: 0.2,
        title: Text('Profile Menu', style: kOnboardTextBig.copyWith(color: Colors.black.withOpacity(0.7), fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
                children: [
                  ProfileMenuItem(icon: Icons.account_circle, text: 'Account', tapped: (){Navigator.pushNamed(context, 'profile_page');},),
                  ProfileMenuItem(icon: Icons.notifications, text: 'Notifications', color: Colors.orange, tapped: (){Navigator.pushNamed(context, 'inbox');},),
                  ProfileMenuItem(icon: Icons.security, text: 'Security', color: Colors.green,),
                  ProfileMenuItem(icon: Icons.lock, text: 'Privacy', color: Colors.yellow,),
                  ProfileMenuItem(icon: Icons.live_tv_sharp, text: 'Ads', color: Colors.purpleAccent, tapped: (){Navigator.pushNamed(context, 'ads_page');},),
                  ProfileMenuItem(icon: Icons.info, text: 'About', color: Colors.redAccent,),
                  ProfileMenuItem(icon: Icons.support_agent, text: 'Support', color: Colors.lightBlue,),
                  ProfileMenuItem(icon: Icons.logout, text: 'Logout', color: Colors.deepOrange, tapped: (){
                    showDialog(context: context, builder: createDialog);
                  },),
                ],
              ),
            ),
            Container(
              child: Image.asset('assets/logo.png', scale: 2,),
            )
          ],
        ),
      ),
    );
  }
}


//Logout allert dialog
Widget createDialog(BuildContext context) => AlertDialog(
  title: Text('Splash and extra selfie or logout', style: TextStyle(color: Colors.blue),),
  content: Row(
    children: [
      Checkbox(value: false, onChanged: (value){}),
      Text('Remember my login info')
    ],
  ),
  actions: [
    ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('STAY'),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    ElevatedButton(onPressed: (){FirebaseAuth.instance.signOut();}, child: Text('LOGOUT'),
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  ],
  actionsAlignment: MainAxisAlignment.center,
);
class ProfileMenuItem extends StatelessWidget {
   ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    this.color,
     this.tapped
  }) : super(key: key);

  final IconData icon;
  final String text;
  Color? color;
  VoidCallback? tapped;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapped,
      child: Container(
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
        width: 50,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 55, color: color != null ? color : Colors.blue,),
            Text(text, style: kLittleDarkGreyText.copyWith(fontWeight: FontWeight.w500, color: Colors.black87),)
          ],
        ),
      ),
    );
  }
}
