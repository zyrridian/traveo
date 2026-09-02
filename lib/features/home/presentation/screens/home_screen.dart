import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/constants/dummy_data.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/core/widgets/category_button.dart';
import 'package:traveo/core/widgets/stay_card.dart';
import 'package:traveo/core/widgets/traveo_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = ['Stays', 'Flights', 'Rentals', 'Tours'];
  final List<IconData> _categoryIcons = [
    Icons.home_outlined,
    Icons.flight_takeoff,
    Icons.car_rental,
    Icons.directions_walk,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppTheme.primaryBlue,
          backgroundColor: Colors.white,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150?img=11'),
                  ),
                  const Hero(
                    tag: 'traveo_logo_hero',
                    child: TraveoLogo(
                      size: 24,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppTheme.lighterGray,
                    child: const Icon(PhosphorIcons.bell, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Welcome in TraveO',
                style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ready To Find\nYour Perfect Next Trip?',
                style: TextStyle(
                  fontSize: 32,
                  // fontWeight: FontWeight.w500,
                  color: Color(0xff121212),
                  height: 1.24,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.lighterGray,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Row(
                  children: [
                    const Icon(PhosphorIcons.mapPinFill,
                        color: AppTheme.primaryBlue),
                    const SizedBox(width: 8),
                    const Text(
                      'Bali',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppTheme.textColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 1,
                      height: 24,
                      color: const Color(0xFF000000).withOpacity(.06),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Where are you going?',
                          hintStyle: TextStyle(
                              color: AppTheme.textColorLight, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(PhosphorIcons.magnifyingGlass,
                        color: Color(0xFF9CA3AF)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text(
                    'Explore ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColor,
                      height: 1.24,
                    ),
                  ),
                  Text(
                    'nearby',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColorLight,
                      height: 1.24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_categories.length, (index) {
                    return CategoryButton(
                      label: _categories[index],
                      icon: _categoryIcons[index],
                      isSelected: _selectedCategoryIndex == index,
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: DummyData.stays.length,
                itemBuilder: (context, index) {
                  return StayCard(stay: DummyData.stays[index]);
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
