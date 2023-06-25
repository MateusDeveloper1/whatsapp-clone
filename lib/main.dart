import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wahtsapp_clone/routeGenerator.dart';
import 'package:wahtsapp_clone/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Color.fromARGB(255, 189, 188, 188),
          labelColor: Colors.white,
        ),
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff075E54),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const Login(),
    );
  }
}
