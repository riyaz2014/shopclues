import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopclues/screens/cart.dart';
import 'package:shopclues/screens/login/components/login_auth_provider.dart';
import 'package:shopclues/screens/sign%20up/Components/signup_auth_provider.dart';
import 'screens/home.dart';
import 'screens/login/login_page.dart';
import 'screens/profile.dart';
import 'screens/sign up/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes:{
        "/":(context)=>StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnp) {
            if (userSnp.hasData) {
              return Home();
            }
            return LoginPage();
          },
        ),
        "/login":(context)=> LoginPage(),
        "/signin":(context)=>SignupPage(),
        "/profile":(context)=>ProfilePage(),
        "/cart":(context)=>CartPage(),
      },
      ),
    );
  }
}
