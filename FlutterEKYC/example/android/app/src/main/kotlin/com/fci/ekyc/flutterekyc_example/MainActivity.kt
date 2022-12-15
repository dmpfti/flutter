package com.fci.ekyc.flutterekyc_example

import android.content.Intent
import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.NonNull
import com.fpt.fci.ekycsdk.EkycSDKActivity
import com.fpt.fci.ekycsdk.domain.BaseConfig
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.startActivity/eKYC"
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method.equals("StartSecondActivity")) {
                    Intent(this@MainActivity, EkycSDKActivity::class.java).let {
                        it.putExtra(BaseConfig.ParamType.API_KEY.name, "r695BxN7WsBJsqcXMqVxq4iyo1kSAC51")
                        it.putExtra(BaseConfig.ParamType.LIVENESS_TYPE.name, BaseConfig.LivenessType.VIDEO.ordinal)
                        it.putExtra(BaseConfig.ParamType.SHOW_RESULT.name, true)
                        it.putExtra(BaseConfig.ParamType.SUBMIT_RESULT.name, false)
                        startActivity(it)
                    }
//                    val intent = Intent(this, MainActivity1::class.java)
//                    startActivity(intent)
                    result.success("ActivityStarted")
                } else {
                    result.notImplemented()
                }
            }
    }
}
