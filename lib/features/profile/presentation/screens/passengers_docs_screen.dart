import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class PassengersDocsScreen extends StatelessWidget {
  const PassengersDocsScreen({super.key});

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
                    child: Text('Passengers & Docs', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.black.withOpacity(0.05),
                    child: const Icon(PhosphorIcons.plus, color: AppTheme.textColor),
                  ),
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
                    _buildSectionHeader('Saved passengers'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildPassengerTile('Andrii Bielov', 'Adult · Passport FE····12', 'https://i.pravatar.cc/150?u=a', isYou: true),
                          _buildDivider(),
                          _buildPassengerTile('Olena Bielov', 'Adult · Passport FE····47', 'https://i.pravatar.cc/150?u=b'),
                          _buildDivider(),
                          _buildPassengerTile('Mark Bielov', 'Child, 12 y.o. · No document', 'https://i.pravatar.cc/150?u=c'),
                          _buildDivider(),
                          _buildAddTile('Add passenger', PhosphorIcons.plus),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Documents'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildDocTile('Passport', 'Valid', const Color(0xFFE8F5E9), Colors.green, 'Andrii Bielov · FE 445 512', 'exp. 09/2031'),
                          _buildDivider(),
                          _buildDocTile('Passport', 'Expires in 4 mo', const Color(0xFFFFF3E0), Colors.orange, 'Olena Bielov · FE 771 047', 'exp. 12/2026'),
                          _buildDivider(),
                          _buildDocTile('Visa · Schengen C', 'Valid', const Color(0xFFE8F5E9), Colors.green, 'Andrii Bielov · multi-entry', 'exp. 03/2028'),
                          _buildDivider(),
                          _buildAddDocTile(),
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

  Widget _buildPassengerTile(String name, String subtitle, String imageUrl, {bool isYou = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
                    if (isYou) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                        child: const Text('You', style: TextStyle(color: AppTheme.textColorLight, fontSize: 10, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
              ],
            ),
          ),
          const Icon(PhosphorIcons.caretRight, color: AppTheme.textColorLight, size: 20),
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.grey.withOpacity(0.2))),
            child: Icon(icon, color: AppTheme.primaryBlue, size: 16),
          ),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(color: AppTheme.primaryBlue, fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
  
  Widget _buildDocTile(String title, String badgeText, Color badgeBg, Color badgeColor, String subtitle, String rightText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: badgeBg, borderRadius: BorderRadius.circular(4)),
                child: Text(badgeText, style: TextStyle(color: badgeColor, fontSize: 10, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subtitle, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
              Text(rightText, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildAddDocTile() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(16),
        ),
        // we use a simple dashed look by just having a border and a light bg in real life, 
        // for here a solid very light border
        child: Row(
          children: [
            const Icon(PhosphorIcons.plus, color: AppTheme.textColorLight, size: 20),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Add document', style: TextStyle(color: AppTheme.textColor, fontSize: 14, fontWeight: FontWeight.w500)),
                Text('Scan a passport, ID or visa', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 12)),
              ],
            ),
          ],
        ),
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
