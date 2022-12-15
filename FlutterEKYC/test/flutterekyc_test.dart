import 'package:flutter_test/flutter_test.dart';
import 'package:flutterekyc/flutterekyc.dart';
import 'package:flutterekyc/flutterekyc_platform_interface.dart';
import 'package:flutterekyc/flutterekyc_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterekycPlatform
    with MockPlatformInterfaceMixin
    implements FlutterekycPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterekycPlatform initialPlatform = FlutterekycPlatform.instance;

  test('$MethodChannelFlutterekyc is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterekyc>());
  });

  test('getPlatformVersion', () async {
    Flutterekyc flutterekycPlugin = Flutterekyc();
    MockFlutterekycPlatform fakePlatform = MockFlutterekycPlatform();
    FlutterekycPlatform.instance = fakePlatform;

    expect(await flutterekycPlugin.getPlatformVersion(), '42');
  });
}
