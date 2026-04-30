import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../trial_book/book_screen.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String selectedState = "Madhya Pradesh";
  String selectedDistrict = "Bhopal";
  bool showNearby = false;

  final Color primary = const Color(0xFF2563EB);
  final Color black = const Color(0xFF111827);
  final Color grey = const Color(0xFF6B7280);
  final Color cardBg = const Color(0xFFF9FAFB);
  final Color border = const Color(0xFFE5E7EB);

  final List<Map<String, dynamic>> gyms = [
    {
      "name": "Gold's Gym MP Nagar",
      "city": "Bhopal",
      "distance": 1.2,
      "price": "₹999/month",
      "rating": 4.8,
      "image":
          "https://images.unsplash.com/photo-1534438327276-14e5300c3a48",
    },
    {
      "name": "Fit Zone Fitness",
      "city": "Bhopal",
      "distance": 2.0,
      "price": "₹699/month",
      "rating": 4.5,
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
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        title: Text(
          "Book Gym",
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Column(
        children: [

          /// FILTER
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: _filterBox(selectedState)),
                const SizedBox(width: 8),
                Expanded(child: _filterBox(selectedDistrict)),
              ],
            ),
          ),

          SwitchListTile(
            value: showNearby,
            onChanged: (v) => setState(() => showNearby = v),
            title: Text("Nearby Gyms", style: TextStyle(color: black)),
            subtitle: Text(
              "Show gyms within 3km radius",
              style: TextStyle(color: grey, fontSize: 12),
            ),
            activeColor: primary,
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredGyms.length,
              itemBuilder: (context, index) {
                return _gymCard(filteredGyms[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// FILTER BOX
  Widget _filterBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// GYM CARD
  Widget _gymCard(Map<String, dynamic> gym) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
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

                /// TITLE
                Text(
                  gym["name"],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),

                const SizedBox(height: 8),

                /// LOCATION + PREMIUM BUTTON
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: grey,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      "${gym["distance"]} km away",
                      style: TextStyle(
                        color: grey,
                        fontSize: 12,
                      ),
                    ),

                    const Spacer(),

                    /// 🔥 PREMIUM LOCATION BUTTON
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Opening Map Location..."),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.blue.shade100,
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "View Location",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                /// RATING + PRICE
                Row(
                  children: [
                    const Icon(Icons.star,
                        size: 14, color: Colors.orange),

                    const SizedBox(width: 4),

                    Text(
                      "${gym["rating"]}",
                      style: TextStyle(color: grey, fontSize: 12),
                    ),

                    const Spacer(),

                    Text(
                      gym["price"],
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// BUTTONS
                Row(
                  children: [

                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Trial",
                          style: TextStyle(color: primary),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Book Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}