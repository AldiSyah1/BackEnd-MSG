import 'package:flutter/material.dart';
import 'providers/UsersProviders.dart';
import 'package:provider/provider.dart';
import 'screens/activation_view.dart';
import 'screens/bottomnavigation/profile_view.dart';
import 'screens/index_screen.dart';
import 'screens/log_reg/login_view.dart';
import 'screens/log_reg/register_view.dart';
import 'screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UsersProvider())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Sansita'),
      title: "Warehouse Stock Management",
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        IndexScreen.routeName: (context) => const IndexScreen(),
        Activation.routeName: (context) => Activation(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
    ),
  ));
}
