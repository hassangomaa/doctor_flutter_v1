import 'notifications.dart';

class NotificationModel {
  int? status;
  String? message;
  Notifications? notifications;

  NotificationModel({this.status, this.message, this.notifications});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      notifications: json['notifications'] == null
          ? null
          : Notifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'notifications': notifications?.toJson(),
      };
}
