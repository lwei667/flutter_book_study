import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';
import 'package:flutter_book_study/widgetLibrary/basic/button/lw_button.dart';

class _MyNotification extends Notification {
  _MyNotification(this.msg);
  final String msg;
}

class NotificationDemo extends BasePage {
  NotificationDemo({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends BasePageState<NotificationDemo> {
  String msg = '';

  @override
  Widget buildBody(BuildContext context) {
    return NotificationListener<_MyNotification>(
        onNotification: (notification) {
          print(notification.msg);
          return true;
        },
        child: NotificationListener<_MyNotification>(
            onNotification: (notification) {
              setState(() {
                msg += notification.msg + ' ';
              });
/*
onNotification
当返回值为true时，阻止冒泡，其父级Widget将再也收不到该通知；当返回值为false 时继续向上冒泡通知。
*/
              return false;
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(
                    builder: (context) {
                      return LWButton.text(
                        text: '点击发送',
                        onPressed: () {
                          _MyNotification('hello').dispatch(context);
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(msg),
                  )
                ],
              ),
            )));
  }
}
