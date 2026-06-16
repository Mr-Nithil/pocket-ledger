import 'package:go_router/go_router.dart';

import '../../features/analytics/presentation/pages/analytics_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/lock/presentation/pages/lock_page.dart';
import '../../features/more/presentation/pages/more_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/shell/presentation/pages/app_shell_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/transactions/presentation/pages/transactions_page.dart';

class PocketLedgerRouter {
  PocketLedgerRouter({required String initialLocation})
    : router = GoRouter(
        initialLocation: initialLocation,
        routes: <RouteBase>[
          GoRoute(
            path: '/splash',
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(
            path: '/onboarding',
            builder: (context, state) => const OnboardingPage(),
          ),
          GoRoute(path: '/lock', builder: (context, state) => const LockPage()),
          ShellRoute(
            builder: (context, state, child) => AppShellPage(child: child),
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
              GoRoute(
                path: '/analytics',
                builder: (context, state) => const AnalyticsPage(),
              ),
              GoRoute(
                path: '/transactions',
                builder: (context, state) => const TransactionsPage(),
              ),
              GoRoute(
                path: '/more',
                builder: (context, state) => const MorePage(),
              ),
            ],
          ),
        ],
      );

  final GoRouter router;
}
