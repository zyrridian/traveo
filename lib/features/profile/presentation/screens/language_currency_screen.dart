import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class LanguageCurrencyScreen extends StatefulWidget {
  const LanguageCurrencyScreen({super.key});

  @override
  State<LanguageCurrencyScreen> createState() => _LanguageCurrencyScreenState();
}

class _LanguageCurrencyScreenState extends State<LanguageCurrencyScreen> {
  int _selectedLang = 0;
  int _selectedCurr = 0;

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
                    child: Text('Language & Currency', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
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
                    _buildSectionHeader('App language'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildLangTile(0, 'English', 'English'),
                          _buildDivider(),
                          _buildLangTile(1, 'Ukrainian', 'Українська'),
                          _buildDivider(),
                          _buildLangTile(2, 'German', 'Deutsch'),
                          _buildDivider(),
                          _buildLangTile(3, 'Spanish', 'Español'),
                          _buildDivider(),
                          _buildLangTile(4, 'French', 'Français'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Currency'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildCurrTile(0, '\$', 'US Dollar'),
                          _buildDivider(),
                          _buildCurrTile(1, '€', 'Euro'),
                          _buildDivider(),
                          _buildCurrTile(2, '₴', 'Ukrainian Hryvnia'),
                          _buildDivider(),
                          _buildCurrTile(3, '£', 'British Pound'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Formats'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildListTile('Date format', 'DD.MM.YYYY'),
                          _buildDivider(),
                          _buildListTile('Time format', '24-hour'),
                          _buildDivider(),
                          _buildListTile('Units', 'Metric - km'),
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

  Widget _buildLangTile(int index, String title, String subtitle) {
    bool isSelected = _selectedLang == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedLang = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
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
            Icon(
              isSelected ? PhosphorIcons.checkCircleFill : PhosphorIcons.circle,
              color: isSelected ? AppTheme.primaryBlue : Colors.grey.withOpacity(0.3),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrTile(int index, String symbol, String name) {
    bool isSelected = _selectedCurr == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedCurr = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text(symbol, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(name, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
            ),
            Icon(
              isSelected ? PhosphorIcons.checkCircleFill : PhosphorIcons.circle,
              color: isSelected ? AppTheme.primaryBlue : Colors.grey.withOpacity(0.3),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String rightText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          Text(rightText, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
          const SizedBox(width: 8),
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
