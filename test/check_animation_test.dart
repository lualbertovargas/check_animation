import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:check_animation/check_animation.dart';

void main() {
  testWidgets('CustomUploadWidget displays title and button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CustomUploadWidget(
        animation: const AlwaysStoppedAnimation(1.0),
        title: 'Upload Title',
        buttonText: 'Upload',
        onButtonPressed: () {},
      ),
    ));

    expect(find.text('Upload Title'), findsOneWidget);
    expect(find.text('Upload'), findsOneWidget);
  });
}
