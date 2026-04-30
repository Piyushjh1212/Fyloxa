import 'package:flutter/material.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  bool isYearly = false;

  // 🔥 BRAND COLOR (change if logo differs)
  final Color brandColor = const Color(0xFF2563EB); // premium blue

  // 🔥 TEXT COLORS (system)
  final Color primaryText = const Color(0xFF111827);
  final Color secondaryText = const Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF111827)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HERO
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://images.unsplash.com/photo-1571902943202-507ec2618e8f",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Go Unlimited 💪",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: primaryText,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Access gyms anytime, anywhere",
              style: TextStyle(
                color: secondaryText,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 20),

            // TOGGLE
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  toggleButton("Monthly", !isYearly),
                  toggleButton("Yearly", isYearly),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // PLAN CARD
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE5E7EB)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // BADGE
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: brandColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Most Popular",
                      style: TextStyle(
                        color: brandColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Fyloxa Premium",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: primaryText,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        isYearly ? "₹699" : "₹799",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: brandColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isYearly
                            ? "/ month (billed yearly)"
                            : "/ month",
                        style: TextStyle(
                          color: secondaryText,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  feature("Access 20+ Gyms"),
                  feature("Unlimited Entry"),
                  feature("No Restrictions"),
                  feature("Train Anytime Anywhere"),
                ],
              ),
            ),
          ],
        ),
      ),

      // CTA
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: brandColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {},
          child: Text(
            isYearly ? "Pay ₹699/month" : "Pay ₹799/month",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // TOGGLE
  Widget toggleButton(String text, bool active) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isYearly = text == "Yearly";
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: active ? const Color(0xFF111827) : const Color(0xFF9CA3AF),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // FEATURE
  Widget feature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: brandColor, size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: secondaryText,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}