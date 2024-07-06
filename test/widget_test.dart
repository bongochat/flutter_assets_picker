//
// [Author] Alex (https://github.com/bongochat)
// [Date] 2022/09/20 17:09
//

import 'package:assets_picker/assets_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  PhotoManager.withPlugin(TestPhotoManagerPlugin());
  AssetPicker.setPickerDelegate(TestAssetPickerDelegate());

  group('Confirm button', () {
    group('when enabled preview', () {
      testWidgets('with multiple assets picking', (WidgetTester tester) async {
        await tester.pumpWidget(
          defaultPickerTestApp(
            onButtonPressed: (BuildContext context) {
              AssetPicker.pickAssets(
                context,
                pickerConfig: const AssetPickerConfig(
                  maxAssets: 10,
                  specialPickerType: null, // Explicitly null.
                ),
              );
            },
          ),
        );
        await tester.tap(defaultButtonFinder);
        await tester.pumpAndSettle();
        expect(
          find.text(const AssetPickerTextDelegate().send),
          findsOneWidget,
        );
      });
      testWidgets('with single asset picking', (WidgetTester tester) async {
        await tester.pumpWidget(
          defaultPickerTestApp(
            onButtonPressed: (BuildContext context) {
              AssetPicker.pickAssets(
                context,
                pickerConfig: const AssetPickerConfig(
                  maxAssets: 1,
                  specialPickerType: null, // Explicitly null.
                ),
              );
            },
          ),
        );
        await tester.tap(defaultButtonFinder);
        await tester.pumpAndSettle();
        expect(
          find.text(const AssetPickerTextDelegate().send),
          findsOneWidget,
        );
      });
    });
    group('when disabled preview', () {
      testWidgets('with multiple assets picker', (WidgetTester tester) async {
        await tester.pumpWidget(
          defaultPickerTestApp(
            onButtonPressed: (BuildContext context) {
              AssetPicker.pickAssets(
                context,
                pickerConfig: const AssetPickerConfig(
                  maxAssets: 2,
                  specialPickerType: SpecialPickerType.noPreview,
                ),
              );
            },
          ),
        );
        await tester.tap(defaultButtonFinder);
        await tester.pumpAndSettle();
        expect(
          find.text(const AssetPickerTextDelegate().send),
          findsOneWidget,
        );
      });
      testWidgets('with single asset picker', (WidgetTester tester) async {
        await tester.pumpWidget(
          defaultPickerTestApp(
            onButtonPressed: (BuildContext context) {
              AssetPicker.pickAssets(
                context,
                pickerConfig: const AssetPickerConfig(
                  maxAssets: 1,
                  specialPickerType: SpecialPickerType.noPreview,
                ),
              );
            },
          ),
        );
        await tester.tap(defaultButtonFinder);
        await tester.pumpAndSettle();
        expect(
          find.text(const AssetPickerTextDelegate().send),
          findsNothing,
        );
      });
    });
  });
}
