import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController untuk progress bar dan persentase
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Durasi sinkron 3 detik
    )..forward(); // Memulai animasi progress

    // Navigasi ke halaman berikutnya tepat di detik ke-3
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Membersihkan controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo aplikasi
            Image.asset(
              'assets/images/splash-clone.png',
              width: 240,
              height: 240,
            ),
            const SizedBox(height: 20),
            // Nama aplikasi
            const Text(
              'FluxQR',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 40),
            // Progress bar dan persentase
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  // Menghitung persentase progress
                  final percent = (_controller.value * 100).toInt();
                  return Column(
                    children: [
                      // Progress bar visual
                      CustomPaint(
                        size: const Size(double.infinity, 6),
                        painter: _ProgressBarPainter(_controller.value),
                      ),
                      const SizedBox(height: 10),
                      // Teks persentase
                      Text(
                        '$percent%', // Menampilkan progress dalam persen
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter untuk progress bar
class _ProgressBarPainter extends CustomPainter {
  final double progress;

  _ProgressBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.8) // Warna progress bar
      ..style = PaintingStyle.fill;

    // Menggambar progress bar horizontal
    final rect = Rect.fromLTWH(0, 0, size.width * progress, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
