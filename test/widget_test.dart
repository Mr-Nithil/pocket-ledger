import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pocket_ledger/core/di/injection.dart';
import 'package:pocket_ledger/app/app.dart';

void main() {
  testWidgets('boots into the routed foundation shell', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await configureInjection();
    await tester.pumpWidget(const PocketLedgerApp());
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('PocketLedger'), findsWidgets);
    expect(find.text('Continue'), findsOneWidget);
  });
}
