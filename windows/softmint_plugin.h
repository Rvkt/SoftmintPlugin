#ifndef FLUTTER_PLUGIN_SOFTMINT_PLUGIN_H_
#define FLUTTER_PLUGIN_SOFTMINT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace softmint_plugin {

class SoftmintPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SoftmintPlugin();

  virtual ~SoftmintPlugin();

  // Disallow copy and assign.
  SoftmintPlugin(const SoftmintPlugin&) = delete;
  SoftmintPlugin& operator=(const SoftmintPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace softmint_plugin

#endif  // FLUTTER_PLUGIN_SOFTMINT_PLUGIN_H_
