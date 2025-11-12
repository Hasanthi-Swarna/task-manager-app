// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taskmanager/main.dart';

void main() {
  testWidgets('Task Manager App test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TaskManagerApp());
  });
}
