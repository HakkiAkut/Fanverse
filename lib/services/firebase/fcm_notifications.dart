import 'package:http/http.dart' as http;

class FCMNotifications {
  Future<bool> sendNotification(
      {String title, String body, String topic}) async {
    print("VM-- $title, $body, $topic");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "key=AAAAsefYBM0:APA91bFtTcwsNF2fDueB1YBkaoCWHm6meCWQj2lXfDhguzS60KsTTe4j2AMwqghEXD6woWn4pePZZUlvyEB3XYd9yRuaTT-r_oeADqX1S7LI2_EftBPQbma6ASCXnxDvhPvB6HA_KT-I"
    };
    String notificationBody =
        '{ "to" : "/topics/$topic", "notification" : { "body" : "$body", "title" : "$title" } }';
    http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"), headers: headers, body: notificationBody);
    return true;
  }
}