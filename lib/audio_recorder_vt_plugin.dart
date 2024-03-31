
import 'audio_recorder_vt_plugin_platform_interface.dart';

class AudioRecorderVtPlugin {
  Future<String?> getPlatformVersion() {
    return AudioRecorderVtPluginPlatform.instance.getPlatformVersion();
  }
  Future<String?> getPlataformInit() {
    return AudioRecorderVtPluginPlatform.instance.getPlataformInit();
  }
  Future<String?> getPlataformStart() {
    return AudioRecorderVtPluginPlatform.instance.getPlataformStart();
  }
  Future<String?> getPlataformStop() {
    return AudioRecorderVtPluginPlatform.instance.getPlataformStop();
  }
  Future<String?> getPlataformEnd() {
    return AudioRecorderVtPluginPlatform.instance.getPlataformEnd();
  }
}
