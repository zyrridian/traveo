import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/features/trips/presentation/screens/create_trip/create_trip_cities_screen.dart';

class CreateTripDatesScreen extends StatefulWidget {
  const CreateTripDatesScreen({super.key});

  @override
  State<CreateTripDatesScreen> createState() => _CreateTripDatesScreenState();
}

class _CreateTripDatesScreenState extends State<CreateTripDatesScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Poland Road Trip');

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
                    onTap: () => Navigator.of(context).pop(),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.05),
                      child: const Icon(
                        PhosphorIcons.arrowLeft,
                        color: AppTheme.textColor,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'New trip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance for centering
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
                    const Text(
                      'When are you\ngoing?',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.textColor,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Name Input
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: TextField(
                        controller: _nameController,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.textColor,
                        ),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            PhosphorIcons.pencilSimple,
                            color: AppTheme.textColorLight,
                            size: 20,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Custom Calendar
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xFFF7F7F9),
                                child: const Icon(
                                  PhosphorIcons.caretLeft,
                                  color: AppTheme.textColor,
                                  size: 16,
                                ),
                              ),
                              const Text(
                                'September 2026',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.textColor,
                                ),
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xFFF7F7F9),
                                child: const Icon(
                                  PhosphorIcons.caretRight,
                                  color: AppTheme.textColor,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Weekdays
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
                                .map((day) => Text(
                                      day,
                                      style: TextStyle(
                                        color: AppTheme.textColorLight.withOpacity(0.5),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          // Calendar Grid (Mocked for September 2026 as per design)
                          _buildCalendarGrid(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Summary Box
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            PhosphorIcons.calendarBlank,
                            color: AppTheme.textColorLight,
                            size: 24,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '12 Sep — 19 Sep 2026',
                                  style: TextStyle(
                                    color: AppTheme.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '8 days · 7 nights',
                                  style: TextStyle(
                                    color: AppTheme.textColorLight.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F7F9),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              'Change',
                              style: TextStyle(
                                color: AppTheme.textColorLight,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            
            // Bottom Action Area
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppTheme.textColorLight.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateTripCitiesScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // 1st of Sep 2026 is a Tuesday.
    // So Monday is 31 (greyed out).
    
    // We will build a fixed grid of 35 cells (5 rows of 7).
    final List<int?> days = [
      null, 1, 2, 3, 4, 5, 6,
      7, 8, 9, 10, 11, 12, 13,
      14, 15, 16, 17, 18, 19, 20,
      21, 22, 23, 24, 25, 26, 27,
      28, 29, 30, null, null, null, null,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final day = days[index];
        if (index == 0) {
          return Center(
            child: Text(
              '31',
              style: TextStyle(
                color: AppTheme.textColorLight.withOpacity(0.3),
                fontSize: 14,
              ),
            ),
          );
        }
        if (index >= 31) {
          return Center(
            child: Text(
              '${index - 30}',
              style: TextStyle(
                color: AppTheme.textColorLight.withOpacity(0.3),
                fontSize: 14,
              ),
            ),
          );
        }
        
        bool isStart = day == 12;
        bool isEnd = day == 19;
        bool isInRange = day! > 12 && day < 19;
        
        return Container(
          decoration: BoxDecoration(
            color: isStart || isEnd
                ? AppTheme.primaryBlue
                : isInRange
                    ? AppTheme.primaryBlue.withOpacity(0.1)
                    : Colors.transparent,
            borderRadius: BorderRadius.horizontal(
              left: isStart || day == 13 || day == 20 ? const Radius.circular(100) : Radius.zero,
              right: isEnd || day == 19 || day == 26 ? const Radius.circular(100) : Radius.zero,
            ).copyWith(
              topLeft: isStart ? const Radius.circular(100) : null,
              bottomLeft: isStart ? const Radius.circular(100) : null,
              topRight: isEnd ? const Radius.circular(100) : null,
              bottomRight: isEnd ? const Radius.circular(100) : null,
            ),
          ),
          child: Center(
            child: Text(
              '$day',
              style: TextStyle(
                color: isStart || isEnd
                    ? Colors.white
                    : isInRange
                        ? AppTheme.primaryBlue
                        : AppTheme.textColor,
                fontSize: 14,
                fontWeight: isStart || isEnd || isInRange ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}
