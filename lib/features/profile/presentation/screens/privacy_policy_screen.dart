import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool _analytics = true;
  bool _personalisedOffers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.05),
                      child: const Icon(PhosphorIcons.arrowLeft, color: AppTheme.textColor),
                    ),
                  ),
                  const Expanded(
                    child: Text('Privacy Policy', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
                  ),
                  const SizedBox(width: 48), // Balance
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Version Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Version 4.2', style: TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          Text('Last updated 12 June 2026', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Policy Text Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPolicyTerm('1. Data we collect', 'Account details you enter (name, email, phone), passenger and document data you save for bookings, payment tokens from our payment provider, and technical data about the device you use the app on.'),
                          const SizedBox(height: 24),
                          _buildPolicyTerm('2. How we use it', 'To create bookings with airlines and hotels, to process payments and refunds, to send trip updates, and to keep your account secure. With your consent we also send price alerts and offers.'),
                          const SizedBox(height: 24),
                          _buildPolicyTerm('3. Sharing', 'We share only what a partner needs to fulfil your booking — for example passenger names and document numbers with the airline. We never sell personal data.'),
                          const SizedBox(height: 24),
                          _buildPolicyTerm('4. Storage and retention', 'Data is stored encrypted in the EU. Booking records are kept for 7 years to meet accounting rules; saved documents are deleted as soon as you remove them.'),
                          const SizedBox(height: 24),
                          _buildPolicyTerm('5. Your rights', 'You can access, correct, export or delete your data at any time from Settings & Security, or by writing to privacy@example.com.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Toggles
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildSwitchTile('Analytics', 'Help us improve the app', _analytics, (val) => setState(() => _analytics = val)),
                          _buildDivider(),
                          _buildSwitchTile('Personalised offers', 'Based on your trip history', _personalisedOffers, (val) => setState(() => _personalisedOffers = val)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Action Buttons
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                      child: const Center(
                        child: Text('Download my data', style: TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                      child: const Center(
                        child: Text('Delete my account', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyTerm(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Text(content, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 13, height: 1.5)),
      ],
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: AppTheme.primaryBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(height: 1, color: Colors.grey.withOpacity(0.1)),
    );
  }
}
