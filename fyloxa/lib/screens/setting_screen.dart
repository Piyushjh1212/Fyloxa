import 'package:flutter/material.dart';
import './Support/Support_Help_screen.dart';
import './Support/language_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [

            // 🔥 HEADER
            const Text(
              "Settings",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            // ================= ACCOUNT =================
            sectionTitle("Account"),
            settingItem(Icons.person, "Edit Profile"),
            settingItem(Icons.lock, "Change Password"),
            settingItem(Icons.email, "Email Settings"),

            const SizedBox(height: 20),

            // ================= APP SETTINGS =================
            sectionTitle("App Settings"),
            settingItem(Icons.notifications, "Notifications"),
            settingItem(Icons.dark_mode, "Theme"),

            settingItem(
              Icons.language,
              "Language",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguageScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // ================= SUPPORT =================
            sectionTitle("Support"),
            settingItem(
              Icons.help,
              "Help & Support",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpSupportPage(),
                  ),
                );
              },
            ),

            settingItem(Icons.info, "About App"),

            const SizedBox(height: 30),

            // ================= LOGOUT =================
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Logout"),
                    content: const Text(
                      "Are you sure you want to logout?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(
                            '/login',
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ================= MODERN ITEM =================
  Widget settingItem(IconData icon, String title,
      {VoidCallback? onTap}) {
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
            child: Icon(icon, color: Colors.black),
          ),

          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),

          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Colors.grey,
          ),

          onTap: onTap,
        ),

        // subtle divider (modern look)
        Divider(
          height: 1,
          color: Colors.grey.shade200,
        ),
      ],
    );
  }

  // ================= SECTION TITLE =================
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}