import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selphie_splash/constants.dart';


class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final List items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text('Explore Ads', style: kOnboardTextBig.copyWith(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600),),
        actions: [
          Image.asset('assets/search1.png', width: 35, height: 35,),
          SizedBox(width: 15,),
          Image.asset('assets/notifications.png', width: 35, height: 35,),
          SizedBox(width: 15,),
          Image.asset('assets/follow.png', width: 35, height: 35,),
        ],
        toolbarHeight: 70,
      ),
      body: SafeArea(
          child:SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(
                children: [
                  // TextButton(onPressed: (){
                  //   FirebaseAuth.instance.signOut();
                  // }, child: Text('Log Out')),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.3)
                      )
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TopTab(text: 'Page', icon: Icons.bar_chart),
                          TopTab(text: 'Shops', icon: Icons.house_sharp,),
                          TopTab(text: 'Shop Now', icon: Icons.shopping_bag_sharp,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TabBar(
                    tabs: [
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('My Prefered Ads', style: kHeader2TextMedium,),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.shopping_bag_sharp),
                          const SizedBox(width: 8),
                          Text('Advertisment',  style: kHeader2TextMedium,),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt, color: Colors.purple,),
                          const SizedBox(width: 8),
                          Text('Ads',  style: kHeader2TextMedium,),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.shopping_bag_sharp),
                          const SizedBox(width: 8),
                          Text('Policies',  style: kHeader2TextMedium,),
                        ],
                      ),
                    ),
                  ],
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    unselectedLabelColor: Colors.black87,
                    isScrollable: true,
                    controller: tabController,
                    labelStyle: TextStyle(
                      color: Colors.blue
                    ),
                    labelColor: Colors.blue,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue, width: 1)
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 2,
                        crossAxisCount: 4,
                        crossAxisSpacing: 2
                      ),

                      itemBuilder: (BuildContext context, index){
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/welcome.png'), fit: BoxFit.cover)
                          ),
                        );
                      },
                      itemCount: 22,
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

class TopTab extends StatelessWidget {
  const TopTab({
    Key? key,
    required this.text,
    required this.icon
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey, width: 1)
        )
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: [
          Icon(icon, size: 30,),
          Text(text, style: kHeaderTextMedium,)
        ],
      ),
    );
  }
}