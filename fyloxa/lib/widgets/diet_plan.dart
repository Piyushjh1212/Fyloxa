import 'package:flutter/material.dart';

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000814),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Diet Plan",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            "Choose Your Goal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          dietCard(
            title: "Weight Loss",
            desc: "Low calorie high protein diet plan",
            icon: Icons.fitness_center,
          ),

          dietCard(
            title: "Muscle Gain",
            desc: "High protein + high calorie diet",
            icon: Icons.bolt,
          ),

          dietCard(
            title: "Maintenance",
            desc: "Balanced diet for healthy lifestyle",
            icon: Icons.favorite,
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              "Tip: Drink 3-4L water daily & sleep 7-8 hours for best results 💪",
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Widget dietCard({
    required String title,
    required String desc,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [

          Icon(icon, color: Colors.orangeAccent),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios,
              size: 14, color: Colors.white54),
        ],
      ),
    );
  }
}