import 'package:flutter/material.dart';

class TrialBookingScreen extends StatefulWidget {
  final Map gym;

  const TrialBookingScreen({super.key, required this.gym});

  @override
  State<TrialBookingScreen> createState() => _TrialBookingScreenState();
}

class _TrialBookingScreenState extends State<TrialBookingScreen> {

  String selectedTime = "Morning (7AM - 10AM)";

  final List<String> timeSlots = [
    "Morning (7AM - 10AM)",
    "Afternoon (12PM - 3PM)",
    "Evening (5PM - 9PM)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Book Trial"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// GYM NAME
            Text(
              widget.gym["name"],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 PAID TRIAL INFO
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.workspace_premium, color: Color(0xFF2563EB)),
                  SizedBox(width: 8),
                  Text(
                    "7 Days Trial @ ₹7 only",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2563EB),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// SELECT TIME
            const Text(
              "Select Time Slot",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            ...timeSlots.map((slot) {
              return RadioListTile(
                value: slot,
                groupValue: selectedTime,
                onChanged: (value) {
                  setState(() {
                    selectedTime = value.toString();
                  });
                },
                title: Text(slot),
              );
            }).toList(),

            const Spacer(),

            /// 💳 PAY BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Proceeding to pay ₹7 for trial ($selectedTime) 💳",
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Pay ₹7 & Start Trial",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}