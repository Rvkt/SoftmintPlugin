#include "include/softmint_plugin/softmint_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "softmint_plugin.h"

void SoftmintPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  softmint_plugin::SoftmintPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
