import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class UpgradeToProScreen extends StatefulWidget {
  const UpgradeToProScreen({super.key});

  @override
  State<UpgradeToProScreen> createState() => _UpgradeToProScreenState();
}

class _UpgradeToProScreenState extends State<UpgradeToProScreen> {
  bool _isYearly = true;

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
                    child: Text('Upgrade to Pro', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
                  ),
                  const SizedBox(width: 48), // Balance
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    // Pro Banner
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF0056FF), Color(0xFF007BFF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(PhosphorIcons.sparkleFill, color: Colors.white, size: 32),
                          const SizedBox(height: 16),
                          const Text('Save up to 20% on every trip', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 8),
                          Text(
                            'Pro members get member fares, free cancellation and priority support on all bookings.',
                            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Pricing Toggles
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _isYearly = true),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _isYearly ? AppTheme.primaryBlue : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Yearly', style: TextStyle(color: _isYearly ? Colors.white.withOpacity(0.8) : AppTheme.textColorLight, fontSize: 12)),
                                      Icon(
                                        _isYearly ? PhosphorIcons.radioButtonFill : PhosphorIcons.circle,
                                        color: _isYearly ? Colors.white : AppTheme.textColorLight.withOpacity(0.5),
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text('\$79.99', style: TextStyle(color: _isYearly ? Colors.white : AppTheme.textColor, fontSize: 24, fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 4),
                                  Text('\$6.66 / month - save 33%', style: TextStyle(color: _isYearly ? Colors.white.withOpacity(0.8) : AppTheme.textColorLight, fontSize: 10)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _isYearly = false),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: !_isYearly ? AppTheme.primaryBlue : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Monthly', style: TextStyle(color: !_isYearly ? Colors.white.withOpacity(0.8) : AppTheme.textColorLight, fontSize: 12)),
                                      Icon(
                                        !_isYearly ? PhosphorIcons.radioButtonFill : PhosphorIcons.circle,
                                        color: !_isYearly ? Colors.white : AppTheme.textColorLight.withOpacity(0.5),
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text('\$9.99', style: TextStyle(color: !_isYearly ? Colors.white : AppTheme.textColor, fontSize: 24, fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 4),
                                  Text('Billed every month', style: TextStyle(color: !_isYearly ? Colors.white.withOpacity(0.8) : AppTheme.textColorLight, fontSize: 10)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Benefits List
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildBenefit('Member fares up to 20% cheaper'),
                          _buildDivider(),
                          _buildBenefit('Free cancellation within 24 h'),
                          _buildDivider(),
                          _buildBenefit('Priority 24/7 support'),
                          _buildDivider(),
                          _buildBenefit('Two free seat upgrades a year'),
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
              child: const Center(
                child: Text('Start 7-day free trial', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Then \$79.99 per year. Cancel anytime in Plan & Subscription.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.6), fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefit(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(color: const Color(0xFFE3F2FD), shape: BoxShape.circle),
            child: const Icon(PhosphorIcons.check, color: AppTheme.primaryBlue, size: 12),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(text, style: const TextStyle(color: AppTheme.textColor, fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 1, color: Colors.grey.withOpacity(0.1));
  }
}
