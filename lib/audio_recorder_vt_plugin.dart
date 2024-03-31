
import 'audio_recorder_vt_plugin_platform_interface.dart';

class AudioRecorderVtPlugin {
  Future<String?> getPlatformVersion() {
    return AudioRecorderVtPluginPlatform.instance.getPlatformVersion();
  }
}
