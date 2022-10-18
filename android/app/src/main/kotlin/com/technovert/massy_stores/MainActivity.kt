package com.technovert.massy_stores

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import androidx.annotation.NonNull
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

// class MainActivity : FlutterActivity()
class MainActivity : FlutterFragmentActivity() {

    private val methodChannelName = "com.technovert.massy_stores/methodChannel"
    private val eventChannelName = "com.technovert.massy_stores/eventChannel"
    private lateinit var eventSink: EventChannel.EventSink
    private lateinit var sensorManager: SensorManager
    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    // lateinit var sensor:Sensor
    private var latestReading: Float = 0.0F

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelName).setMethodCallHandler { methodCall, result ->
            when (methodCall.method) {
                "initializeSensor" -> {
                    eventChannel = EventChannel(flutterEngine?.dartExecutor, eventChannelName)
                    // result.success(initializeSensor())
                    val sensor: Sensor = sensorManager.getDefaultSensor(Sensor.TYPE_LIGHT)
                    val jsonDetails = sensorDetails(sensor)
                    result.success(jsonDetails)
                    initTempratureSensorEventListener()
                    // initAllSensorEventListener()
                }
                else -> {
                    print("no sensor present")
                }
            }
        }
    }

    // override fun onCreate(savedInstanceState: Bundle?) {
    //     super.onCreate(savedInstanceState)
    //     sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
    //     methodChannel = MethodChannel(flutterEngine?.dartExecutor, methodChannelName)
    //     methodChannel.setMethodCallHandler { methodCall, result ->
    //         when (methodCall.method) {
    //             "initializeSensor" -> {
    //                 eventChannel = EventChannel(flutterEngine?.dartExecutor, eventChannelName)
    //                 // result.success(initializeSensor())
    //                 val sensor: Sensor = sensorManager.getDefaultSensor(Sensor.TYPE_LIGHT)
    //                 val jsonDetails = sensorDetails(sensor)
    //                 result.success(jsonDetails)
    //                 initTempratureSensorEventListener()
    //                 // initAllSensorEventListener()
    //             }
    //             else -> {
    //                 print("no sensor present")
    //             }
    //         }
    //     }

    //     // lightMethodChannel = MethodChannel(flutterEngine?.dartExecutor, lightMethodChannelName)
    //     // lightMethodChannel.setMethodCallHandler { methodCall, result ->
    //     //     when (methodCall.method) {
    //     //         "getLightSensorDetails" -> {
    //     //             lightEventChannel =
    //     //                     EventChannel(flutterEngine?.dartExecutor, lightEventChannelName)
    //     //             val sensor: Sensor = sensorManager.getDefaultSensor(Sensor.TYPE_LIGHT)
    //     //             val jsonDetails = sensorDetails(sensor)
    //     //             result.success(jsonDetails)
    //     //             initLightSensorEventListener()
    //     //         }
    //     //         else -> {
    //     //             print("no sensor present")
    //     //         }
    //     //     }
    //     // }
    // }

    // fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    //     super.configureFlutterEngine(flutterEngine)
    //     MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
    // MethodChannel).setMethodCallHandler { call, result ->
    //     onMethodCall(call, result)}
    //     val eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, EventChannel)
    //     eventChannel.setStreamHandler(this)
    // }

    // fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    //     //val locationManager = this.getSystemService(Context.LOCATION_SERVICE) as
    // LocationManager
    //     //val provider: LocationProvider =
    // locationManager.getProvider(LocationManager.GPS_PROVIDER)
    //     eventSink = events!!;
    // }

    // fun onCancel(arguments: Any?) {
    //    // eventSink;
    // }

    private fun initAllSensorEventListener() {
        eventChannel.setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onCancel(any: Any?) {}

                    override fun onListen(any: Any?, eventSink: EventChannel.EventSink?) {
                        if (eventSink != null) {
                            val sensorList: List<Sensor> =
                                    sensorManager.getSensorList(Sensor.TYPE_ALL)
                            sensorList.forEach { sensor ->
                                sensorManager.registerListener(
                                        MySensorListener(eventSink),
                                        sensor,
                                        SensorManager.SENSOR_DELAY_NORMAL
                                )
                            }
                        }
                    }
                }
        )
    }

    private fun initTempratureSensorEventListener() {
        eventChannel.setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onCancel(any: Any?) {}

                    override fun onListen(any: Any?, eventSink: EventChannel.EventSink?) {
                        if (eventSink != null) {
                            val sensorList: List<Sensor> =
                                    sensorManager.getSensorList(Sensor.TYPE_LIGHT)
                            sensorList.forEach { sensor ->
                                sensorManager.registerListener(
                                        MySensorListener(eventSink),
                                        sensor,
                                        SensorManager.SENSOR_DELAY_NORMAL
                                )
                            }
                        }
                    }
                }
        )
    }

    fun initializeSensor(): Map<String, List<Map<String, String>>> {
        val sensorMap = mutableMapOf<String, List<Map<String, String>>>()
        val sensorList = mutableListOf<Map<String, String>>()
        sensorManager.getSensorList(Sensor.TYPE_ALL).forEach { sensor ->
            sensorList.add(sensorDetails(sensor))
        }
        sensorMap.put("sensorDeatails", sensorList)
        return sensorMap
    }

    private fun sensorDetails(sensor: Sensor): Map<String, String> {
        return mapOf(
                "name" to sensor.name,
                "type" to sensor.type.toString(),
                "vendorName" to sensor.vendor.toString(),
                "version" to sensor.version.toString(),
                "resolution" to sensor.resolution.toString(),
                "power" to sensor.power.toString(),
                "maxRange" to sensor.maximumRange.toString(),
                "minDelay" to (sensor.minDelay.toFloat() / 1000000.0).toString()
        )
    }

    // private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    //     when(call.method)
    //     {
    //         "initializeSensor" -> result.success(initializeSensor())
    //         "listSensors" -> {
    //             if(sensorManager!=null) {
    //                 var sensors = sensorManager.getSensorList(Sensor.TYPE_ALL);
    //                 result.success(sensors)
    //             }
    //         }
    //     }
    // }

    // fun onSensorChanged(event: SensorEvent?) {
    //     latestReading = event?.values?.get(0) !!
    //     if(eventSink!=null)
    //     {
    //         eventSink.success(latestReading);
    //     }
    // }

    // fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {

    // }
}

class MySensorListener(eventSink: EventChannel.EventSink) : SensorEventListener {
    private val _eventSink: EventChannel.EventSink = eventSink
    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}

    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null)
                _eventSink.success(
                        mapOf(
                                "name" to event.sensor.name.toString(),
                                "type" to event.sensor.type.toString(),
                                "vendorName" to event.sensor.vendor.toString(),
                                "values" to event.values.joinToString(separator = ";")
                        )
                )
    }
}
