import 'package:flutter/material.dart';
import 'package:herpi/pages/home/home.dart';
import 'package:herpi/providers/reptiles_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReptilesProvider()),
      ],
     
      child:   MaterialApp(
        theme: ThemeData(
        primaryColor: Colors.white, 
        hintColor: Colors.white, 
        scaffoldBackgroundColor: Colors.white,),
        debugShowCheckedModeBanner: false,
        home: HomePge(),
      ),
    );
  }
}
