//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <connectivity_plus/connectivity_plus_windows_plugin.h>
#include <flutter_secure_storage_windows/flutter_secure_storage_windows_plugin.h>
#include <local_auth_windows/local_auth_plugin.h>
#include <objectbox_flutter_libs/objectbox_flutter_libs_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
  FlutterSecureStorageWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterSecureStorageWindowsPlugin"));
  LocalAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("LocalAuthPlugin"));
  ObjectboxFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ObjectboxFlutterLibsPlugin"));
}
