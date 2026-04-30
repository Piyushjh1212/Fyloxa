import 'package:flutter/material.dart';
import 'feature_card.dart';
import '../screens/book_gym.dart';
import '../widgets/diet_plan.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF2563EB);
    const light = Color(0xFFF8FAFC);

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 0.9,
      children: [

        // 🔥 BOOK GYM
        FeatureCard(
          title: "Book Gym",
          icon: Icons.location_on,
          imagePath:
              "https://images.unsplash.com/photo-1534438327276-14e5300c3a48",
          isNetworkImage: true,
          color: primary,
          textColor: Colors.white,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  BookScreen(),
              ),
            );
          },
        ),

        // 🏋️ RENT EQUIPMENT
        FeatureCard(
          title: "Rent Equip",
          icon: Icons.sports_gymnastics,
          imagePath:
              "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61",
          isNetworkImage: true,
          color: light,
          textColor: Colors.black87,
        ),

        // 👨‍🏫 TRAINERS
        FeatureCard(
          title: "Trainers",
          icon: Icons.person,
          imagePath:
              "https://images.unsplash.com/photo-1599058917212-d750089bc07e",
          isNetworkImage: true,
          color: light,
          textColor: Colors.black87,
        ),

        // 🥗 DIET PLAN
        FeatureCard(
          title: "Diet Plan",
          icon: Icons.restaurant,
          imagePath:
              "https://images.unsplash.com/photo-1490645935967-10de6ba17061",
          isNetworkImage: true,
          color: const Color(0xFFEFF6FF),
          textColor: Colors.black87,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DietPlanScreen(),
              ),
            );
          },
        ),

        // 🧘 CLASSES
        FeatureCard(
          title: "Classes",
          icon: Icons.self_improvement,
          imagePath:
              "https://images.unsplash.com/photo-1540497077202-7c8a3999166f",
          isNetworkImage: true,
          color: light,
          textColor: Colors.black87,
        ),

        // 📊 PROGRESS
        FeatureCard(
          title: "Progress",
          icon: Icons.show_chart,
          imagePath:
              "https://images.unsplash.com/photo-1554284126-aa88f22d8b74",
          isNetworkImage: true,
          color: light,
          textColor: Colors.black87,
        ),
      ],
    );
  }
}