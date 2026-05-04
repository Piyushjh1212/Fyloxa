import 'package:flutter/material.dart';
import '../screens/membership_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final Color primary = const Color(0xFF6366F1);
  final Color secondary = const Color(0xFF22D3EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [

          const SizedBox(height: 10),

          /// ================= TOP BAR =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Row(
                children: const [
                  Icon(Icons.share, color: Colors.grey),
                  SizedBox(width: 10),
                  Icon(Icons.edit, color: Colors.grey),
                ],
              )
            ],
          ),

          const SizedBox(height: 20),

          /// ================= PROFILE =================
          Column(
            children: [

              /// PROFILE IMAGE WITH GRADIENT BORDER
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [primary, secondary],
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.edit,
                            size: 14, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 12),

              /// NAME + PRO
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Piyush Jhariya",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "PRO",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 5),

              const Text(
                "raistar@fyloxa.com",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 12),

              /// GOAL BUTTON
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text("🏁 Build Muscle & Stay Lean"),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// ================= STATS =================
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                statItem("14", "day streak"),
                statItem("87", "workouts"),
                statItem("31.4k", "kcal burned"),
              ],
            ),
          ),

          const SizedBox(height: 25),

          /// ================= MEMBERSHIP TITLE =================
          Text(
            "MEMBERSHIP",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          /// ================= MEMBERSHIP CARD =================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primary.withOpacity(0.08),
                  secondary.withOpacity(0.08)
                ],
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "FYLOXA PRO",
                      style:
                          TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MembershipScreen()),
                        );
                      },
                      child: const Text("Manage"),
                    )
                  ],
                ),

                const SizedBox(height: 4),

                const Text(
                  "Active Membership",
                  style: TextStyle(color: Colors.green),
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Renews on\n26 May 2026"),
                    Text("21 days"),
                  ],
                ),

                const SizedBox(height: 10),

                /// PROGRESS BAR
                LinearProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.green,
                ),

                const SizedBox(height: 15),

                /// FEATURES
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                  children: [
                    chip("Unlimited"),
                    chip("Priority"),
                    chip("Free Gear"),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }

  /// ================= STAT ITEM =================
  Widget statItem(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  /// ================= CHIP =================
  Widget chip(String text) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}