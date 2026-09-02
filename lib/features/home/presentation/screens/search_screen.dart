import 'package:flutter/material.dart';
import 'package:traveo/core/constants/dummy_data.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/core/widgets/category_button.dart';
import 'package:traveo/core/widgets/compact_stay_card.dart';
import 'package:traveo/core/widgets/hero_search_bar.dart';
import 'package:traveo/core/widgets/recent_search_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoading = true;
  int _selectedCategoryIndex = 0;
  final List<String> _categories = ['Stays', 'Flights', 'Rentals', 'Tours'];
  final List<IconData> _categoryIcons = [
    Icons.home_outlined,
    Icons.flight_takeoff,
    Icons.car_rental,
    Icons.directions_walk,
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeroSearchBar(
                autofocus: true,
              ),
              const SizedBox(height: 24),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      )
                    : Column(
                        key: const ValueKey('content'),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_categories.length, (index) {
                    return CategoryButton(
                      icon: _categoryIcons[index],
                      label: _categories[index],
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
              const SizedBox(height: 32),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColor,
                    ),
                  ),
                  Text(
                    'Clear all',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColorLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              RecentSearchTile(
                title: 'The Mulia',
                subtitle: 'Villas • Sep 4 - 7 • 2 guests',
                onTap: () {},
              ),
              Divider(color: Colors.grey[200], height: 1),
              RecentSearchTile(
                title: 'Kayumanis Jimbaran Estate',
                subtitle: 'Cottage • Sep 4 - 8 • 2 guests',
                onTap: () {},
              ),
              Divider(color: Colors.grey[200], height: 1),
              RecentSearchTile(
                title: 'Alila Seminyak',
                subtitle: 'Resort • Sep 10 - 15 • 2 guests',
                onTap: () {},
              ),
              const SizedBox(height: 32),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending in Bali',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColor,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.textColorLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: DummyData.stays.map((stay) {
                    return CompactStayCard(stay: stay);
                  }).toList(),
                ),
              ),
                          const SizedBox(height: 100), // Padding for bottom nav
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
