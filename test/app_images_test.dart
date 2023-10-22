import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:trade/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.activity).existsSync(), isTrue);
    expect(File(AppImages.addCircle).existsSync(), isTrue);
    expect(File(AppImages.arrowLeft).existsSync(), isTrue);
    expect(File(AppImages.arrowRight).existsSync(), isTrue);
    expect(File(AppImages.brazil).existsSync(), isTrue);
    expect(File(AppImages.canada).existsSync(), isTrue);
    expect(File(AppImages.france).existsSync(), isTrue);
    expect(File(AppImages.germany).existsSync(), isTrue);
    expect(File(AppImages.india).existsSync(), isTrue);
    expect(File(AppImages.minusCirlce).existsSync(), isTrue);
    expect(File(AppImages.newZealand).existsSync(), isTrue);
    expect(File(AppImages.southKorea).existsSync(), isTrue);
    expect(File(AppImages.spain).existsSync(), isTrue);
    expect(File(AppImages.unitedStates).existsSync(), isTrue);
    expect(File(AppImages.user).existsSync(), isTrue);
  });
}
