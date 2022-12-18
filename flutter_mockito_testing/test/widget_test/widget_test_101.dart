import 'package:flutter/material.dart';
import 'package:flutter_mockito_testing/testing_101/testing_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Basic Widget Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget());

    await tester.enterText(find.byType(TextField), "Hello Test Text");

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    expect(find.text("Hello Test Text"), findsOneWidget);
  });
}
