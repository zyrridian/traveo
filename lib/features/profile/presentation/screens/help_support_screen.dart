import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

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
                    child: Text('Help & Support', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
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
                    // Search
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(PhosphorIcons.magnifyingGlass, color: AppTheme.textColorLight, size: 20),
                          hintText: 'Describe your problem',
                          hintStyle: TextStyle(color: AppTheme.textColorLight),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Contact Cards
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(color: AppTheme.primaryBlue, borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(PhosphorIcons.chatCircleText, color: Colors.white, size: 24),
                                const SizedBox(height: 12),
                                const Text('Live chat', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 4),
                                Text('Replies in ~2 min', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(PhosphorIcons.envelopeSimple, color: AppTheme.textColor, size: 24),
                                const SizedBox(height: 12),
                                const Text('Email us', style: TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 4),
                                const Text('Within 24 hours', style: TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    
                    _buildSectionHeader('Popular questions'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildExpandedFaq('How do I cancel a booking?', 'Open the trip in My Trips, tap Manage booking and choose Cancel. Free cancellation is available within 24 hours of purchase on Pro, and on fares marked "Refundable".'),
                          _buildDivider(),
                          _buildFaq('When will my refund arrive?'),
                          _buildDivider(),
                          _buildFaq('Can I change a passenger name?'),
                          _buildDivider(),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('All help articles', style: TextStyle(color: AppTheme.primaryBlue, fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('More'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildListTile('Report a problem with a trip'),
                          _buildDivider(),
                          _buildListTile('Call support - 24/7', rightText: '+1 888 402 11 90'),
                          _buildDivider(),
                          _buildListTile('Terms & Privacy'),
                        ],
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildFaq(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400))),
          const Icon(PhosphorIcons.plus, color: AppTheme.textColorLight, size: 20),
        ],
      ),
    );
  }

  Widget _buildExpandedFaq(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w500))),
              const Icon(PhosphorIcons.minus, color: AppTheme.textColorLight, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 14, height: 1.4)),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, {String? rightText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          if (rightText != null) ...[
            Text(rightText, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
            const SizedBox(width: 8),
          ],
          const Icon(PhosphorIcons.caretRight, color: AppTheme.textColorLight, size: 20),
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
