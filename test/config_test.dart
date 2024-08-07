//
// [Author] Alex (https://github.com/bongochat)
// [Date] 2022/09/20 17:06
//

import 'package:assets_picker/assets_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  PhotoManager.withPlugin(TestPhotoManagerPlugin());
  AssetPicker.setPickerDelegate(TestAssetPickerDelegate());

  group('PathNameBuilder', () {
    testWidgets('called correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        defaultPickerTestApp(
          onButtonPressed: (BuildContext context) {
            AssetPicker.pickAssets(
              context,
              pickerConfig: AssetPickerConfig(
                pathNameBuilder: (AssetPathEntity p) => 'testPathNameBuilder',
              ),
            );
          },
        ),
      );
      await tester.tap(defaultButtonFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down));
      await tester.pumpAndSettle();
      expect(find.text('testPathNameBuilder'), findsOneWidget);
    });
  });
}
