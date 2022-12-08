import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/notification_model.dart';

class NotificationController extends GetxController {
  var listNoti = [];

  void addNoti({required NotificationModel newNoti}) {
    listNoti.add(newNoti);
    update();
  }
}
