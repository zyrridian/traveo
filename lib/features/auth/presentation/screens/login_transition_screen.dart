import 'package:flutter/material.dart';
import 'package:traveo/core/theme/app_theme.dart';
import 'package:traveo/core/widgets/traveo_logo.dart';
import 'package:traveo/features/main/presentation/screens/main_screen.dart';

class LoginTransitionScreen extends StatefulWidget {
  const LoginTransitionScreen({super.key});

  @override
  State<LoginTransitionScreen> createState() => _LoginTransitionScreenState();
}

class _LoginTransitionScreenState extends State<LoginTransitionScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (context, animation, secondaryAnimation) => const MainScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Hero(
          tag: 'traveo_logo_hero',
          child: TraveoLogo(
            size: 120,
            color: AppTheme.primaryBlue,
          ),
        ),
      ),
    );
  }
}
