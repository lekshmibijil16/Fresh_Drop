import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();

    // Move to login screen after 3 seconds
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE8F8E8),
              Color(0xFFFFFFFF),
              Color(0xFFFFF4D6),
            ],
          ),
        ),
        child: Stack(
          children: [

            // Top right decorative circle
            Positioned(
              top: -70,
              right: -60,
              child: Container(
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFB7E4C7).withOpacity(0.6),
                ),
              ),
            ),

            // Bottom left decorative circle
            Positioned(
              bottom: -80,
              left: -70,
              child: Container(
                height: 210,
                width: 210,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFFFD166).withOpacity(0.45),
                ),
              ),
            ),

            // Main content
            Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: child,
                    ),
                  );
                },

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Grocery image area
                    Container(
                      height: 230,
                      width: 230,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.15),
                            blurRadius: 25,
                            spreadRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://images.unsplash.com/photo-1542838132-92c53300491e?w=800',
                          fit: BoxFit.cover,
                          loadingBuilder:
                              (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }

                            return const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF2E7D32),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.shopping_basket_rounded,
                              size: 100,
                              color: Color(0xFF43A047),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // App name
                    const Text(
                      'Fresh Drop',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Tagline
                    const Text(
                      'Freshness delivered to your door',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF607D68),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 35),

                    // Small colorful food icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        _foodIcon(
                          '🍎',
                          const Color(0xFFFFE0E0),
                        ),

                        const SizedBox(width: 14),

                        _foodIcon(
                          '🥕',
                          const Color(0xFFFFE7D1),
                        ),

                        const SizedBox(width: 14),

                        _foodIcon(
                          '🥦',
                          const Color(0xFFDFF5E1),
                        ),

                        const SizedBox(width: 14),

                        _foodIcon(
                          '🍊',
                          const Color(0xFFFFF0D5),
                        ),
                      ],
                    ),

                    const SizedBox(height: 45),

                    // Loading indicator
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: const Color(0xFF43A047),
                        backgroundColor:
                        const Color(0xFF43A047).withOpacity(0.12),
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Getting fresh items ready...',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Version text
            Positioned(
              bottom: 25,
              left: 0,
              right: 0,
              child: const Text(
                'Fresh Drop • Fresh groceries, happy life',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodIcon(String emoji, Color backgroundColor) {
    return Container(
      height: 48,
      width: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        emoji,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}