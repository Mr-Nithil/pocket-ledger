import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => <Object?>[];
}

final class AppThemeModeChanged extends AppEvent {
  const AppThemeModeChanged(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object?> get props => <Object?>[themeMode];
}

final class AppOnboardingCompleted extends AppEvent {
  const AppOnboardingCompleted({required this.lockEnabled});

  final bool lockEnabled;

  @override
  List<Object?> get props => <Object?>[lockEnabled];
}

final class AppAuthenticationChanged extends AppEvent {
  const AppAuthenticationChanged({required this.isAuthenticated});

  final bool isAuthenticated;

  @override
  List<Object?> get props => <Object?>[isAuthenticated];
}

final class AppLockEnabledChanged extends AppEvent {
  const AppLockEnabledChanged({required this.isLockEnabled});

  final bool isLockEnabled;

  @override
  List<Object?> get props => <Object?>[isLockEnabled];
}
