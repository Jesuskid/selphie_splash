import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../components/InputField.dart';
import '../components/IntroButton.dart';
import 'package:country_picker/country_picker.dart';

class RetrievePasswordPage extends StatefulWidget {
  const RetrievePasswordPage({Key? key}) : super(key: key);

  @override
  _RetrievePasswordPageState createState() => _RetrievePasswordPageState();
}

class _RetrievePasswordPageState extends State<RetrievePasswordPage> {
  String c_string = 'Select your country';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image:  DecorationImage(
              image: AssetImage('assets/welcome.png'),fit: BoxFit.cover
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          color: Colors.black54.withOpacity(0.4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/logo.png', scale: 2,),
                Text('SelphieSplash', style: kOnboardTextBig.copyWith(letterSpacing: 2, fontWeight: FontWeight.w400, fontSize: 32),),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.black54.withOpacity(0.4),
                  ),
                  padding: EdgeInsets.all(30),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text('Enter your email and we would send you a token to reset your password', style: kOnboardTextSmall.copyWith(fontSize: 16),),
                      InputText(text: "EMAIL",),
                      SizedBox(height: 20,),
                      IntroButtonsTwo(text: 'RETRIEVE PASSWORD', ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("DON'T HAVE AN ACCOUNT YET?" ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                          GestureDetector(onTap: (){Navigator.pushNamed(context, 'login');},child: Text(' LOGIN', style: kOnboardTextSmall.copyWith(fontSize: 16),)),
                        ],
                      ),
                      SizedBox(height: 20,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('TROUBLE LOGGING IN?' ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                      //     Text(' CLICK HERE', style: kOnboardTextSmall.copyWith(fontSize: 16),),
                      //   ],
                      // ),
                      SizedBox(height: 20,),


                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
