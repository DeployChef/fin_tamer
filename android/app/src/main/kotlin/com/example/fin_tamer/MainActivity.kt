package com.example.fin_tamer

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity

import android.view.KeyEvent
import dev.fluttercommunity.shake_gesture_android.ShakeGesturePlugin

class MainActivity: FlutterFragmentActivity(){
    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        if (keyCode == KeyEvent.KEYCODE_MENU) {
            this.flutterEngine?.plugins?.get(ShakeGesturePlugin::class.java).let { plugin ->
                if (plugin is ShakeGesturePlugin)
                    plugin.onShake()
            }
        }

        return super.onKeyDown(keyCode, event)
    }
}
