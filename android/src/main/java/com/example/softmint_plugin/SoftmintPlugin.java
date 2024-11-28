package com.example.softmint_plugin;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.provider.Settings;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** SoftmintPlugin */
public class SoftmintPlugin implements FlutterPlugin, MethodCallHandler {
  private static final String TAG = "SoftmintPlugin";
  private MethodChannel channel;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "softmint_plugin");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;
      case "getDeviceId":
        String deviceId = getDeviceId(context);
        result.success(deviceId);
        break;
      case "getAppVersionInfo":
        String versionInfo = getAppVersionInfo(context);
        result.success(versionInfo);
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  private String getDeviceId(Context context) {
    // Return Android ID (Unique ID for the device)
    String deviceId = Settings.Secure.getString(context.getContentResolver(), Settings.Secure.ANDROID_ID);
    Log.d(TAG, "Device ID: " + deviceId);
    return deviceId;
  }

  private String getAppVersionInfo(Context context) {
    try {
      PackageManager packageManager = context.getPackageManager();
      String packageName = context.getPackageName();
      PackageInfo packageInfo = packageManager.getPackageInfo(packageName, 0);

      String versionName = packageInfo.versionName; // Version name (e.g., "1.0.0")
      long versionCode = packageInfo.getLongVersionCode(); // Use getLongVersionCode() instead of versionCode

      Log.d(TAG, "App Version Name: " + versionName); // Log the version name
      Log.d(TAG, "App Version Code: " + versionCode); // Log the version code

      return versionName;
    } catch (PackageManager.NameNotFoundException e) {
      e.printStackTrace();
      Log.d(TAG, "Error fetching version info"); // Log error if package info is not found
      return "Error fetching version info";
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
