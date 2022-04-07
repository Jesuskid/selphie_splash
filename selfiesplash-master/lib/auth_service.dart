import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  FirebaseAuth auth;
  AuthService(this.auth);

  Stream<User?> get authUserStateChange => auth.authStateChanges();

  Future<String> SignIn(String email, String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print('Signed in');
      return 'Signed In';
    }on FirebaseAuthException catch(e){
      return e.message.toString();
    }
  }

  Future<String> SignUp(String email, String password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      print('Signed up');
      return 'Signed Up';
    }on FirebaseAuthException catch(e){
      return e.message.toString();
    }
  }
}