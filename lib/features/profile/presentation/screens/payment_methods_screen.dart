import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  bool _saveCards = true;

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
                    child: Text('Payment Methods', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
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
                    _buildSectionHeader('Cards'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildCardTile('Visa ··4821', 'Expires 08/29', Colors.blue, 'Default'),
                          _buildDivider(),
                          _buildCardTile('Mastercard ··9074', 'Expires 02/28', Colors.red, null),
                          _buildDivider(),
                          _buildAddTile('Add new card', PhosphorIcons.plus),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Wallets'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildWalletTile('Apple Pay', true),
                          _buildDivider(),
                          _buildWalletTile('Google Pay', false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Billing'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildListTile('Billing address', rightText: 'Kyiv, UA'),
                          _buildDivider(),
                          _buildSwitchTile('Save cards for faster checkout', 'Encrypted, PCI DSS compliant', _saveCards, (val) => setState(() => _saveCards = val)),
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

  Widget _buildCardTile(String title, String subtitle, Color iconColor, String? badgeText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(color: iconColor, borderRadius: BorderRadius.circular(4)),
            child: const Text('VISA', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
              ],
            ),
          ),
          if (badgeText != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(100)),
              child: Text(badgeText, style: const TextStyle(color: AppTheme.primaryBlue, fontSize: 12, fontWeight: FontWeight.w500)),
            ),
          ] else ...[
            const Icon(PhosphorIcons.caretRight, color: AppTheme.textColorLight, size: 20),
          ]
        ],
      ),
    );
  }

  Widget _buildWalletTile(String title, bool connected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Icon(title.contains('Apple') ? PhosphorIcons.appleLogo : PhosphorIcons.googleLogo, color: AppTheme.textColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          Text(
            connected ? 'Connected' : 'Connect',
            style: TextStyle(
              color: connected ? Colors.green : AppTheme.primaryBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddTile(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.grey.withOpacity(0.2))),
            child: Icon(icon, color: AppTheme.primaryBlue, size: 16),
          ),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(color: AppTheme.primaryBlue, fontSize: 16, fontWeight: FontWeight.w500)),
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

  Widget _buildSwitchTile(String title, String? subtitle, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
                ],
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
