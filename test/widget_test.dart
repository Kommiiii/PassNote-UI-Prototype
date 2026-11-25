import 'package:flutter_test/flutter_test.dart';

import 'package:passnote/main.dart';

void main() {
  testWidgets('shows the PassNote login screen', (tester) async {
    await tester.pumpWidget(const PassNoteApp());

    expect(find.text('PASSNOTE'), findsOneWidget);
    expect(find.text('UNLOCK VAULT'), findsOneWidget);
  });

  testWidgets('unlock navigates to the dashboard', (tester) async {
    await tester.pumpWidget(const PassNoteApp());
    await tester.tap(find.text('UNLOCK VAULT'));
    await tester.pumpAndSettle();

    expect(find.text('PASSNOTE // DASHBOARD'), findsOneWidget);
    expect(find.text('> Welcome back, Kyle!'), findsOneWidget);
  });
}
