import 'package:flutter/material.dart';
import 'ads.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'selfie_of_week.dart';
import 'challenges.dart';
import 'search.dart';
import 'profile_menu.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: TabBar(
            labelColor: Colors.white,
            padding: EdgeInsets.all(8),
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home, color: Colors.grey, size: 35,),),
              Tab(icon: Icon(Icons.favorite, color: Colors.grey, size: 35,),),
              Tab(icon: Icon(Icons.star_border_purple500_sharp, color: Colors.grey, size: 35,),),
              Tab(icon: Icon(Icons.search, color: Colors.grey, size: 35,),),
              Tab(icon: Icon(Icons.account_circle_outlined, color: Colors.grey, size: 35,),),

            ],
          ),
          body: TabBarView(
            children: [
              HomePage(),
              SelfiePage(),
              ChallengesPage(),
              SearchPage(),
              ProfileMenu(),

            ],
          ),
        ),
      ),
    );
  }
}
