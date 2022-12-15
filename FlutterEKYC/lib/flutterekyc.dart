
import 'dart:ui';

import 'flutterekyc_platform_interface.dart';

class Flutterekyc {
  Future<String?> getPlatformVersion() {
    return FlutterekycPlatform.instance.getPlatformVersion();
  }

  Future<void> startOtherActivity() {
    return FlutterekycPlatform.instance.startOtherActivity();
  }

  Future<Color> generateColor() {
    return FlutterekycPlatform.instance.generateColor();
  }
}
