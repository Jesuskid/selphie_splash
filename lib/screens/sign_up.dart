import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/constants.dart';
import '../components/IntroButton.dart';
import 'package:country_picker/country_picker.dart';
import '../components/InputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:selphie_splash/auth_service.dart';


String name = '', email = '', c_password = '', password = '', country = '';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  FirebaseAuth auth = FirebaseAuth.instance;

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
                      InputText(text: "Full Name",),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Country', style: kOnboardTextSmall,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 40,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)

                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.flag, color: Colors.grey,),
                                    SizedBox(width: 10,),
                                    Text(c_string)
                                  ],
                                ),
                              ),
                              IconButton(onPressed: (){
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true, // optional. Shows phone code before the country name.
                                  onSelect: (Country country) {
                                    setState(() {
                                      c_string = '+${country.phoneCode} ${country.name}';
                                    });
                                    print('Select country: ${country.e164Key}');
                                  },
                                );
                              }, icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.white,))
                            ],
                          )
                        ],
                      ),
                      InputText(text: "Email", change: (value) => email = value,),
                      InputText(text: "Password", change: (value) => password = value),
                      InputText(text: "Confirm Password", change: (value) => c_password = value),
                      IntroButtons(
                          text: 'SIGN UP',
                          pressed: (){
                            print(email);
                            FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((user) => {
                              user.user
                            }
                            ).catchError((e) => print(e));
                        }
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ALREADY HAVE AN ACCOUNT?' ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                          GestureDetector(onTap: (){Navigator.pushNamed(context, 'login');},child: Text(' LOGIN', style: kOnboardTextSmall.copyWith(fontSize: 16),)),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('TROUBLE LOGGING IN?' ,style: kOnboardTextSmall.copyWith(fontSize: 16),),
                          GestureDetector(onTap: (){Navigator.pushNamed(context, 'retrieve');},child: Text(' CLICK HERE', style: kOnboardTextSmall.copyWith(fontSize: 16),)),
                        ],
                      ),
                      SizedBox(height: 20,),


                    ],
                  ),
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


