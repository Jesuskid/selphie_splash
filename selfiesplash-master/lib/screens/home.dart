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
              Tab(icon: Image.asset('assets/home.png', width: 35, height: 35,),),
              Tab(icon: Image.asset('assets/sotw.png', width: 35, height: 35,),),
              Tab(icon: Image.asset('assets/challenge.png', width: 35, height: 35,),),
              Tab(icon: Image.asset('assets/search.png', width: 35, height: 35,),),
              Tab(icon: Image.asset('assets/profile.png', width: 35, height: 35,),),

            ],
          ),
          body: TabBarView(
            children: [
              HomePage(),
              SelfiePage(),
              ChallengesPage(),
              AdsPage(),
              ProfilePage(),

            ],
          ),
        ),
      ),
    );
  }
}
