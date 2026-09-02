class StayModel {
  final String id;
  final String title;
  final String location;
  final String locationTag;
  final String imageUrl;
  final double rating;
  final int price;
  final List<String> tags;

  StayModel({
    required this.id,
    required this.title,
    required this.location,
    required this.locationTag,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.tags,
  });
}
