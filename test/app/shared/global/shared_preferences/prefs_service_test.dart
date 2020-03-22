import 'package:flutter_test/flutter_test.dart';

import 'package:eco_web_mobx/app/shared/global/shared_preferences/prefs_service.dart';

void main() {
  PrefsService service;

  setUp(() {
    service = PrefsService();
  });

  group('PrefsService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<PrefsService>());
    });
  });
}
