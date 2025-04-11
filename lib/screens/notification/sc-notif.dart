// pages/notification_page.dart (create this file)
// ignore_for_file: must_be_immutable

import 'package:car_reservation_system/controllers/ct-notification-index.dart';
import 'package:car_reservation_system/models/md-notification-item.dart';
import 'package:car_reservation_system/utils/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    //
    return GetBuilder<NotificationIndexController>(
      init: NotificationIndexController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          elevation: 1.0, // Subtle shadow
        ),
        body: Obx(() {
          return Column(
            children: [
              _buildPageControlButtons(
                controller: controller,
              ), // Buttons [All] [Unread]
              Expanded(
                // PageView needs constraints, Expanded provides them
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged:
                      controller.onPageChanged, // Update state on swipe
                  children: <Widget>[
                    _buildNotificationList(controller.notifications),
                    _buildNotificationList(controller.notifications),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  // Builds the [All] [Unread] buttons row
  Widget _buildPageControlButtons(
      {required NotificationIndexController controller}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.02),
      decoration: BoxDecoration(
        color: Colors.white, // Match background
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Or spaceEvenly, etc.
        children: [
          _buildSegmentButton(controller, text: 'All', index: 0),
          gap(0, width: size.width * 0.03), //, Spacing between buttons
          _buildSegmentButton(controller, text: 'Unread', index: 1),
        ],
      ),
    );
  }

  // Helper to build individual control buttons
  Widget _buildSegmentButton(NotificationIndexController controller,
      {required String text, required int index}) {
    final bool isSelected = controller.pageIndex == index;

    //
    return TextButton(
      onPressed: () => controller.onButtonPressed(index: index),
      style: TextButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.grey.shade600,
        backgroundColor:
            isSelected ? const Color(0xFF884CCE) : Colors.transparent,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.08, vertical: size.width * 0.02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * 0.06),
        ),
        textStyle: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: size.width * 0.04,
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildNotificationList(List<NotificationItem> notifications) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notificationItem = notifications[index];
        return _buildNotificationCard(notificationItem);
      },
    );
  }

  Widget _buildNotificationCard(NotificationItem item) {
    return Card(
      color: item.isRead ? Colors.white : const Color(0xFFEDC0FF),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: item.image != null
                ? NetworkImage(item.image!)
                : const AssetImage('assets/images/logo2.png'),
          ),
          title: Text(
            item.title,
            style: TextStyle(
                fontWeight: item.isRead ? FontWeight.normal : FontWeight.bold),
          ),
          subtitle: Text(item.body),
          trailing: Text(DateFormat('h:mm a').format(item.timestamp)),
        ),
      ),
    );
  }
}
