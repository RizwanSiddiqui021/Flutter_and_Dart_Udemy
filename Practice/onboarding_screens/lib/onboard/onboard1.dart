import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboard1 extends StatelessWidget {
  const Onboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/sign_up_Sign_in.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Silent", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Image.asset("assets/logo.png"),
                const SizedBox(width: 10),
                Text("Moon", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 420),
            Text(
              "We Are What We Do",
              style: GoogleFonts.aBeeZee(
                color: const Color(0xFF3F414E),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Thousand of people are usign silent moon for smalls meditation",
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                color: Color(0xFFA1A4B2),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(376, 56),
                backgroundColor: const Color(0xFF8E97FD),
              ),
              onPressed: () {},
              child: Text(
                "SIGN UP",
                style: GoogleFonts.aBeeZee(
                  color: const Color(0xFFF6F1FB),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ALREADY HAVE AN ACCOUNT?"),
                TextButton(onPressed: () {}, child: Text("LOG IN")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
