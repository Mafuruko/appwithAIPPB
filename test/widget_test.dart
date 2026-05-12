import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:appwithai/main.dart';

void main() {
  testWidgets('Home screen shows object detection start action', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Object Detection'), findsOneWidget);
    expect(find.text('Start Detection'), findsOneWidget);
    expect(find.byIcon(Icons.camera_alt), findsOneWidget);
    expect(find.byIcon(Icons.videocam), findsOneWidget);
  });
}
