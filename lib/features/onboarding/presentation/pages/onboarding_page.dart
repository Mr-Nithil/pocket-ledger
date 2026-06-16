import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/app_bloc/app_bloc.dart';
import '../../../../../app/app_bloc/app_event.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: AppSizes.xxl),
              Text(
                AppStrings.welcomeTitle,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                'Set up your offline-first finance tracker in a few steps.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Milestone 0 foundation is ready.',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        'Theme, router, DI, and app state are wired up.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  context.read<AppBloc>().add(
                    const AppOnboardingCompleted(lockEnabled: false),
                  );
                  context.go('/home');
                },
                child: const Text('Continue'),
              ),
              const SizedBox(height: AppSizes.sm),
              TextButton(
                onPressed: () {
                  context.read<AppBloc>().add(
                    const AppOnboardingCompleted(lockEnabled: false),
                  );
                  context.go('/home');
                },
                child: const Text('Skip setup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
