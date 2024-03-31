import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'audio_recorder_vt_plugin_platform_interface.dart';

/// An implementation of [AudioRecorderVtPluginPlatform] that uses method channels.
class MethodChannelAudioRecorderVtPlugin extends AudioRecorderVtPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('audio_recorder_vt_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<String> getPlataformInit() async {
    final method = await methodChannel.invokeMethod('onInit');
    return method;
  }

  @override
  Future<String> getPlataformStart() async {
    final method = await methodChannel.invokeMethod('onStart');
    return method;
  }

  @override
  Future<String> getPlataformStop() async {
    final method = await methodChannel.invokeMethod('onStop');
    return method;
  }

  @override
  Future<String> getPlataformEnd() async {
    final method = await methodChannel.invokeMethod('onEnd');
    return method;
  }
  
}
