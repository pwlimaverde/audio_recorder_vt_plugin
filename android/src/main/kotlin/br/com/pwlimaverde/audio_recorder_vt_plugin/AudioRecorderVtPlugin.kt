package br.com.pwlimaverde.audio_recorder_vt_plugin

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.content.Intent
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity

/** AudioRecorderVtPlugin */
class AudioRecorderVtPlugin : FlutterPlugin, MethodCallHandler, FlutterActivity() {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel


    private fun initActivity() {

    }

    private fun startRecord() {
        val startIntent = Intent(this, RecorderService::class.java).apply {
            action = RecorderService.ACTION_START
        }
        ContextCompat.startForegroundService(this, startIntent)
    }

    private fun stopRecord(): String {
        val stopIntent = Intent(this, RecorderService::class.java).apply {
            action = RecorderService.ACTION_STOP
        }
        ContextCompat.startForegroundService(this, stopIntent)
        return RecorderService.pathSave
    }

    private fun endService() {
        val endIntent = Intent(this, RecorderService::class.java).apply {
            action = RecorderService.ACTION_END
        }
        ContextCompat.startForegroundService(this, endIntent)
    }

    private fun restartService() {
        val restartIntent = Intent(this, RecorderService::class.java).apply {
            action = RecorderService.ACTION_RESTART
        }
        ContextCompat.startForegroundService(this, restartIntent)
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "audio_recorder_vt_plugin")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }
        if (call.method == "onInit") {
            initActivity()
            result.success("Method Init Service")
        }
        if (call.method == "onStart") {
            startRecord()
            result.success("Method Start Record")
        }
        if (call.method == "onStop") {
            val pathSave = stopRecord()
            result.success(pathSave)
        }
        if (call.method == "onEnd") {
            endService()
            result.success("Method End Service")
        }
        if (call.method == "onRestart") {
            restartService()
            result.success("Method Restart Service")
        }

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
