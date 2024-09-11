package com.example.prathima_loan_app

import android.content.Context
import android.telephony.SubscriptionInfo
import android.telephony.SubscriptionManager
import android.telephony.TelephonyManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.siminfo"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getSimInfo" -> {
                    val telephonyManager = getSystemService(TELEPHONY_SERVICE) as TelephonyManager
                    val subscriptionManager = getSystemService(Context.TELEPHONY_SUBSCRIPTION_SERVICE) as SubscriptionManager

                    val simInfoList = mutableListOf<Map<String, String?>>()

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP_MR1) {
                        val subscriptionInfoList = subscriptionManager.activeSubscriptionInfoList
                        for (subscriptionInfo in subscriptionInfoList) {
                            val subscriptionId = subscriptionInfo.subscriptionId
                            val networkName = subscriptionInfo.carrierName.toString()
                            val phone= subscriptionInfo.number

                            println("Subscription ID: $subscriptionId, Phone Number: $phone, Network Name: $networkName")
                            val resultMap = mutableMapOf<String, String?>()
                            resultMap["phoneNumber"] = phone
                            resultMap["networkName"] = networkName
                            resultMap["subscriptionId"] = subscriptionId.toString()

                            simInfoList.add(resultMap)
                        }

                        result.success(simInfoList)
                    } else {
                        result.error("UNSUPPORTED", "Dual SIM is not supported on this device.", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }
}
