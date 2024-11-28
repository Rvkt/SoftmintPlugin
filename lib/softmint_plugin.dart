import 'softmint_plugin_platform_interface.dart';

class SoftmintPlugin {
  Future<String?> getPlatformVersion() {
    return SoftmintPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getDeviceId() {
    return SoftmintPluginPlatform.instance.getDeviceId();
  }

  Future<String?> getAppVersionInfo() {
    return SoftmintPluginPlatform.instance.getAppVersionInfo();
  }
}
