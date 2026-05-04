import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Dummy data (later Firebase se replace karna)
    final List<Map<String, dynamic>> history = [
      {
        "title": "Gym Entry",
        "amount": 50,
        "credits": 1,
        "status": "Success",
        "date": DateTime.now().subtract(const Duration(hours: 2)),
      },
      {
        "title": "Gym Entry",
        "amount": 50,
        "credits": 1,
        "status": "Success",
        "date": DateTime.now().subtract(const Duration(days: 1)),
      },
      {
        "title": "Gym Entry",
        "amount": 50,
        "credits": 1,
        "status": "Failed",
        "date": DateTime.now().subtract(const Duration(days: 2)),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Transaction History"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: history.isEmpty
          ? const Center(
              child: Text("No transactions yet"),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Row(
                    children: [

                      /// STATUS ICON
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: item["status"] == "Success"
                              ? Colors.green.shade50
                              : Colors.red.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item["status"] == "Success"
                              ? Icons.check_circle
                              : Icons.error,
                          color: item["status"] == "Success"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),

                      const SizedBox(width: 12),

                      /// TEXT INFO
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${item["credits"]} Credit Used",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              DateFormat("dd MMM yyyy, hh:mm a")
                                  .format(item["date"]),
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 11),
                            ),
                          ],
                        ),
                      ),

                      /// AMOUNT
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "₹${item["amount"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item["status"],
                            style: TextStyle(
                              color: item["status"] == "Success"
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}