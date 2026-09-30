import 'package:flutter/material.dart';
import 'package:freshdrop/provider/product_provider.dart';
import 'package:freshdrop/provider/wishlist_provider.dart';
import 'package:freshdrop/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';


void main() {
  runApp(const FreshlyApp());
}

class FreshlyApp extends StatelessWidget {
  const FreshlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WishlistProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fresh Drop',
        theme: AppTheme.light(),
        home: const SplashScreen(),
      ),
    );
  }
}