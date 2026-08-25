import 'package:flutter/material.dart';
import 'package:traveo/core/widgets/traveo_logo.dart';
import 'package:traveo/core/widgets/traveo_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const TraveoLogo(size: 32, color: Color(0xFF006AFF)),
                  IconButton(
                    icon: const Icon(Icons.info_outline, color: Colors.black45),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 48),

              const Text(
                'Enter the Code',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'We have sent the code to the phone\nnumber you provided.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOtpBox('8'),
                  _buildOtpBox('4'),
                  _buildOtpBox('2'),
                  _buildOtpBox('0'),
                  _buildOtpBox('1'),
                  _buildOtpBox('2'),
                ],
              ),

              const SizedBox(height: 24),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend code (00:39)',
                  style: TextStyle(
                    color: Color(0xFF006AFF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Continue Button
              TraveoButton(
                text: 'Continue',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpBox(String digit) {
    return Container(
      width: 48,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.red, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        digit,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
