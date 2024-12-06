import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
              onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/profile-clone.png'),
                    backgroundColor: Colors.blueAccent,
                  ),
                  const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo, Jason Voorhees',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'White Hat',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 30),

                // Welcome Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome To',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'FluxQR',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w800,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                  // Button Section
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                      padding: const EdgeInsets.all(10),
                        children: [
                          BuildButton(
                            icon: Icons.qr_code,
                            label: 'Generate QR',
                            backgroundColor: const Color(0xFF3B82F6),
                              iconColor: Colors.white,
                              onTap: () {
                                Navigator.pushNamed(context, '/qr');
                              },
                          ),
                          BuildButton(
                            icon: Icons.qr_code_scanner,
                            label: 'Scan QR',
                            backgroundColor: const Color(0xFFFF6D40),
                              iconColor: Colors.white,
                              onTap: () {
                                Navigator.pushNamed(context, '/qr_scanner');
                              },
                          ),
                          BuildButton(
                            icon: Icons.send,
                            label: 'Send QR',
                            backgroundColor: const Color(0xFF69F0AF),
                              iconColor: Colors.white,
                              onTap: () {},
                          ),
                          BuildButton(
                            icon: Icons.print,
                            label: 'Print QR',
                            backgroundColor: const Color(0xFFFFD640),
                              iconColor: Colors.white,
                              onTap: () {},
                          ),
                        ],
                    ),
                  ),
            ],
          ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // White background for contrast
          borderRadius: BorderRadius.circular(20), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Soft shadow
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor, // Icon background color
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(14),
                child: Icon(
                  icon,
                  color: iconColor, // Icon color
                  size: 38,
                ),
            ),
            const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}