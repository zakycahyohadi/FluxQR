import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key
  });

  @override
  State < SplashScreen > createState() => _SplashScreenState();
}

class _SplashScreenState extends State < SplashScreen > {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo atau animasi
              Image.asset(
                'assets/images/splash-clone.png', // pastikan gambar ada di folder assets
                width: 250, // ukuran gambar
                height: 250,
              ),
                // Teks Splash
                const Text(
                  'FluxQR',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
            ],
          ),
        ),
    );
  }
}