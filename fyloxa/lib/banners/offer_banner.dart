import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/membership_screen.dart';

class OfferBanner extends StatefulWidget {
  const OfferBanner({super.key});

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  late Timer timer;

  Duration duration =
      const Duration(hours: 5, minutes: 30, seconds: 0);

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (duration.inSeconds > 0) {
        setState(() {
          duration = duration - const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(d.inHours)}:"
        "${twoDigits(d.inMinutes.remainder(60))}:"
        "${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF2563EB); // 🔵 Brand Blue
    const lightBg = Color(0xFFEFF6FF);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: lightBg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔵 BADGE
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "FYLOXA PREMIUM",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              Text(
                "50%",
                style: TextStyle(
                  color: primary,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "OFF on Membership",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Text(
            "Unlimited gym access. Train anywhere anytime ",
            style: TextStyle(
              color: Color(0xFF4B5563), // modern grey
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 12),

          // ⏳ TIMER
          Row(
            children: [
              const Icon(Icons.timer, size: 16, color: primary),
              const SizedBox(width: 6),
              Text(
                "Ends in ${formatTime(duration)}",
                style: const TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // 🚀 CTA
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MembershipScreen(),
                  ),
                );
              },
              child: const Text(
                "Unlock Offer",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}