import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/features/trips/presentation/screens/invite_friends_screen.dart';
import 'package:traveo/features/trips/presentation/widgets/access_rights_bottom_sheet.dart';

class MembersAccessScreen extends StatelessWidget {
  const MembersAccessScreen({super.key});

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
                    child: Text('Members', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InviteFriendsScreen())),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.05),
                      child: const Icon(PhosphorIcons.plus, color: AppTheme.textColor),
                    ),
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
                    _buildSectionHeader('Poland Road Trip · 4 people'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildMemberTile(context, 'Andrii Bielov', 'You · created the trip', 'Owner', true, 'https://i.pravatar.cc/150?u=1'),
                          _buildDivider(),
                          _buildMemberTile(context, 'Kate Melnyk', 'kate.m@gmail.com', 'Editor', false, 'https://i.pravatar.cc/150?u=2'),
                          _buildDivider(),
                          _buildMemberTile(context, 'Denys Kovalenko', 'denys.k@gmail.com', 'Editor', false, 'https://i.pravatar.cc/150?u=3'),
                          _buildDivider(),
                          _buildMemberTile(context, 'Olha Serhiienko', 'olha.s@gmail.com', 'Viewer', false, null),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Pending invites'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildInviteTile('maks.i@gmail.com', 'Sent 2 days ago'),
                          _buildDivider(),
                          _buildInviteTile('+48 512 004 118', 'Sent yesterday'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InviteFriendsScreen())),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(color: AppTheme.primaryBlue, borderRadius: BorderRadius.circular(100)),
                child: const Center(
                  child: Text('Invite more people', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
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

  Widget _buildMemberTile(BuildContext context, String name, String subtitle, String role, bool isOwner, String? imageUrl) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => AccessRightsBottomSheet(
            name: name,
            email: subtitle,
            imageUrl: imageUrl,
            initialRole: role,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            if (imageUrl != null)
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(imageUrl),
              )
            else
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFF6B4EE6),
                child: Text(
                  name.split(' ').map((e) => e[0]).take(2).join(),
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isOwner ? AppTheme.primaryBlue : const Color(0xFFF7F7F9),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                role,
                style: TextStyle(
                  color: isOwner ? Colors.white : AppTheme.textColorLight,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(PhosphorIcons.caretRight, color: AppTheme.textColorLight, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInviteTile(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFF7F7F9),
            child: const Icon(PhosphorIcons.envelopeSimple, color: AppTheme.textColorLight, size: 20),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Text('Resend', style: TextStyle(color: AppTheme.textColorLight, fontSize: 12, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(width: 12),
          const Icon(PhosphorIcons.x, color: AppTheme.textColorLight, size: 20),
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
