import 'package:batch_flutter/batch_inbox.dart';
import 'package:batch_flutter/batch_push.dart';
import 'package:batch_flutter/batch_user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isBatchError = false;
  String _errorMsg = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initBatch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Test Batch!'),
                const SizedBox(height: 20.0),
                Text('Erreur : $_isBatchError'),
                const SizedBox(height: 20.0),
                if (_isBatchError == true)
                  Text("L'erreur est la suivante :  $_errorMsg")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _initBatch() async {
    try {
      String? installId = await BatchUser.instance.installationID;
    //  print("BatchPush install ID : $installId");


      var inboxFetcher = await BatchInbox.instance.getFetcherForInstallation();
      BatchPush.instance.requestNotificationAuthorization();
      BatchInboxFetchResult newNotificationsResult =
          await inboxFetcher.fetchNewNotifications();

    //  print(newNotificationsResult.notifications.length);

      _isBatchError = false;
    } catch (e) {
      _errorMsg = e.toString();
      _isBatchError = true;
    }
  }
}
