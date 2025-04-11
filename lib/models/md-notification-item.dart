import 'package:flutter/material.dart';

class NotificationItem {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  bool isRead;
  final String? image; //  Optional icon

  NotificationItem({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
    this.image,
  });

  // factory NotificationItem.fromJson(Map<String, dynamic> json) {
  //   return NotificationItem(
  //     id: json['id'] ?? '0',
  //     title: json['title'] ?? 'No title',
  //     body: json['body'] ?? 'No body',
  //     timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toString),
  //     isRead: json['isRead'] ?? false,
  //     image: json['image'] != null ? NetworkImage(json['image']) : null,
  //   );
  // }
}
