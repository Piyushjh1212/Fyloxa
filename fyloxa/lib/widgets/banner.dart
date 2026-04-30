import 'package:flutter/material.dart';
import '../screens/map_screen.dart';

class AppBanner extends StatefulWidget {
  const AppBanner({super.key});

  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  final List<Map<String, dynamic>> suggestions = [
    {
      "name": "Nearby Gym",
      "lat": 23.2599,
      "lng": 77.4126,
    },
    {
      "name": "Gold Gym",
      "lat": 23.2500,
      "lng": 77.4300,
    },
    {
      "name": "Cult Fit",
      "lat": 28.4595,
      "lng": 77.0266,
    },
    {
      "name": "Anytime Fitness",
      "lat": 19.0760,
      "lng": 72.8777,
    },
  ];

  void openMap(String name, double lat, double lng) {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          gymName: name,
          gymLat: lat,
          gymLng: lng,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // 🔥 HANDLE BAR
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🔥 TITLE
          const Text(
            "Search Gyms",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 15),

          // 🔥 SEARCH BAR (NEW)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.grey),
                hintText: "Search gyms...",
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🔥 CURRENT LOCATION
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF1F2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.my_location,
                  color: Color(0xFFEF4444)),
            ),
            title: const Text(
              "Use Current Location",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            onTap: () => openMap("Current Location", 23.2599, 77.4126),
          ),

          const SizedBox(height: 10),

          // 🔥 SECTION TITLE
          Text(
            "Suggestions",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          // 🔥 SUGGESTIONS LIST
          ...suggestions.map((e) => Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,

                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.location_on,
                          color: Colors.black),
                    ),

                    title: Text(
                      e["name"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey,
                    ),

                    onTap: () => openMap(
                      e["name"],
                      e["lat"],
                      e["lng"],
                    ),
                  ),

                  Divider(color: Colors.grey.shade200),
                ],
              )),
        ],
      ),
    );
  }
}