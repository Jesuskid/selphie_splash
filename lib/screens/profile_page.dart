import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text(
          'Me',
          style: kOnboardTextBig.copyWith(
              color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actions: [
          Icon(
            Icons.menu,
            color: Colors.black54,
            size: 35,
          ),
        ],
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/welcome.png'),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 420,
                    margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade300.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, left: 20, right: 20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('assets/welcome.png'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Princess Sersei', style: kOnboardTextSmall.copyWith(fontWeight: FontWeight.w600),),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              'Sersei is the name not your regular gal don\'t forget to smile ;)',
                              textAlign: TextAlign.center, style: kOnboardTextSmall.copyWith(fontSize: 18, wordSpacing: 0.2),),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.cake, color: Colors.white,),
                                  Text(' 11/06/1995 ', style: kSimpleWhiteText,)
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 20,
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.favorite, color: Colors.white,),
                                  Text(' Me ', style: kSimpleWhiteText,)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  ContainerCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HighLights(
                          text: 'Moments and Diaries',
                          image: 'assets/welcome.png',
                        ),
                        HighLights(
                          text: 'Shops(23)',
                          image: 'assets/welcome.png',
                        ),
                        HighLights(
                          text: 'Pages(1)',
                          image: 'assets/welcome.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ContainerCard(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Mood: ',
                                style: kSimpleBasicText.copyWith(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'Determined',
                                style: kSimpleBasicText),
                          ])),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.post_add_rounded,
                                color: Colors.grey,
                              ),
                              Text(
                                ' (25)',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Not stopping still I get to the top', style: kSimpleBasicText,),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Text(' #growth', style: kSimplePurpleText,), Text(' #billionaire', style: kSimplePurpleText,)],
                      )
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  ContainerCard(
                      child: Column(
                    children: [
                      PurpleButton(text: 'Change Family',),
                      PurpleButton(text: 'Edit Profile',),
                      PurpleButton(text: 'Social Cricle(500k followers)',),
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  ContainerCard(
                      child: Container(
                    padding: EdgeInsets.all(1),
                    height: 500,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/welcome.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Text('Posts(110)', style: kSimpleBasicText.copyWith(fontWeight: FontWeight.bold),)
                            ],
                          ),
                        );
                      },
                      itemCount: 5,
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class PurpleButton extends StatelessWidget {
  const PurpleButton({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: (){}, child: Text(text,
          style: TextStyle(
            fontSize: 20
          ),
        ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            primary: Colors.purple,
            elevation: 0.2
          ),
        ),
      ),
    );
  }
}

class HighLights extends StatelessWidget {
  const HighLights({Key? key, required this.text, required this.image})
      : super(key: key);

  final String text, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.4),
            radius: 38,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(image),
              ),
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}

class ContainerCard extends StatelessWidget {
  const ContainerCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: child,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.1))
          ]),
    );
  }
}
