import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:traveo/core/models/stay_model.dart';
import 'package:traveo/core/theme/app_theme.dart';

class StayDetailScreen extends StatefulWidget {
  final StayModel stay;

  const StayDetailScreen({super.key, required this.stay});

  @override
  State<StayDetailScreen> createState() => _StayDetailScreenState();
}

class _StayDetailScreenState extends State<StayDetailScreen> {
  bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    final stay = widget.stay;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.55,
            child: Hero(
              tag: '${stay.id}_image',
              child: Image.network(
                stay.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Image Gradient Overlay for text readability
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.55,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),

          // Scrollable Content
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                // Top spacer for the image part
                SizedBox(
                  height: screenHeight * 0.55 - 40, // 40 is for overlap
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Custom App Bar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white.withOpacity(0.2),
                                  child: const Icon(
                                    PhosphorIcons.arrowLeft,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isFavorite = !_isFavorite;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    _isFavorite ? PhosphorIcons.heartFill : PhosphorIcons.heart,
                                    color: _isFavorite ? Colors.red : AppTheme.textColorLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // Info on image
                          Row(
                            children: [
                              const Icon(PhosphorIcons.mapPin, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                stay.locationTag,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(PhosphorIcons.arrowUpRight, color: Colors.white, size: 14),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  stay.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    '\$${stay.price}',
                                    style: const TextStyle(
                                      color: Color(0xFFFFD700),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    ' / night',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Stats row
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildStatPill(PhosphorIcons.star, stay.rating.toString()),
                                _buildStatPill(PhosphorIcons.bathtub, '${stay.baths} Bath'),
                                _buildStatPill(PhosphorIcons.bed, '${stay.bedrooms} Bedrooms'),
                                _buildStatPill(PhosphorIcons.users, '${stay.guests} Guest'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                // White Sheet Details
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppTheme.textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: AppTheme.textColorLight,
                            fontSize: 15,
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(text: stay.description),
                            const TextSpan(
                              text: ' See more',
                              style: TextStyle(
                                color: AppTheme.textColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Amenities Grid
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: stay.amenities.map((amenity) {
                          return _buildAmenityPill(amenity);
                        }).toList(),
                      ),
                      const SizedBox(height: 32),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gallery',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppTheme.textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              color: AppTheme.textColorLight,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: stay.galleryUrls.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(stay.galleryUrls[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 100), // Padding for floating action bar
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Floating Action Bar
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(PhosphorIcons.phone, color: AppTheme.textColorLight, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Call the hotel',
                            style: TextStyle(
                              color: AppTheme.textColorLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryBlue,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(PhosphorIcons.bag, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Book Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatPill(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityPill(String text) {
    IconData icon;
    if (text.toLowerCase().contains('wi-fi')) {
      icon = PhosphorIcons.wifiHigh;
    } else if (text.toLowerCase().contains('tv')) {
      icon = PhosphorIcons.television;
    } else if (text.toLowerCase().contains('wash')) {
      icon = PhosphorIcons.washingMachine;
    } else if (text.toLowerCase().contains('jaccuzi') || text.toLowerCase().contains('pool')) {
      icon = PhosphorIcons.bathtub;
    } else {
      icon = PhosphorIcons.check;
    }

    return Container(
      width: (MediaQuery.of(context).size.width - 48 - 12) / 2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F9), // Light grey matching mockup
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.textColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppTheme.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
