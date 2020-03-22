import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:eco_web_mobx/app/modules/home/widgets/menu/menu_widget.dart';

main() {
  testWidgets('MenuWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(MenuWidget()));
    final textFinder = find.text('Menu');
    expect(textFinder, findsOneWidget);
  });
}
