part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationLoaded extends NotificationState {
  final NotificationModel notificationModel;
  NotificationLoaded({required this.notificationModel});
}

final class NotificationError extends NotificationState {
  final String message;
  NotificationError({required this.message});
}

final class NotificationSeenSuccessfuy extends NotificationState {
  final NotificationModel notificationModel;
  NotificationSeenSuccessfuy({required this.notificationModel});
}
