import 'package:flutter/material.dart';

class GymDetailPage extends StatelessWidget {
  final Map gym;

  const GymDetailPage({super.key, required this.gym});

  @override
  Widget build(BuildContext context) {
    const primary = Colors.blueAccent;
    const darkText = Color(0xFF111827);
    const greyText = Color(0xFF6B7280);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: darkText),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: Text(
            "🔥 Buy Now • ${gym["price"]}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HERO IMAGE
            Stack(
              children: [
                Image.network(
                  gym["image"],
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 280,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),

                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "POPULAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 18,
                  left: 15,
                  right: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        gym["name"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Wrap(
                        spacing: 10,
                        runSpacing: 6,
                        children: [
                          _chip("${gym["rating"]} ⭐", Colors.white),
                          _chip("${gym["distance"]} km", Colors.white),
                          _chip("Open Now", Colors.greenAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// PRICE SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Membership Plan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: darkText,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Monthly",
                          style: TextStyle(
                            fontSize: 14,
                            color: greyText,
                          ),
                        ),

                        Text(
                          "${gym["price"]}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "✔ Full access • ✔ Trainer support • ✔ Diet plan included",
                      style: TextStyle(
                        fontSize: 12,
                        color: greyText,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// FEATURES
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Facilities",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _feature("🏋️ Gym"),
                  _feature("🧘 Yoga"),
                  _feature("🥤 Nutrition"),
                  _feature("🚿 Shower"),
                  _feature("🧑‍🏫 Trainer"),
                  _feature("❄️ AC"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// DESCRIPTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "About Gym",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                gym["description"] ??
                    "Premium fitness center with modern equipment, certified trainers and personalized transformation programs designed for real results.",
                style: const TextStyle(
                  color: greyText,
                  height: 1.5,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

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
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFF111827),
        ),
      ),
    );
  }
}