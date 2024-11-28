import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'softmint_plugin_method_channel.dart';

abstract class SoftmintPluginPlatform extends PlatformInterface {
  /// Constructs a SoftmintPluginPlatform.
  SoftmintPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SoftmintPluginPlatform _instance = MethodChannelSoftmintPlugin();

  /// The default instance of [SoftmintPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSoftmintPlugin].
  static SoftmintPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SoftmintPluginPlatform] when
  /// they register themselves.
  static set instance(SoftmintPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDeviceId() {
    throw UnimplementedError('getDeviceId() has not been implemented.');
  }

  Future<String?> getAppVersionInfo() {
    throw UnimplementedError('getAppVersionInfo() has not been implemented.');
  }
}
