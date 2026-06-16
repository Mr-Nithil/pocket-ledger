import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app_bloc/app_bloc.dart';
import '../../app/app_bloc/app_state.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureInjection() async {
  if (getIt.isRegistered<AppBloc>()) {
    return;
  }

  final preferences = await SharedPreferences.getInstance();
  if (!getIt.isRegistered<SharedPreferences>()) {
    getIt.registerSingleton<SharedPreferences>(preferences);
  }
  if (!getIt.isRegistered<AppBloc>()) {
    final themeModeIndex =
        preferences.getInt('app.themeMode') ?? ThemeMode.system.index;
    final initialState = AppState(
      themeMode: ThemeMode.values[themeModeIndex],
      isBootstrapping: false,
      isOnboarded: preferences.getBool('app.onboarded') ?? false,
      isAuthenticated: preferences.getBool('app.authenticated') ?? false,
      isLockEnabled: preferences.getBool('app.lockEnabled') ?? false,
    );

    getIt.registerSingleton<AppBloc>(
      AppBloc(preferences, initialState),
    );
  }
}