import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:traveo/features/profile/presentation/screens/help_support_screen.dart';
import 'package:traveo/features/profile/presentation/screens/language_currency_screen.dart';
import 'package:traveo/features/profile/presentation/screens/passengers_docs_screen.dart';
import 'package:traveo/features/profile/presentation/screens/payment_methods_screen.dart';
import 'package:traveo/features/profile/presentation/screens/plan_subscription_screen.dart';
import 'package:traveo/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:traveo/features/profile/presentation/screens/search_profile_screen.dart';
import 'package:traveo/features/profile/presentation/screens/settings_security_screen.dart';
import 'package:traveo/features/profile/presentation/screens/travel_preferences_screen.dart';
import 'package:traveo/features/profile/presentation/screens/upgrade_pro_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 48), // Balance for centering
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchProfileScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.05),
                      child: const Icon(
                        PhosphorIcons.magnifyingGlass,
                        color: AppTheme.textColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // User Identity Card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100), // Very rounded like a pill
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xFFE5E5EA), // Light grey placeholder
                        backgroundImage: const NetworkImage(
                          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&q=80&w=150',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Andrii Bielov',
                              style: TextStyle(
                                color: AppTheme.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'johndeo@gmail.com',
                              style: TextStyle(
                                color: AppTheme.textColorLight.withOpacity(0.7),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        PhosphorIcons.caretRight,
                        color: AppTheme.textColorLight,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Upgrade to Pro Card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpgradeToProScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0056FF), Color(0xFF007BFF)], // Vibrant blue gradient
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        PhosphorIcons.sparkleFill,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Upgrade to Pro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Get discounts of up to\n20% per month on every\ntrip now.',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Upgrade ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              PhosphorIcons.caretRight,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Settings Group 1
              _buildMenuGroup([
                _MenuItemData(
                  icon: PhosphorIcons.gear, 
                  title: 'Settings & Security', 
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsSecurityScreen())),
                ),
                _MenuItemData(
                  icon: PhosphorIcons.circleDashed, 
                  title: 'Plan & Subscription', 
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PlanSubscriptionScreen())),
                ),
              ]),
              const SizedBox(height: 16),

              // Settings Group 2
              _buildMenuGroup([
                _MenuItemData(
                  icon: PhosphorIcons.users, 
                  title: 'Passengers & Documents', 
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PassengersDocsScreen())),
                ),
                _MenuItemData(
                  icon: PhosphorIcons.mapPinLine, 
                  title: 'Travel Preferences', 
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TravelPreferencesScreen())),
                ),
                _MenuItemData(
                  icon: PhosphorIcons.creditCard, 
                  title: 'Payment Methods', 
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentMethodsScreen())),
                ),
              ]),
              const SizedBox(height: 16),

              // Settings Group 3
              _buildMenuGroup([
                _MenuItemData(
                  icon: PhosphorIcons.bookOpen, 
                  title: 'Language & Currency', 
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageCurrencyScreen())),
                ),
                _MenuItemData(
                  icon: PhosphorIcons.chatCircleText, 
                  title: 'Help & Support', 
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpSupportScreen())),
                ),
                _MenuItemData(
                  icon: PhosphorIcons.shieldCheck, 
                  title: 'Privacy Policy', 
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen())),
                ),
              ]),

              const SizedBox(height: 120), // Bottom padding for nav bar
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuGroup(List<_MenuItemData> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final int index = entry.key;
          final _MenuItemData item = entry.value;
          final bool isLast = index == items.length - 1;

          return Column(
            children: [
              InkWell(
                onTap: item.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Icon(
                        item.icon,
                        color: AppTheme.textColorLight.withOpacity(0.6),
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: AppTheme.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Icon(
                        PhosphorIcons.caretRight,
                        color: AppTheme.textColorLight,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 20),
                  child: Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  _MenuItemData({required this.icon, required this.title, this.onTap});
}
