import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onSkip;
  final VoidCallback onFinish;
  const OnboardingScreen({
    super.key,
    required this.onSkip,
    required this.onFinish,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _pageIndex = 0;
  final int _totalPages = 4;

  void _nextPage() {
    if (_pageIndex < _totalPages - 1) {
      setState(() => _pageIndex++);
    } else {
      widget.onFinish();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Onboarding Page \\${_pageIndex + 1}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: widget.onSkip, child: const Text('Skip')),
                FloatingActionButton(
                  onPressed: _nextPage,
                  child: Icon(
                    _pageIndex == _totalPages - 1
                        ? Icons.check
                        : Icons.arrow_forward,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
