import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piton_tech_project/features/notification/repository/notification_repository.dart';
import 'package:piton_tech_project/models/notification_model.dart';

final notificationControllerProvider =
    StateNotifierProvider<NotificationController, List<NotificationModel>>(
  (ref) => NotificationController(
    notRepository: NotificationRepository(),
  ),
);

class NotificationController extends StateNotifier<List<NotificationModel>> {
  final NotificationRepository _notRepository;

  NotificationController({required NotificationRepository notRepository})
      : _notRepository = notRepository,
        super([]);
}
