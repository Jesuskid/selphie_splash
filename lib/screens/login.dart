import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../components/InputField.dart';
import '../components/IntroButton.dart';
import 'package:country_picker/country_picker.dart';
import 'package:selphie_splash/auth_service.dart';
import 'package:provider/provider.dart';
import 'retrive_password.dart';
import 'sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

String name = '', email = '', password = '';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            color: Colors.black54.withOpacity(0.3),
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
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Column(
                      children: [

                        InputText(text: "Email", change: (value) => email = value,),
                        InputText(text: "Password",  change: (value) => password = value),
                        IntroButtons(text: 'LOGIN',
                          pressed: () async{
                          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                           //await context.read<AuthService>().SignIn(email, password);
                          },
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("DON'T HAVE AN ACCOUNT YET?" ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                            GestureDetector(onTap:(){Navigator.pushNamed(context, 'signUp');},child: Text(' SIGN UP', style: kOnboardTextSmall.copyWith(fontSize: 16),)),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('TROUBLE LOGGING IN?' ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                            GestureDetector(onTap: (){
                              Navigator.pushNamed(context, 'retrieve');
                              },
                                child: Text(' CLICK HERE', style: kOnboardTextSmall.copyWith(fontSize: 16),)),
                          ],
                        ),
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
