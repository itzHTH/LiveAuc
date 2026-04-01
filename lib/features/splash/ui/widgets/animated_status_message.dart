import 'package:flutter/material.dart';
import 'package:street_auction/core/theme/app_text_styles.dart';

const List<String> _kStatusMessages = [
  'Initializing app...',
  'Checking your session...',
  'Loading your preferences...',
  'Almost ready!',
];

class AnimatedStatusMessage extends StatefulWidget {
  const AnimatedStatusMessage({super.key});

  @override
  State<AnimatedStatusMessage> createState() => _AnimatedStatusMessageState();
}

class _AnimatedStatusMessageState extends State<AnimatedStatusMessage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _opacity;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _startCycling();
  }

  Future<void> _startCycling() async {
    await Future.delayed(const Duration(milliseconds: 400));
    for (int i = 0; i < _kStatusMessages.length; i++) {
      if (!mounted) return;
      setState(() {
        _currentIndex = i;
      });
      _controller.forward(from: 0);
      await Future.delayed(const Duration(milliseconds: 2000));

      if (!mounted) return;
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _opacity,
        child: Text(
          _kStatusMessages[_currentIndex],
          style: AppTextStyles.font14GrayRegular,
        ),
      ),
    );
  }
}
