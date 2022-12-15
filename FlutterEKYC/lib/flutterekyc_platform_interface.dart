import 'dart:ui';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutterekyc_method_channel.dart';

abstract class FlutterekycPlatform extends PlatformInterface {
  /// Constructs a FlutterekycPlatform.
  FlutterekycPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterekycPlatform _instance = MethodChannelFlutterekyc();

  /// The default instance of [FlutterekycPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterekyc].
  static FlutterekycPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterekycPlatform] when
  /// they register themselves.
  static set instance(FlutterekycPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<void> startOtherActivity() {
    throw UnimplementedError('startOtherActivity() has not been implemented.');
  }
  Future<Color> generateColor() {
    throw UnimplementedError('generateColor() has not been implemented.');
  }
}
