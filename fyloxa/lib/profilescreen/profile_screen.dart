import 'package:flutter/material.dart';
import '../screens/membership_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final Color primary = const Color(0xFF6366F1); // 🔥 brand color
  final Color secondary = const Color(0xFF22D3EE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [

          const SizedBox(height: 10),

          // ================= HEADER =================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [

                // 🔥 GRADIENT AVATAR
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [primary, secondary],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Piyush Jhariya",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "9876543210",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.black),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= MEMBERSHIP CARD =================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primary.withOpacity(0.1), secondary.withOpacity(0.1)],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Icon(Icons.workspace_premium, color: primary),

                const SizedBox(width: 10),

                const Expanded(
                  child: Text(
                    "Upgrade to PRO",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                // 🔥 GRADIENT BUTTON
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primary, secondary],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MembershipScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Upgrade",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= STATS =================
          Row(
            children: [
              Expanded(child: statCard("Free", "Plan")),
              const SizedBox(width: 10),
              Expanded(child: statCard("—", "Validity")),
              const SizedBox(width: 10),
              Expanded(child: statCard("Inactive", "Status")),
            ],
          ),

          const SizedBox(height: 25),

          // ================= BOOKINGS =================
          sectionTitle("My Bookings"),

          bookingItem("Gold Gym", "Today 6 PM"),
          bookingItem("Power House", "Tomorrow 7 AM"),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ================= STAT CARD =================
  Widget statCard(String value, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ================= BOOKING ITEM =================
  Widget bookingItem(String gym, String time) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.fitness_center, color: Colors.black),
          ),
          title: Text(
            gym,
            style: const TextStyle(color: Colors.black),
          ),
          trailing: Text(
            time,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        Divider(color: Colors.grey.shade200),
      ],
    );
  }

  // ================= SECTION TITLE =================
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}