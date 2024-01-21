import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piton_tech_project/core/constants/data_constants.dart';
import 'package:piton_tech_project/models/notification_model.dart';

// let assume that we get notification data from server as stream
final notificationStreamProvider = StreamProvider((ref) async* {
  final notificationStream = ref.watch(notificationServiceProvider);

  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield notificationStream;
  }
});

final notificationServiceProvider =
    StateNotifierProvider<NotificationService, List<NotificationModel>>(
  (ref) => NotificationService(),
);

class NotificationService extends StateNotifier<List<NotificationModel>> {
  NotificationService() : super(DataConstants().notificationData);

  // read notification
  void readNotification(int index) {
    final tempState = state;
    tempState[index] = tempState[index].copyWith(isSeen: true);
    state = tempState;
    debugPrint("seen notification");
  }
}
