import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piton_tech_project/features/notification/service/notification_service.dart';
import 'package:piton_tech_project/models/notification_model.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';

class NotificationItem extends ConsumerStatefulWidget {
  final int index;
  final NotificationModel notification;

  const NotificationItem({
    super.key,
    required this.index,
    required this.notification,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationItemState();
}

class _NotificationItemState extends ConsumerState<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        ref
            .read(notificationServiceProvider.notifier)
            .readNotification(widget.index);
      },
      child: Badge(
        isLabelVisible: !widget.notification.isSeen,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Palette.button,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  widget.notification.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 80,
                width: width - 110,
                child: Stack(
                  children: [
                    Positioned(
                      top: ThemeConstants.notificationPadding,
                      left: ThemeConstants.notificationPadding,
                      right: ThemeConstants.notificationPadding,
                      child: Text(
                        widget.notification.title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    Positioned(
                      bottom: ThemeConstants.notificationPadding,
                      left: ThemeConstants.notificationPadding,
                      right: ThemeConstants.notificationPadding,
                      child: Text(
                        widget.notification.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
