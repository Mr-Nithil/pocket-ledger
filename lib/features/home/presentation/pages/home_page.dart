import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.lg),
        children: <Widget>[
          Text('Dashboard', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSizes.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Balance summary',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSizes.sm),
                  Text(
                    'Home dashboard charts and transaction summaries will be wired in Milestone 4.',
                    style: Theme.of(context).textTheme.bodyMedium,
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
