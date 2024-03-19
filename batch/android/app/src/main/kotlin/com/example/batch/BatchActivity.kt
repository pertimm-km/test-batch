package com.example.batch
import android.app.Application
import com.batch.batch_flutter.BatchFlutterPlugin

class BatchActivity : Application() {
    override fun onCreate() {
        super.onCreate()
        val batchApiKey = "API_KEY";

        BatchFlutterPlugin.getConfiguration(this)
            .setAPIKey(batchApiKey)
        BatchFlutterPlugin.setup(this)
    }
}