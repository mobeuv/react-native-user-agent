package com.mobeuv.reactnativeuseragent

import android.content.pm.PackageManager
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import android.os.Build
import android.webkit.WebSettings

class ReactNativeUserAgentModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  private fun getAppNameAndVersion(): String {
    return try {
      val packageInfo = reactApplicationContext.packageManager.getPackageInfo(reactApplicationContext.packageName, 0)
      val appName = reactApplicationContext.applicationInfo.loadLabel(reactApplicationContext.packageManager).toString()
      val version = packageInfo.versionName
      "$appName/$version"
    } catch (e: PackageManager.NameNotFoundException) {
      "UnknownApp/0.0"
    }
  }

  @ReactMethod
  fun getUserAgent(promise: Promise) {
    try {
      val userAgent: String? = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
        try {
          WebSettings.getDefaultUserAgent(reactApplicationContext)
        } catch (e: Exception) {
          null
        }
      } else {
        null
      }

      val appNameAndVersion = getAppNameAndVersion()

      val finalUserAgent = if (!userAgent.isNullOrEmpty()) {
        "$appNameAndVersion - $userAgent"
      } else {
        try {
          val fallbackUserAgent = System.getProperty("http.agent")
          if (!fallbackUserAgent.isNullOrEmpty()) {
            "$appNameAndVersion - $fallbackUserAgent"
          } else {
            appNameAndVersion
          }
        } catch (e: Exception) {
          appNameAndVersion
        }
      }

      promise.resolve(finalUserAgent)
    } catch (e: Exception) {
      promise.reject("Error", e.message)
    }
  }

  companion object {
    const val NAME = "ReactNativeUserAgent"
  }
}
