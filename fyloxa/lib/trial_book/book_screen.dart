import 'package:flutter/material.dart';

class GymDetailPage extends StatelessWidget {
  final Map<String, dynamic> gym;

  const GymDetailPage({super.key, required this.gym});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 IMAGE + TOP ICONS
            Stack(
              children: [
                Image.network(
                  gym["image"] ??
                      "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61",
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: _circleBtn(Icons.arrow_back, () {
                    Navigator.pop(context);
                  }),
                ),

                Positioned(
                  top: 40,
                  right: 16,
                  child: _circleBtn(Icons.share, () {}),
                ),
              ],
            ),

            /// 🔥 MAIN CARD
            Container(
              transform: Matrix4.translationValues(0, -30, 0),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME + TAGS
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          gym["name"] ?? "Gym Name",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      _tag("Verified", Colors.red.shade50, Colors.red),
                      const SizedBox(width: 6),
                      _tag("Premium", Colors.yellow.shade50, Colors.orange),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// CATEGORY
                  _pill("Strength & Cardio"),

                  const SizedBox(height: 10),

                  /// LOCATION
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        gym["location"] ?? "Bhopal, MP",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// TIME
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      const Text("5:00 AM – 11:00 PM",
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 10),
                      _pill("Open Now",
                          color: Colors.green.shade100,
                          textColor: Colors.green),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 🔥 STATS CARD
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _stat(Icons.star, "4.9", "312 reviews", Colors.orange),
                        _stat(Icons.location_on, "0.8 km", "from you", Colors.red),
                        _stat(Icons.people, "Not Busy", "crowd", Colors.green),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// ⭐ REVIEWS
                  const Text(
                    "Reviews",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Column(
                    children: const [
                      _ReviewTile(
                        name: "Rahul Sharma",
                        comment: "Great gym with modern equipment 💪",
                        rating: 5,
                      ),
                      _ReviewTile(
                        name: "Aman Verma",
                        comment: "Clean space & good trainers",
                        rating: 4,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// 📍 LOCATION MAP
                  const Text(
                    "Location",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade200,
                    ),
                    child: const Center(
                      child: Icon(Icons.location_on,
                          size: 40, color: Colors.red),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// FACILITIES
                  const Text(
                    "Facilities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      _feature("Gym"),
                      _feature("Yoga"),
                      _feature("Trainer"),
                      _feature("Shower"),
                      _feature("AC"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  const Text(
                    "About Gym",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    gym["description"] ??
                        "Premium fitness center with modern equipment and certified trainers.",
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),

      /// 🔥 BOTTOM CTA
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Book Slot ₹${gym["price"] ?? "299"}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  /// 🔘 ROUND BUTTON
  Widget _circleBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }

  /// 🏷 TAG
  Widget _tag(String text, Color bg, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }

  /// 🔵 PILL
  Widget _pill(String text,
      {Color color = const Color(0xFFE0E7FF), Color textColor = Colors.blue}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 12)),
    );
  }

  /// 📊 STAT
  Widget _stat(IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}

/// ⭐ REVIEW TILE
class _ReviewTile extends StatelessWidget {
  final String name;
  final String comment;
  final int rating;

  const _ReviewTile({
    required this.name,
    required this.comment,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Text(name[0]),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),

                Row(
                  children: List.generate(
                    rating,
                    (index) => const Icon(Icons.star,
                        size: 14, color: Colors.orange),
                  ),
                ),

                Text(comment,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// 🏷 FACILITY CHIP
class _feature extends StatelessWidget {
  final String text;
  const _feature(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}