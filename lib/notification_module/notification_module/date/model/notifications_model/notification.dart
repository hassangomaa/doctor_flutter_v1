import 'body.dart';

class Notification {
  String? title;
  Body? body;

  Notification({this.title, this.body});

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json['title'] as String?,
        body: json['body'] == null
            ? null
            : Body.fromJson(json['body'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body?.toJson(),
      };
}
