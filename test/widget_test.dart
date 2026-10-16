import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javijava/main/experience.dart';
import 'package:timeline_list/timeline_list.dart';

void main() {
  for (final width in [400.0, 632.0, 999.0, 1000.0, 1200.0]) {
    testWidgets('Timeline renders all roles at width $width', (tester) async {
      tester.view.physicalSize = Size(width, 1600);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: Experience())),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Engineering Manager'), findsOneWidget);
      expect(find.textContaining('DKB Code Factory', findRichText: true), findsOneWidget);
      expect(find.byType(MarkerWidget), findsNWidgets(6));
      expect(tester.getCenter(find.text('Engineering Manager')).dx, lessThan(width / 2));
      expect(tester.getCenter(find.text('Full-stack Developer')).dx, greaterThan(width / 2));
      expect(tester.takeException(), isNull);
    });
  }
  testWidgets('Optional padding does not add text wrapping', (tester) async {
    tester.view.physicalSize = Size(1600, 1800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    Future<List<double>> paragraphHeights(double width, double screenWidth) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: SingleChildScrollView(child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(width: width, child: MediaQuery(
            data: MediaQueryData(size: Size(screenWidth, 1800)),
            child: Experience(),
          )),
        ))),
      ));
      await tester.pumpAndSettle();
      return find.byType(RichText).evaluate()
          .map((element) => (element.renderObject as RenderBox).size.height).toList();
    }

    for (final width in [600.0, 700.0, 800.0, 900.0, 1000.0, 1200.0]) {
      final withoutPadding = await paragraphHeights(width, 999);
      final withOptionalPadding = await paragraphHeights(width, 1600);
      expect(withOptionalPadding, withoutPadding, reason: 'Text rewrapped at widget width $width');
      expect(tester.takeException(), isNull);
    }
  });

}
