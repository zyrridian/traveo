import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class SettingsSecurityScreen extends StatefulWidget {
  const SettingsSecurityScreen({super.key});

  @override
  State<SettingsSecurityScreen> createState() => _SettingsSecurityScreenState();
}

class _SettingsSecurityScreenState extends State<SettingsSecurityScreen> {
  bool _faceId = true;
  bool _twoFactor = true;
  bool _pushNotifications = true;
  bool _emailOffers = false;

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
                    child: Text('Settings & Security', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
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
                    _buildSectionHeader('Account'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildListTile('Change password', rightText: 'Updated 3 mo ago'),
                          _buildDivider(),
                          _buildListTile('Email address', rightText: 'johndeo@gmail.com'),
                          _buildDivider(),
                          _buildListTile('Phone number', rightText: '+380 67 -- 03'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Security'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildSwitchTile('Face ID sign-in', 'Unlock the app with biometrics', _faceId, (val) => setState(() => _faceId = val)),
                          _buildDivider(),
                          _buildSwitchTile('Two-factor authentication', 'Code by SMS on new devices', _twoFactor, (val) => setState(() => _twoFactor = val)),
                          _buildDivider(),
                          _buildListTile('Trusted devices', rightText: '3 active'),
                          _buildDivider(),
                          _buildListTile('Login activity'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Notifications'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildSwitchTile('Push notifications', null, _pushNotifications, (val) => setState(() => _pushNotifications = val)),
                          _buildDivider(),
                          _buildSwitchTile('Email offers', null, _emailOffers, (val) => setState(() => _emailOffers = val)),
                          _buildDivider(),
                          _buildListTile('Log out'),
                          _buildDivider(),
                          _buildListTile('Delete account', textColor: Colors.red),
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

  Widget _buildListTile(String title, {String? rightText, Color textColor = AppTheme.textColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          if (rightText != null) ...[
            Text(rightText, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
            const SizedBox(width: 8),
          ],
          if (textColor != Colors.red && title != 'Log out')
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
