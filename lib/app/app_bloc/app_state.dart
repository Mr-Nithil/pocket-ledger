import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppState extends Equatable {
  const AppState({
    required this.themeMode,
    required this.isBootstrapping,
    required this.isOnboarded,
    required this.isAuthenticated,
    required this.isLockEnabled,
  });

  const AppState.initial()
    : this(
        themeMode: ThemeMode.system,
        isBootstrapping: true,
        isOnboarded: false,
        isAuthenticated: false,
        isLockEnabled: false,
      );

  final ThemeMode themeMode;
  final bool isBootstrapping;
  final bool isOnboarded;
  final bool isAuthenticated;
  final bool isLockEnabled;

  AppState copyWith({
    ThemeMode? themeMode,
    bool? isBootstrapping,
    bool? isOnboarded,
    bool? isAuthenticated,
    bool? isLockEnabled,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      isBootstrapping: isBootstrapping ?? this.isBootstrapping,
      isOnboarded: isOnboarded ?? this.isOnboarded,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLockEnabled: isLockEnabled ?? this.isLockEnabled,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    themeMode,
    isBootstrapping,
    isOnboarded,
    isAuthenticated,
    isLockEnabled,
  ];
}
