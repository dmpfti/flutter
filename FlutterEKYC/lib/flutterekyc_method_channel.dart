import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutterekyc_platform_interface.dart';

/// An implementation of [FlutterekycPlatform] that uses method channels.
class MethodChannelFlutterekyc extends FlutterekycPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutterekyc');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  final platform = const MethodChannel('com.startActivity/eKYC');
  @override
  Future<void> startOtherActivity() async {
    try {
      final String result = await platform.invokeMethod('StartSecondActivity');
      debugPrint('Result: $result ');
    } on PlatformException catch (e) {
      debugPrint("Error: '${e.message}'.");
    }
  }
  @override
  Future<Color> generateColor() async {
    final randomColor = await methodChannel.invokeMethod('generateColor');
    return Color.fromRGBO(randomColor[0], randomColor[1], randomColor[2], 1.0);
  }
}
