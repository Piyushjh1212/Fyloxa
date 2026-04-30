import 'package:flutter/material.dart';

class PaymentSystem extends StatefulWidget {
  const PaymentSystem({super.key});

  @override
  State<PaymentSystem> createState() => _PaymentSystemState();
}

class _PaymentSystemState extends State<PaymentSystem> {
  String selectedPayment = "UPI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000814),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 📦 ORDER SUMMARY
              const Text(
                "Order Summary",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gym Membership",
                            style: TextStyle(color: Colors.white70)),
                        Text("₹799",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tax",
                            style: TextStyle(color: Colors.white70)),
                        Text("₹99",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 💳 PAYMENT OPTIONS
              const Text(
                "Payment Method",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              paymentTile("UPI", Icons.qr_code),
              paymentTile("Card", Icons.credit_card),
              paymentTile("Wallet", Icons.account_balance_wallet),

              const SizedBox(height: 30),

              // 🔥 PAY BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF1E3A8A),
                        Color(0xFF2563EB),
                        Color(0xFF3B82F6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      "PAY NOW",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔘 PAYMENT TILE WIDGET
  Widget paymentTile(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selectedPayment == title
              ? const Color(0xFF1E3A8A)
              : const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedPayment == title
                ? const Color(0xFF3B82F6)
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}