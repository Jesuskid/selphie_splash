import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:selphie_splash/screens/challenges.dart';
import 'screens/on_boarding.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';
import 'screens/login.dart';
import 'screens/retrive_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';
import 'screens/retrive_password.dart';
import 'screens/home_page.dart';
import 'screens/ads.dart';
import 'screens/selfie_of_week.dart';
import 'screens/retrive_password.dart';
import 'auth_service.dart';

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
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }

}
