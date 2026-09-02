import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/features/budget/presentation/screens/add_expense_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int _selectedFilter = 0; // 0: By category, 1: By person, 2: All expenses

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
                    onTap: () => Navigator.pop(context), // Though it might be root in tab, left it if pushed
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.05),
                      child: const Icon(PhosphorIcons.arrowLeft, color: AppTheme.textColor),
                    ),
                  ),
                  const Expanded(
                    child: Text('Budget', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.textColor)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddExpenseScreen(),
                        ),
                      );
                    },
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
                    // Summary Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF141414), // Dark sleek card
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('\$760.00', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 4),
                                  Text('left of \$2,000 trip budget', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 13)),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(100)),
                                child: const Text('62% used', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Progress Bar
                          Stack(
                            children: [
                              Container(height: 6, decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(100))),
                              FractionallySizedBox(
                                widthFactor: 0.62,
                                child: Container(height: 6, decoration: BoxDecoration(color: AppTheme.primaryBlue, borderRadius: BorderRadius.circular(100))),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Stats
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Spent', style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12)),
                                      const SizedBox(height: 4),
                                      const Text('\$1,240', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Per person', style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12)),
                                      const SizedBox(height: 4),
                                      const Text('\$310', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Days left', style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12)),
                                      const SizedBox(height: 4),
                                      const Text('5', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Filters
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildFilterPill(0, 'By category'),
                          const SizedBox(width: 8),
                          _buildFilterPill(1, 'By person'),
                          const SizedBox(width: 8),
                          _buildFilterPill(2, 'All expenses'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Categories
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildCategoryTile('Stays', '3 bookings', '\$620', 0.8, const Color(0xFF4CAF50), const Color(0xFFE8F5E9), PhosphorIcons.bed),
                          _buildDivider(),
                          _buildCategoryTile('Transport', '7 expenses', '\$318', 0.4, const Color(0xFF2196F3), const Color(0xFFE3F2FD), PhosphorIcons.car),
                          _buildDivider(),
                          _buildCategoryTile('Food', '12 expenses', '\$196', 0.6, const Color(0xFFFF9800), const Color(0xFFFFF3E0), PhosphorIcons.forkKnife),
                          _buildDivider(),
                          _buildCategoryTile('Activities', '4 tickets', '\$106', 0.3, const Color(0xFF9C27B0), const Color(0xFFF3E5F5), PhosphorIcons.ticket),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    Text('Who owes whom', style: TextStyle(color: AppTheme.textColorLight.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 16),
                    
                    // Debts
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          _buildDebtTile('Kate owes you', 'for the hotel and taxi', '\$142.00', Colors.green, true, 'https://i.pravatar.cc/150?u=2'),
                          _buildDivider(),
                          _buildDebtTile('You owe Denys', 'for the dinner', '\$38.50', Colors.red, false, 'https://i.pravatar.cc/150?u=3'),
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AddExpenseScreen()));
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(color: AppTheme.primaryBlue, borderRadius: BorderRadius.circular(100)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(PhosphorIcons.plus, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text('Add expense', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterPill(int index, String title) {
    bool isSelected = _selectedFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: isSelected ? null : Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textColorLight,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTile(String title, String subtitle, String amount, double progress, Color barColor, Color iconBg, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: iconBg,
            child: Icon(icon, color: barColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w500)),
                    Text(amount, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Container(height: 4, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(100))),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(height: 4, decoration: BoxDecoration(color: barColor, borderRadius: BorderRadius.circular(100))),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(subtitle, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDebtTile(String title, String subtitle, String amount, Color amountColor, bool canRemind, String imageUrl) {
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
                Text(title, style: const TextStyle(color: AppTheme.textColor, fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppTheme.textColorLight, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: TextStyle(color: amountColor, fontSize: 16, fontWeight: FontWeight.w600)),
              if (canRemind) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFFF7F7F9), borderRadius: BorderRadius.circular(100)),
                  child: const Text('Remind', style: TextStyle(color: AppTheme.textColorLight, fontSize: 12, fontWeight: FontWeight.w500)),
                ),
              ],
            ],
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
