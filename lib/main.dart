import 'dart:io';

import 'package:alemeno_test/mobile/mobile_screens/home_screen.dart';
import 'package:alemeno_test/provider/cart_provider.dart';
import 'package:alemeno_test/windows/windows_screens/cart_window.dart';
import 'package:alemeno_test/windows/windows_screens/main_window.dart';
import 'package:alemeno_test/windows/windows_screens/success_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    TargetPlatform platform = Theme.of(context).platform;

    Widget app;
    if(platform == TargetPlatform.android || platform == TargetPlatform.iOS){
      app = const HomeScreen();
    }
    else if(platform == TargetPlatform.windows){
      app = const MainWindow();
    }
    else{
      app = const MainWindow();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme
          )
        ),
        debugShowCheckedModeBanner: false,
        home: app
      ),
    );
  }
}

