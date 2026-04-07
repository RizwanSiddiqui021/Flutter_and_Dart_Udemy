import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardCgpt extends StatelessWidget {
  const OnboardCgpt({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset("assets/sign_up_Sign_in.png", fit: BoxFit.cover),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.08),

                const _LogoSection(),

                const Spacer(),

                _TitleText(),
                const SizedBox(height: 16),
                _SubtitleText(),

                const SizedBox(height: 40),

                _SignUpButton(),
                const SizedBox(height: 20),

                const _LoginRow(),

                SizedBox(height: size.height * 0.06),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------
// Individual UI Components (Clean & Reusable)
// ----------------------------------------------------

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Silent",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(width: 8),
        Image.asset("assets/logo.png", height: 32),
        const SizedBox(width: 8),
        const Text(
          "Moon",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "We Are What We Do",
      style: GoogleFonts.aBeeZee(
        color: const Color(0xFF3F414E),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Thousands of people are using Silent Moon\nfor mindfulness and meditation.",
      textAlign: TextAlign.center,
      style: GoogleFonts.aBeeZee(
        color: const Color(0xFFA1A4B2),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8E97FD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {},
        child: Text(
          "SIGN UP",
          style: GoogleFonts.aBeeZee(
            fontSize: 16,
            color: const Color(0xFFF6F1FB),
          ),
        ),
      ),
    );
  }
}

class _LoginRow extends StatelessWidget {
  const _LoginRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ALREADY HAVE AN ACCOUNT?",
          style: GoogleFonts.aBeeZee(
            fontSize: 14,
            color: const Color(0xFF3F414E),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "LOG IN",
            style: GoogleFonts.aBeeZee(
              fontSize: 14,
              color: const Color(0xFF8E97FD),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
