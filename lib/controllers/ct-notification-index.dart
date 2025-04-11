import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/md-notification-item.dart';

class NotificationIndexController extends GetxController {
  final RxInt _currentPageIndex = 0.obs; // 0 for 'All', 1 for 'Unread'
  final RxList<NotificationItem> _notifications = <NotificationItem>[].obs;

  int get pageIndex => _currentPageIndex.value;
  late PageController _pageController;
  get pageController => _pageController;
  List<NotificationItem> get notifications => _notifications;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _pageController = PageController(initialPage: pageIndex);
    _updateNotifications();
  }

  void onButtonPressed({required int index}) {
    if (pageIndex != index) {
      // Animate to the page
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      // No need to call setState here, onPageChanged will handle it
    }
  }

  void onPageChanged(int index) {
    _currentPageIndex.value = index;
    _updateNotifications();
  }

  void _updateNotifications() {
    if (pageIndex == 0) {
      _notifications.value = _allNotifications;
    } else {
      _notifications.value = _allNotifications
          .where((notification) => !notification.isRead)
          .toList();
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _pageController.dispose();
  }
}

// Dummy data
final List<NotificationItem> _allNotifications = [
  NotificationItem(
    id: '1',
    title: 'New Follower',
    body: 'John Doe started following you.',
    timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
    isRead: false,
  ),
  NotificationItem(
    id: '2',
    title: 'Notification Title 2',
    body: 'This is a notification body.',
    timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
    isRead: false,
  ),
  NotificationItem(
    id: '3',
    title: 'Notification Title 3',
    body: 'Notification Body 3',
    timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
    isRead: false,
    image:
        "https://c8.alamy.com/comp/2RAMHHB/milton-keynesuk-july-2nd-2023-2017-blue-bmw-320-car-travelling-on-an-english-country-road-2RAMHHB.jpg",
  ),
  NotificationItem(
    id: '4',
    title: 'Hello World',
    body: 'Greetings.',
    timestamp: DateTime.now().subtract(const Duration(minutes: 7)),
    isRead: true,
  ),
  NotificationItem(
    id: '5',
    title: 'Example Notification',
    body: 'This is an example notification.',
    timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
    isRead: true,
  ),
];
