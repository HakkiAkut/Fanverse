package com.project.fandom_app;
import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingPlugin;
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService;

public class Application extends FlutterApplication implements PluginRegistrantCallback {
    @Override
    public void onCreate() {
        super.onCreate();
        FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this);
    }

    @Override
    public void registerWith(PluginRegistry registry) {

        if (alreadyRegisteredWith(registry)) {
            return;
        }
        FlutterFirebaseMessagingPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingPlugin"));
    }
    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = Application.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        registry.registrarFor(key);
        return false;
    }
}
