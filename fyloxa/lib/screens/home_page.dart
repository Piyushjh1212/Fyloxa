import 'package:flutter/material.dart';
import '../widgets/banner.dart';
import '../widgets/workout_card.dart';
import '../widgets/feature_grid.dart';
import '../banners/offer_banner.dart';
import '../profilescreen/profile_screen.dart';
import '../screens/setting_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void openBanner() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AppBanner(),
    );
  }

  void showNotifications() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Notifications"),
        content: const Text("No new notifications 🚀"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // 🔥 BRAND COLORS (LOGO MATCH)
  final Color primary = const Color(0xFF6366F1); // Indigo
  final Color secondary = const Color(0xFF22D3EE); // Cyan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APP BAR =================
  appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  centerTitle: false, // 🔥 left aligned (modern look)

  title: const Text(
    "Fyloxa",
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: 0.5,
    ),
  ),

  actions: [
    IconButton(
      onPressed: showNotifications,
      icon: const Icon(
        Icons.notifications_none,
        color: Colors.black,
      ),
    ),
  ],
),

      // ================= BODY =================
      body: IndexedStack(
        index: currentIndex,
        children: [
          _homeScreen(),
          _mapScreen(),
          const ProfileScreen(),
          const SettingScreen(),
        ],
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Colors.white,
        selectedItemColor: primary, // 🔥 changed
        unselectedItemColor: Colors.grey.shade500,
        elevation: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  // ================= HOME =================
  Widget _homeScreen() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),

            // ================= SEARCH =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: openBanner,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search,
                          color: Colors.grey.shade600),
                      const SizedBox(width: 10),
                      Text(
                        "Search nearby gyms...",
                        style: TextStyle(
                            color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= OFFER =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: OfferBanner(),
            ),

            const SizedBox(height: 20),

            // ================= TEXT =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "TRAIN HARD",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Build strength, track progress & dominate your fitness goals",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= FEATURES =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FeatureGrid(),
            ),

            const SizedBox(height: 20),

            // ================= WORKOUT =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: WorkoutCard(),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= MAP =================
  Widget _mapScreen() {
    return Center(
      child: Text(
        "Map Screen",
        style: TextStyle(color: Colors.grey.shade700),
      ),
    );
  }
}