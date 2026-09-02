import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class AccessRightsBottomSheet extends StatefulWidget {
  final String name;
  final String email;
  final String? imageUrl;
  final String initialRole;

  const AccessRightsBottomSheet({
    super.key,
    required this.name,
    required this.email,
    this.imageUrl,
    required this.initialRole,
  });

  @override
  State<AccessRightsBottomSheet> createState() => _AccessRightsBottomSheetState();
}

class _AccessRightsBottomSheetState extends State<AccessRightsBottomSheet> {
  late String _selectedRole;

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.initialRole;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Header
            Row(
              children: [
                if (widget.imageUrl != null)
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(widget.imageUrl!),
                  )
                else
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFF6B4EE6),
                    child: Text(
                      widget.name.split(' ').map((e) => e[0]).take(2).join(),
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: const TextStyle(color: AppTheme.textColor, fontSize: 18, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 2),
                      Text(widget.email, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            Text('Access rights', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            
            // Roles
            _buildRoleTile('Owner', 'Full control, can delete the trip', PhosphorIcons.crown),
            const SizedBox(height: 12),
            _buildRoleTile('Editor', 'Can add, edit and delete events', PhosphorIcons.pencilSimple),
            const SizedBox(height: 12),
            _buildRoleTile('Viewer', 'Can only view the trip and chat', PhosphorIcons.eye),
            
            const SizedBox(height: 32),
            
            // Remove Button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE), // Light red
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  'Remove from trip',
                  style: TextStyle(
                    color: Color(0xFFF44336), // Red text
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleTile(String role, String description, IconData icon) {
    bool isSelected = _selectedRole == role;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0F7FF) : const Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppTheme.primaryBlue : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryBlue : AppTheme.textColorLight,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: TextStyle(
                      color: AppTheme.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(
                      color: AppTheme.textColorLight,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppTheme.primaryBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(PhosphorIcons.check, color: Colors.white, size: 14),
              )
            else
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1.5),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
