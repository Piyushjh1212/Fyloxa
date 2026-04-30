import 'package:flutter/material.dart';
import '../../controller/language_controller.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "English";

  final languages = [
    {"name": "English", "code": "en"},
    {"name": "हिंदी", "code": "hi"},
    {"name": "ગુજરાતી", "code": "gu"},
    {"name": "मराठी", "code": "mr"},
    {"name": "தமிழ்", "code": "ta"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Language")),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final lang = languages[index];

                return ListTile(
                  title: Text(lang["name"]!),

                  trailing: selectedLanguage == lang["name"]
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,

                  onTap: () {
                    setState(() {
                      selectedLanguage = lang["name"]!;
                    });
                  },
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: ElevatedButton(
              onPressed: () {
                final selected = languages.firstWhere(
                  (e) => e["name"] == selectedLanguage,
                );

                // ✅ FINAL FIX (NO ERROR EVER)
                LanguageController.instance.changeLanguage(
                  Locale(selected["code"]!),
                );

                Navigator.pop(context);
              },

              child: const Text("Apply Language"),
            ),
          ),
        ],
      ),
    );
  }
}