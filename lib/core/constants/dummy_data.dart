import 'package:traveo/core/models/stay_model.dart';

class DummyData {
  static List<StayModel> stays = [
    StayModel(
      id: '1',
      title: 'The Mulia',
      location: 'St. Regis Bali Resort',
      locationTag: 'Bali, Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&q=80&w=1000',
      rating: 4.5,
      price: 420,
      tags: ['All Inclusive', '1 King Bed', 'Butler Service', 'Garden View'],
      description:
          'Experience the epitome of luxury at The Mulia. This secluded resort offers breathtaking views and world-class amenities for a truly unforgettable stay.',
      baths: 2,
      bedrooms: 1,
      guests: 2,
      amenities: ['Free Wi-Fi', '65" HDTV', 'Washing Machine', 'Private Jaccuzi'],
      galleryUrls: [
        'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&q=80&w=1000',
        'https://images.unsplash.com/photo-1582719508461-905c673771fd?auto=format&fit=crop&q=80&w=1000',
        'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&q=80&w=1000',
      ],
    ),
    StayModel(
      id: '2',
      title: 'Kayumanis Jimbaran Estate',
      location: 'Jl. Nusa Dua Selatan, Jimbaran',
      locationTag: 'Bali, Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1582719508461-905c673771fd?auto=format&fit=crop&q=80&w=1000',
      rating: 4.8,
      price: 480,
      tags: ['All Inclusive', '1 King Bed', 'Butler Service', 'Garden View'],
      description:
          'This secluded eco-resort is tucked away in the very heart of Ubud\'s lush tropical rainforests, far from the roar of motorbikes on the main streets. There is no typical city noise here—only the singing of tropical birds...',
      baths: 2,
      bedrooms: 3,
      guests: 4,
      amenities: ['Free Wi-Fi', '65" HDTV', 'Washing Machine', 'Private Jaccuzi'],
      galleryUrls: [
        'https://images.unsplash.com/photo-1582719508461-905c673771fd?auto=format&fit=crop&q=80&w=1000',
        'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&q=80&w=1000',
        'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&q=80&w=1000',
      ],
    ),
    StayModel(
      id: '3',
      title: 'Alila Seminyak',
      location: 'Jl. Kayu Aya No. 7, Seminyak',
      locationTag: 'Bali, Indonesia',
      imageUrl:
          'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&q=80&w=1000',
      rating: 4.7,
      price: 350,
      tags: ['Ocean View', '2 Beds', 'Spa & Wellness Center', 'Private Pool'],
      description:
          'Discover an exquisite blend of contemporary architecture and traditional Balinese design at Alila Seminyak, located right on the beachfront.',
      baths: 2,
      bedrooms: 2,
      guests: 4,
      amenities: ['Free Wi-Fi', '65" HDTV', 'Washing Machine', 'Private Pool'],
      galleryUrls: [
        'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&q=80&w=1000',
        'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&q=80&w=1000',
        'https://images.unsplash.com/photo-1582719508461-905c673771fd?auto=format&fit=crop&q=80&w=1000',
      ],
    ),
  ];
}
