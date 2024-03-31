import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audio_recorder_vt_plugin_method_channel.dart';

abstract class AudioRecorderVtPluginPlatform extends PlatformInterface {
  /// Constructs a AudioRecorderVtPluginPlatform.
  AudioRecorderVtPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static AudioRecorderVtPluginPlatform _instance = MethodChannelAudioRecorderVtPlugin();

  /// The default instance of [AudioRecorderVtPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelAudioRecorderVtPlugin].
  static AudioRecorderVtPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudioRecorderVtPluginPlatform] when
  /// they register themselves.
  static set instance(AudioRecorderVtPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<String?> getPlataformInit() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<String?> getPlataformStart() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<String?> getPlataformStop() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<String?> getPlataformEnd() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
