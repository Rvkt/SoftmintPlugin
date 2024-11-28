import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'softmint_plugin_platform_interface.dart';

/// An implementation of [SoftmintPluginPlatform] that uses method channels.
class MethodChannelSoftmintPlugin extends SoftmintPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('softmint_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDeviceId() async {
    final deviceId = await methodChannel.invokeMethod<String>('getDeviceId');
    return deviceId;
  }

  @override
  Future<String?> getAppVersionInfo() async {
    final versionInfo = await methodChannel.invokeMethod<String>('getAppVersionInfo');
    return versionInfo;
  }
}
