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
    "https://res.cloudinary.com/dieboinjz/image/upload/v1777550713/INDIA_S_GYM_BOOKING_APP_2_smtjjg.png",
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP ")),
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
    final imageHeight = h;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [

          // 🔥 BACKGROUND SWIPE IMAGES
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

          // 🔥 DARK OVERLAY
          Container(
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

          // 🔥 DOTS INDICATOR
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
            child: Container(
              width: double.infinity,
              height: h * 0.45,
              padding: const EdgeInsets.all(20),

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
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
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    otpSent
                        ? "Enter OTP sent to your number"
                        : "Login to continue your fitness journey",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // 🔥 INPUT
                  TextField(
                    controller: otpSent
                        ? otpController
                        : phoneController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Colors.black),

                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        otpSent ? Icons.lock : Icons.phone,
                        color: Colors.black54,
                      ),
                      hintText: otpSent
                          ? "Enter OTP"
                          : "Enter Mobile Number",
                      hintStyle:
                          const TextStyle(color: Colors.black45),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // 🔥 BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: loading
                          ? null
                          : (otpSent ? verifyOTP : sendOTP),

                      child: loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              otpSent ? "VERIFY OTP" : "SEND OTP",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🔥 SOCIAL LOGIN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey.shade300),
                          ),
                          child: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                            height: 26,
                            width: 26,
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey.shade300),
                          ),
                          child: const Icon(
                            Icons.email_outlined,
                            size: 26,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // 🔥 TERMS
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  "By continuing, you agree to our "),
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(
                              decoration:
                                  TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(text: ", "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              decoration:
                                  TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(text: " and "),
                          TextSpan(
                            text: "Content Policy",
                            style: TextStyle(
                              decoration:
                                  TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(text: "."),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}