import 'package:flutter/material.dart';

class QrPrint extends StatelessWidget {
  const QrPrint({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25),
            onPressed: () {
              Navigator.pop(context);
            },
        ),
        backgroundColor: Color(0xFFFFD640),
        title: Text(
          'QR Send',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        // Teks di tengah
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(
            'Apologies, this feature is still under development with the owner.\n',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ), 
          Text(
            'Please check back later for updates.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )
          )
          ]
        ),
      ),
    );
  }
}