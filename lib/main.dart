import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Tambahkan import ini
import 'package:qr_generator_and_scanner/ui/home_screen.dart';
import 'package:qr_generator_and_scanner/ui/qr_generator.dart';
import 'package:qr_generator_and_scanner/ui/qr_scanner.dart';
import 'package:qr_generator_and_scanner/ui/splash_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Aktifkan preview saat pengembangan
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluxQR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      builder: DevicePreview.appBuilder, // Tambahkan ini untuk integrasi dengan DevicePreview
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/qr': (context) => const QRGenerator(),
        '/qr_scanner': (context) => const QrScanner(),
      },
    );
  }
}
