import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class TravelPreferencesScreen extends StatefulWidget {
  const TravelPreferencesScreen({super.key});

  @override
  State<TravelPreferencesScreen> createState() => _TravelPreferencesScreenState();
}

class _TravelPreferencesScreenState extends State<TravelPreferencesScreen> {
  int _selectedSeat = 0; // 0: Window, 1: Aisle, 2: Any
  bool _directFlights = false;
  bool _priceDrop = true;
  bool _gateDelay = true;

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
                    child: Text('Travel Preferences', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
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
                    _buildSectionHeader('Flights'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildListTile('Cabin class', rightText: 'Economy'),
                          _buildDivider(),
                          _buildSeatSelector(),
                          _buildDivider(),
                          _buildListTile('Meal', rightText: 'Vegetarian'),
                          _buildDivider(),
                          _buildSwitchTile('Direct flights only', 'Hide results with stopovers', _directFlights, (val) => setState(() => _directFlights = val)),
                          _buildDivider(),
                          _buildListTile('Preferred airlines'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Stays'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildListTile('Room type'),
                          _buildDivider(),
                          _buildListTile('Minimum rating'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildSectionHeader('Alerts'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildSwitchTile('Price drop alerts', null, _priceDrop, (val) => setState(() => _priceDrop = val)),
                          _buildDivider(),
                          _buildSwitchTile('Gate & delay updates', null, _gateDelay, (val) => setState(() => _gateDelay = val)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Reset Button
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: const Center(
                        child: Text('Reset to defaults', style: TextStyle(color: AppTheme.textColorLight, fontSize: 16, fontWeight: FontWeight.w500)),
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

  Widget _buildSeatSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Seat', style: TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F9),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                _buildSegment(0, 'Window'),
                _buildSegment(1, 'Aisle'),
                _buildSegment(2, 'Any'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSegment(int index, String text) {
    bool isSelected = _selectedSeat == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedSeat = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))] : [],
          ),
          child: Center(
            child: Text(
              text, 
              style: TextStyle(
                color: isSelected ? AppTheme.primaryBlue : AppTheme.textColorLight, 
                fontSize: 14, 
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400
              ),
            ),
          ),
        ),
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
