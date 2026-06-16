import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.lg),
            child: Text(
              'Accounts, budgets, goals, reports, and settings will be added here.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
