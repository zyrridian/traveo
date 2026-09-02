import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  int _selectedCategory = 0; // 0: Food, 1: Transport, 2: Stay, 3: Tickets
  int _selectedSplit = 0; // 0: Equally, 1: Shares, 2: Manual

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
                    child: Text('Add expense', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
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
                    const SizedBox(height: 16),
                    // Amount Input
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('\$', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.5), fontSize: 24, fontWeight: FontWeight.w500, height: 1.5)),
                                const SizedBox(width: 8),
                                const Text('128.00', style: TextStyle(color: AppTheme.textColor, fontSize: 48, fontWeight: FontWeight.w500)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(color: const Color(0xFFF7F7F9), borderRadius: BorderRadius.circular(100)),
                                  child: const Row(
                                    children: [
                                      Text('USD', style: TextStyle(color: AppTheme.textColorLight, fontSize: 12, fontWeight: FontWeight.w500)),
                                      SizedBox(width: 4),
                                      Icon(PhosphorIcons.caretDown, color: AppTheme.textColorLight, size: 12),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text('≈ 512.40 PLN', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    Text('Category', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 16),
                    // Category Pills
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildCategoryPill(0, 'Food', PhosphorIcons.forkKnife),
                          const SizedBox(width: 8),
                          _buildCategoryPill(1, 'Transport', PhosphorIcons.car),
                          const SizedBox(width: 8),
                          _buildCategoryPill(2, 'Stay', PhosphorIcons.bed),
                          const SizedBox(width: 8),
                          _buildCategoryPill(3, 'Tickets', PhosphorIcons.ticket),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Details
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildInputTile(PhosphorIcons.receipt, 'What for', 'Dinner at Szara Gęś'),
                          _buildDivider(),
                          _buildInputTile(PhosphorIcons.users, 'Who paid', 'Andrii (you)'),
                          _buildDivider(),
                          _buildInputTile(PhosphorIcons.calendarBlank, 'Date', '12 Sep · Day 1'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Split
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Split between 4', style: TextStyle(color: AppTheme.textColor, fontSize: 14, fontWeight: FontWeight.w500)),
                              Row(
                                children: [
                                  _buildSplitToggle(0, 'Equally'),
                                  const SizedBox(width: 4),
                                  _buildSplitToggle(1, 'Shares'),
                                  const SizedBox(width: 4),
                                  _buildSplitToggle(2, 'Manual'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildSplitMember('Andrii', '\$32.00', 'https://i.pravatar.cc/150?u=1'),
                          const SizedBox(height: 16),
                          _buildSplitMember('Kate', '\$32.00', 'https://i.pravatar.cc/150?u=2'),
                          const SizedBox(height: 16),
                          _buildSplitMember('Denys', '\$32.00', 'https://i.pravatar.cc/150?u=3'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Add receipt
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: const Color(0xFFF7F7F9),
                            child: const Icon(PhosphorIcons.camera, color: AppTheme.textColorLight, size: 20),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Add a receipt photo', style: TextStyle(color: AppTheme.textColor, fontSize: 14, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 2),
                                Text('Optional · helps when settling up', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 12)),
                              ],
                            ),
                          ),
                          const Icon(PhosphorIcons.caretRight, color: AppTheme.textColorLight, size: 20),
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
                child: Text('Add expense', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryPill(int index, String title, IconData icon) {
    bool isSelected = _selectedCategory == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : AppTheme.textColorLight, size: 16),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : AppTheme.textColorLight,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.textColorLight.withOpacity(0.5), size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Text(label, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 14)),
          ),
          Text(value, style: const TextStyle(color: AppTheme.textColor, fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          const Icon(PhosphorIcons.caretRight, color: AppTheme.textColorLight, size: 16),
        ],
      ),
    );
  }

  Widget _buildSplitToggle(int index, String title) {
    bool isSelected = _selectedSplit == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedSplit = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : const Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textColorLight,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildSplitMember(String name, String amount, String imageUrl) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(name, style: const TextStyle(color: AppTheme.textColor, fontSize: 14, fontWeight: FontWeight.w400)),
        ),
        Text(amount, style: const TextStyle(color: AppTheme.textColor, fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(height: 1, color: Colors.grey.withOpacity(0.1)),
    );
  }
}
