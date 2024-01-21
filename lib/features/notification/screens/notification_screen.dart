import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:piton_tech_project/core/utils/custom_circular_progress_indicator.dart';
import 'package:piton_tech_project/features/notification/service/notification_service.dart';
import 'package:piton_tech_project/features/notification/widgets/notification_item.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: ThemeConstants.screenPadding,
          child: ref.watch(notificationStreamProvider).when(
            data: (data) {
              if (data.isEmpty) {
                return Center(
                  child: Text(
                    "No Notification",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        NotificationItem(
                          index: index,
                          notification: data[index],
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                );
              }
            },
            error: (error, stackTrace) {
              return const Text("unkown error");
            },
            loading: () {
              return const CustomCircularProgressIndicator(
                size: 100,
                color: Palette.fullWhite,
              );
            },
          ),
        ),
      ),
    );
  }
}
