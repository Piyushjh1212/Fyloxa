import 'dart:ui';
import 'package:flutter/material.dart';

class FeatureCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final bool isNetworkImage;
  final Color color;
  final Color textColor;
  final IconData icon;
  final VoidCallback? onTap;

  const FeatureCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.isNetworkImage = false,
    required this.color,
    this.textColor = Colors.white,
    required this.icon,
    this.onTap,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = 0.96),
      onTapUp: (_) => setState(() => scale = 1),
      onTapCancel: () => setState(() => scale = 1),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 120),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              children: [

                // 🔥 IMAGE BACKGROUND
                Positioned.fill(
                  child: widget.isNetworkImage
                      ? Image.network(
                          widget.imagePath,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(widget.imagePath, fit: BoxFit.cover),
                ),

                // 🔥 DARK GRADIENT
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),

                // 🔥 GLASS EFFECT (TOP ICON)
                Positioned(
                  top: 10,
                  left: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                // 🔥 TITLE
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}