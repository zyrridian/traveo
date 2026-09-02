import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  // Map of contact emails to their invite status
  final Map<String, bool> _invitedStatus = {
    'kate.m@gmail.com': true,
    'denys.k@gmail.com': true,
    'olha.s@gmail.com': false,
    'maks.i@gmail.com': false,
  };

  int get _invitedCount => _invitedStatus.values.where((v) => v).length;

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
                    child: Text('Invite friends', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.05),
                      child: const Icon(PhosphorIcons.x, color: AppTheme.textColor),
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
                    const SizedBox(height: 8),
                    const Text(
                      'Bring your\ntravel crew',
                      style: TextStyle(
                        color: AppTheme.textColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Quick Actions Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          // Link row
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xFFE3F2FD),
                                child: const Icon(PhosphorIcons.link, color: AppTheme.primaryBlue, size: 20),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Invite link · anyone with it can join', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 12)),
                                    const SizedBox(height: 2),
                                    const Text('traveo.app/j/PL-4821', style: TextStyle(color: AppTheme.textColor, fontSize: 14, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(color: AppTheme.primaryBlue, borderRadius: BorderRadius.circular(100)),
                                child: const Text('Copy', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Three big buttons
                          Row(
                            children: [
                              _buildBigActionBtn(PhosphorIcons.arrowUpRight, 'Share'),
                              const SizedBox(width: 12),
                              _buildBigActionBtn(PhosphorIcons.qrCode, 'QR code'),
                              const SizedBox(width: 12),
                              _buildBigActionBtn(PhosphorIcons.user, 'Contacts'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    Text(
                      'From your contacts',
                      style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    
                    // Contacts List
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildContactTile('Kate Melnyk', 'kate.m@gmail.com', 'https://i.pravatar.cc/150?u=2'),
                          _buildDivider(),
                          _buildContactTile('Denys Kovalenko', 'denys.k@gmail.com', 'https://i.pravatar.cc/150?u=3'),
                          _buildDivider(),
                          _buildContactTile('Olha Serhiienko', 'olha.s@gmail.com', null, color: const Color(0xFF0056FF), initials: 'OS'),
                          _buildDivider(),
                          _buildContactTile('Maks Ivanov', 'maks.i@gmail.com', null, color: const Color(0xFF007BFF), initials: 'MI'),
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(color: AppTheme.primaryBlue, borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text('Done · $_invitedCount invited', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBigActionBtn(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: const Color(0xFFF7F7F9), borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.textColorLight, size: 24),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile(String name, String email, String? imageUrl, {Color? color, String? initials}) {
    bool isInvited = _invitedStatus[email] ?? false;
    
    return Padding(
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
              backgroundColor: color ?? AppTheme.primaryBlue,
              child: Text(
                initials ?? name[0],
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
                Text(email, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _invitedStatus[email] = !isInvited;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isInvited ? AppTheme.primaryBlue : const Color(0xFFF7F7F9),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                'Invite',
                style: TextStyle(
                  color: isInvited ? Colors.white : AppTheme.textColorLight,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
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
