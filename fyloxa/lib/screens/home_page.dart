import 'package:flutter/material.dart';
import '../widgets/banner.dart';
import '../widgets/workout_card.dart';
import '../widgets/feature_grid.dart';
import '../banners/offer_banner.dart';
import '../profilescreen/profile_screen.dart';
import '../screens/scanner_screen.dart';
import '../screens/history_screen.dart';
import '../screens/setting_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final Color primary = const Color(0xFF6366F1);

  void showNotifications() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// ✅ APPBAR ONLY HOME
      appBar: currentIndex == 0
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Fyloxa",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: showNotifications,
                  icon: const Icon(Icons.notifications_none,
                      color: Colors.black),
                ),
              ],
            )
          : null,

      /// ✅ BODY
      body: IndexedStack(
        index: currentIndex,
        children: const [
          _HomeScreen(),
          ProfileScreen(),
          SettingScreen(),
          HistoryScreen(),
        ],
      ),

      /// 🔥 SCANNER FAB
      floatingActionButton: Container(
        height: 65,
        width: 65,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFF6366F1), Color(0xFF22D3EE)],
          ),
        ),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ScannerScreen(),
              ),
            );
          },
          child: const Icon(Icons.qr_code_scanner,
              size: 28, color: Colors.white),
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      /// ✅ UPDATED BOTTOM NAV (WITH LABELS)
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 12,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              /// HOME
              _navItem(Icons.home, "Home", 0),

              /// PROFILE
              _navItem(Icons.person, "Profile", 1),

              const SizedBox(width: 40),

              /// SETTINGS
              _navItem(Icons.settings, "Settings", 2),

              /// HISTORY
              _navItem(Icons.history, "History", 3),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 NAV ITEM (ICON + TEXT)
  Widget _navItem(IconData icon, String label, int index) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? primary : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? primary : Colors.grey,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔥 HOME SCREEN
class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey.shade600),
                    const SizedBox(width: 10),
                    Text(
                      "Search nearby gyms...",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: OfferBanner(),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "TRAIN HARD",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Build strength, track progress & dominate your fitness goals",
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FeatureGrid(),
            ),

            const SizedBox(height: 20),

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
}