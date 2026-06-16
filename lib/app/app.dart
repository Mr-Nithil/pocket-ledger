import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/injection.dart';
import '../core/theme/app_theme.dart';
import 'app_bloc/app_bloc.dart';
import 'app_bloc/app_state.dart';
import 'router/app_router.dart';

class PocketLedgerApp extends StatefulWidget {
  const PocketLedgerApp({super.key});

  static Future<void> bootstrap() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureInjection();
    runApp(const PocketLedgerApp());
  }

  @override
  State<PocketLedgerApp> createState() => _PocketLedgerAppState();
}

class _PocketLedgerAppState extends State<PocketLedgerApp> {
  late final AppBloc _appBloc;
  late final PocketLedgerRouter _router;

  @override
  void initState() {
    super.initState();
    _appBloc = getIt<AppBloc>();
    _router = PocketLedgerRouter(
      initialLocation: _resolveInitialLocation(_appBloc.state),
    );
  }

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }

  String _resolveInitialLocation(AppState state) {
    if (!state.isOnboarded) {
      return '/onboarding';
    }

    if (state.isLockEnabled && !state.isAuthenticated) {
      return '/lock';
    }

    return '/home';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _appBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'PocketLedger',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            routerConfig: _router.router,
          );
        },
      ),
    );
  }
}
