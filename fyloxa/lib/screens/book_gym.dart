import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'map_screen.dart';

class BookGym extends StatefulWidget {
  const BookGym({super.key});

  @override
  State<BookGym> createState() => _BookGymState();
}

class _BookGymState extends State<BookGym> {
  String selectedState = "Madhya Pradesh";
  String selectedDistrict = "Bhopal";
  bool showNearby = false;

  final Color brandColor = const Color(0xFF2563EB);

  final Color textPrimary = const Color(0xFF111827);
  final Color textSecondary = const Color(0xFF6B7280);
  final Color bg = Colors.white;
  final Color cardBg = const Color(0xFFF9FAFB);
  final Color border = const Color(0xFFE5E7EB);

  final List<Map<String, dynamic>> gyms = [
    {
      "name": "Gold's Gym MP Nagar",
      "city": "Bhopal",
      "distance": 1.2,
      "price": "₹999/month",
      "rating": 4.8,
      "lat": 23.2599,
      "lng": 77.4126,
      "image":
          "https://images.unsplash.com/photo-1534438327276-14e5300c3a48",
    },
    {
      "name": "Fit Zone Fitness",
      "city": "Bhopal",
      "distance": 2.0,
      "price": "₹699/month",
      "rating": 4.5,
      "lat": 23.2500,
      "lng": 77.4300,
      "image":
          "https://images.unsplash.com/photo-1517836357463-d25dfeac3438",
    },
  ];

  List<Map<String, dynamic>> get filteredGyms {
    return gyms.where((g) {
      if (g["city"] != selectedDistrict) return false;
      if (showNearby && g["distance"] > 3) return false;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        title: Text(
          "Book Gym",
          style: TextStyle(
            color: textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Column(
        children: [

          // FILTER BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: selectorBox(selectedState)),
                const SizedBox(width: 8),
                Expanded(child: selectorBox(selectedDistrict)),
              ],
            ),
          ),

          // NEARBY SWITCH
          SwitchListTile(
            value: showNearby,
            onChanged: (v) => setState(() => showNearby = v),
            title: Text(
              "Nearby Gyms",
              style: TextStyle(
                color: textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            activeColor: brandColor,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredGyms.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return gymCard(filteredGyms[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // FILTER BOX
  Widget selectorBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
      ),
    );
  }

  // GYM CARD
  Widget gymCard(Map<String, dynamic> gym) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: gym["image"],
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  gym["name"],
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: textPrimary,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 14, color: textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      "${gym["distance"]} km",
                      style: TextStyle(color: textSecondary),
                    ),
                    const Spacer(),
                    const Icon(Icons.star,
                        size: 14, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(
                      "${gym["rating"]}",
                      style: TextStyle(color: textSecondary),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  gym["price"],
                  style: TextStyle(
                    color: brandColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 10),

                // BUTTONS
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: border),
                          foregroundColor: textPrimary,
                        ),
                        onPressed: () {},
                        child: const Text("Trial"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brandColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Text("Book"),
                      ),
                    ),
                  ],
                ),

                locationCTA(gym),
              ],
            ),
          )
        ],
      ),
    );
  }

  // LOCATION CTA
  Widget locationCTA(Map<String, dynamic> gym) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MapScreen(
              gymName: gym["name"],
              gymLat: gym["lat"],
              gymLng: gym["lng"],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: border),
        ),
        child: Row(
          children: [

            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: brandColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.location_on,
                  color: brandColor),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "View Location",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Open in map",
                    style: TextStyle(
                      fontSize: 12,
                      color: textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}