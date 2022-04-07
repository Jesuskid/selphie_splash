import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              image: AssetImage('assets/login.jpg'),fit: BoxFit.cover
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Image.asset('assets/logo.png', scale: 2,),
                Text('SelfieSplash', style: GoogleFonts.varelaRound(fontWeight: FontWeight.w500, fontSize: 35,
                    color: Colors.white),),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.white54.withOpacity(0.2),
                  ),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text('Enter your email and we will send you a token to reset your password', style: kOnboardTextSmall.copyWith(fontSize: 16),),
                      InputText(text: "EMAIL",),
                      SizedBox(height: 20,),
                      IntroButtonsTwo(text: 'RETRIEVE PASSWORD', ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("ALREADY HAVE AN ACCOUNT?" ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                          GestureDetector(onTap: (){Navigator.pushNamed(context, 'login');},child: Text(' LOGIN', style: kOnboardTextSmall.copyWith(fontSize: 16,
                          fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("DON'T HAVE AN ACCOUNT?" ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                          GestureDetector(onTap: (){Navigator.pushNamed(context, 'signUp');},child: Text(' SIGN UP', style: kOnboardTextSmall.copyWith(fontSize: 16,
                              fontWeight: FontWeight.bold),)),
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
