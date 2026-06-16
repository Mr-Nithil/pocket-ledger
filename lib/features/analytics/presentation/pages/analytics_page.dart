import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.lg),
            child: Text(
              'Analytics charts will arrive in Milestone 6.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
