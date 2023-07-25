import 'package:event_scanner_app/provider/auth_provider.dart';
import 'package:event_scanner_app/provider/secure_storage_provider.dart';
import 'package:event_scanner_app/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/token_provider.dart';

// void main() {
//   runApp(const MyApp());
// }

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TokenProvider()),
        ChangeNotifierProvider(create: (_) => SecureStorageProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(20),
          )
        )
      ),
      home: const SplashScreen(),
    );
  }
}

