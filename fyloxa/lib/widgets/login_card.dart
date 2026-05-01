import 'dart:ui';
import 'package:flutter/material.dart';
import '../screens/home_page.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  bool otpSent = false;
  bool loading = false;

  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> images = [
    "https://res.cloudinary.com/dieboinjz/image/upload/v1777622582/ChatGPT_Image_May_1_2026_01_25_24_PM_kgmsm2.png",
    "https://res.cloudinary.com/dieboinjz/image/upload/v1777622582/ChatGPT_Image_May_1_2026_01_25_24_PM_kgmsm2.png",
    "https://res.cloudinary.com/dieboinjz/image/upload/v1777622582/ChatGPT_Image_May_1_2026_01_25_24_PM_kgmsm2.png",
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
        const SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  void showEmailLoginSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Login with Email",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 🔥 IMAGE SWIPER SECTION
          SizedBox(
            height: h * 0.65,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        images[index],
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),

                // 🔥 DOT INDICATOR
// 🔥 DOT INDICATOR (FIXED)
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(images.length, (index) {
    final isActive = currentPage == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.white
            : Colors.white.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.white24,
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ]
            : null,
      ),
    );
  }),
),
              ],
            ),
          ),

          // 🔥 LOGIN CARD
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: h * 0.35),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      otpSent ? "Verify OTP " : "Welcome Back ",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      otpSent
                          ? "Enter OTP sent to your number"
                          : "Login to continue your fitness journey",
                      style: const TextStyle(color: Colors.black54),
                    ),

                    const SizedBox(height: 18),

                    TextField(
                      controller: otpSent ? otpController : phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          otpSent ? Icons.lock : Icons.phone,
                        ),
                        hintText: otpSent
                            ? "Enter OTP"
                            : "Enter Mobile Number",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed:
                            loading ? null : (otpSent ? verifyOTP : sendOTP),
                        child: loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            :Text(
  otpSent ? "VERIFY OTP" : "SEND OTP",
  style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Center(
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        GestureDetector(
                          onTap: () {
                            showEmailLoginSheet(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade100,
                            ),
                            child: const Icon(
                              Icons.email_outlined,
                              size: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    const Center(
                      child: Text(
                        "By continuing, you agree to our Terms of Service and Privacy Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}