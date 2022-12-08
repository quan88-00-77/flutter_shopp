import 'package:uuid/uuid.dart';

class NotificationModel {
  final String id = const Uuid().v4();
  final String title;
  final String createAt;
  final String content;

  NotificationModel(
      {required this.title, required this.createAt, required this.content});
}
