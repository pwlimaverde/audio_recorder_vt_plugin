import 'package:flutter_test/flutter_test.dart';
import 'package:audio_recorder_vt_plugin/audio_recorder_vt_plugin.dart';
import 'package:audio_recorder_vt_plugin/audio_recorder_vt_plugin_platform_interface.dart';
import 'package:audio_recorder_vt_plugin/audio_recorder_vt_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAudioRecorderVtPluginPlatform
    with MockPlatformInterfaceMixin
    implements AudioRecorderVtPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AudioRecorderVtPluginPlatform initialPlatform = AudioRecorderVtPluginPlatform.instance;

  test('$MethodChannelAudioRecorderVtPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAudioRecorderVtPlugin>());
  });

  test('getPlatformVersion', () async {
    AudioRecorderVtPlugin audioRecorderVtPlugin = AudioRecorderVtPlugin();
    MockAudioRecorderVtPluginPlatform fakePlatform = MockAudioRecorderVtPluginPlatform();
    AudioRecorderVtPluginPlatform.instance = fakePlatform;

    expect(await audioRecorderVtPlugin.getPlatformVersion(), '42');
  });
}
