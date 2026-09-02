class StayModel {
  final String id;
  final String title;
  final String location;
  final String locationTag;
  final String imageUrl;
  final double rating;
  final int price;
  final List<String> tags;
  final String description;
  final int baths;
  final int bedrooms;
  final int guests;
  final List<String> amenities;
  final List<String> galleryUrls;
  StayModel({
    required this.id,
    required this.title,
    required this.location,
    required this.locationTag,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.tags,
    required this.description,
    required this.baths,
    required this.bedrooms,
    required this.guests,
    required this.amenities,
    required this.galleryUrls,
  });
}
