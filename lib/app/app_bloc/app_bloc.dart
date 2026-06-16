import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._preferences, AppState initialState) : super(initialState) {
    on<AppThemeModeChanged>(_onThemeModeChanged);
    on<AppOnboardingCompleted>(_onOnboardingCompleted);
    on<AppAuthenticationChanged>(_onAuthenticationChanged);
    on<AppLockEnabledChanged>(_onLockEnabledChanged);
  }

  static const String _themeModeKey = 'app.themeMode';
  static const String _onboardedKey = 'app.onboarded';
  static const String _authenticatedKey = 'app.authenticated';
  static const String _lockEnabledKey = 'app.lockEnabled';

  final SharedPreferences _preferences;

  Future<void> _onThemeModeChanged(
    AppThemeModeChanged event,
    Emitter<AppState> emit,
  ) async {
    await _preferences.setInt(_themeModeKey, event.themeMode.index);
    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onOnboardingCompleted(
    AppOnboardingCompleted event,
    Emitter<AppState> emit,
  ) async {
    await _preferences.setBool(_onboardedKey, true);
    await _preferences.setBool(_lockEnabledKey, event.lockEnabled);
    await _preferences.setBool(_authenticatedKey, !event.lockEnabled);
    emit(
      state.copyWith(
        isOnboarded: true,
        isLockEnabled: event.lockEnabled,
        isAuthenticated: !event.lockEnabled,
      ),
    );
  }

  Future<void> _onAuthenticationChanged(
    AppAuthenticationChanged event,
    Emitter<AppState> emit,
  ) async {
    await _preferences.setBool(_authenticatedKey, event.isAuthenticated);
    emit(state.copyWith(isAuthenticated: event.isAuthenticated));
  }

  Future<void> _onLockEnabledChanged(
    AppLockEnabledChanged event,
    Emitter<AppState> emit,
  ) async {
    await _preferences.setBool(_lockEnabledKey, event.isLockEnabled);
    emit(state.copyWith(isLockEnabled: event.isLockEnabled));
  }
}
