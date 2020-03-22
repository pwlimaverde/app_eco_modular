import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eco_web_mobx/app/modules/home/widgets/right/right_widget.dart';

main() {
  testWidgets('RightWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(RightWidget()));
    final textFinder = find.text('Right');
    expect(textFinder, findsOneWidget);
  });
}
