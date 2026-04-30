import 'dart:ui';
import 'package:flutter/material.dart';
import '../screens/home_page.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final PageController _controller = PageController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  int currentIndex = 0;
  bool otpSent = false;
  bool loading = false;

  final List<String> images = [
    "https://res.cloudinary.com/dieboinjz/image/upload/v1777318096/GacImages/cyz3mxrdqwcpjiazwrnr.jpg",
    "https://res.cloudinary.com/dieboinjz/image/upload/v1777318096/GacImages/cyz3mxrdqwcpjiazwrnr.jpg",
    "https://res.cloudinary.com/dieboinjz/image/upload/v1777318096/GacImages/cyz3mxrdqwcpjiazwrnr.jpg",
  ];

  void sendOTP() async {
    setState(() => loading = true);

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      loading = false;
      otpSent = true;
    });
  }

  void verifyOTP() {
    if (otpController.text.trim() == "1234") {
      // ✅ DIRECT HOME NAVIGATION
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP ❌")),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final imageHeight = h * 0.58;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          // 🔥 SWIPE BACKGROUND
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: PageView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              itemCount: images.length,
              onPageChanged: (i) => setState(() => currentIndex = i),
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),
          ),

          // 🔥 OVERLAY
          IgnorePointer(
            child: Container(
              height: imageHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.65),
                  ],
                ),
              ),
            ),
          ),

          // 🔥 DOTS
          Positioned(
            top: imageHeight - 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentIndex == i ? 18 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: currentIndex == i
                        ? Colors.white
                        : Colors.white54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
          ),

          // 🔥 LOGIN CARD
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  width: double.infinity,
                  height: h * 0.42,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Welcome to Fyloxa 💪",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        otpSent
                            ? "Enter OTP sent to your number"
                            : "Login to continue your fitness journey",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 🔥 INPUT FIELD
                      TextField(
                        controller: otpSent
                            ? otpController
                            : phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white),

                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            otpSent ? Icons.lock : Icons.phone,
                            color: Colors.white70,
                          ),
                          hintText: otpSent
                              ? "Enter OTP"
                              : "Enter Mobile Number",
                          hintStyle:
                              const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor:
                              Colors.white.withOpacity(0.08),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 🔥 BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: loading
                              ? null
                              : (otpSent ? verifyOTP : sendOTP),

                          child: loading
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : Text(
                                  otpSent
                                      ? "VERIFY OTP"
                                      : "SEND OTP",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}