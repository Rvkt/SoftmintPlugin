//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <softmint_plugin/softmint_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) softmint_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SoftmintPlugin");
  softmint_plugin_register_with_registrar(softmint_plugin_registrar);
}
