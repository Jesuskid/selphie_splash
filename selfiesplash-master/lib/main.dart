import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/screens/challenges.dart';
import 'package:selphie_splash/screens/discover_poeple.dart';
import 'package:selphie_splash/screens/profile_page.dart';
import 'screens/on_boarding.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';
import 'screens/login.dart';
import 'screens/retrieve_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';
import 'screens/retrieve_password.dart';
import 'screens/home_page.dart';
import 'screens/ads.dart';
import 'screens/selfie_of_week.dart';
import 'screens/home.dart';
import 'auth_service.dart';
import 'screens/inbox.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
              create: (_) => AuthService(FirebaseAuth.instance)),
          StreamProvider(create: (context) => context.read<AuthService>().authUserStateChange, initialData: [],)
        ],
      child:  MaterialApp(
          routes: {
            'home': (context) => HomePage(),
            'login': (context) => LoginPage(),
            'signUp': (context) => SignUp(),
            'profile_page': (context) => ProfilePage(),
            'ads_page': (context) => AdsPage(),
            'inbox': (context) => Inbox(),
            'retrieve': (context) => RetrievePasswordPage()
          },
          home: AuthenticationWrapper()
      )
    );
  }

}


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }

}
