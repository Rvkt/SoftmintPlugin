import 'package:flutter_test/flutter_test.dart';
import 'package:softmint_plugin/softmint_plugin.dart';
import 'package:softmint_plugin/softmint_plugin_platform_interface.dart';
import 'package:softmint_plugin/softmint_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSoftmintPluginPlatform
    with MockPlatformInterfaceMixin
    implements SoftmintPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SoftmintPluginPlatform initialPlatform = SoftmintPluginPlatform.instance;

  test('$MethodChannelSoftmintPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSoftmintPlugin>());
  });

  test('getPlatformVersion', () async {
    SoftmintPlugin softmintPlugin = SoftmintPlugin();
    MockSoftmintPluginPlatform fakePlatform = MockSoftmintPluginPlatform();
    SoftmintPluginPlatform.instance = fakePlatform;

    expect(await softmintPlugin.getPlatformVersion(), '42');
  });
}
