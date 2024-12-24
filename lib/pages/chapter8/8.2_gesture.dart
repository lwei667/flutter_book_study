import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
Sliver 的布局协议如下：

Viewport 将当前布局和配置信息通过 SliverConstraints 传递给 Sliver。
Sliver 确定自身的位置、绘制等信息，保存在 geometry 中（一个 SliverGeometry 类型的对象）。
Viewport 读取 geometry 中的信息来对 Sliver 进行布局和绘制。



*/

class GesturePage extends BasePage {
  GesturePage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends BasePageState<GesturePage> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("Tap"), //点击
        onDoubleTap: () {
          debugPrint('onDoubleTap');
          updateText("DoubleTap");
        }, //双击
        onLongPress: () {
          debugPrint('onLongPress');
          updateText("onLongPress");
        }, //长按
        onTapCancel: () {
          debugPrint('onTapCancel');
          updateText("onTapCancel");
        },
        onTapDown: (details) {
          debugPrint('onTapDown');
          updateText("onTapDown");
        },
        onTapUp: (details) {
          debugPrint('onTapUp');
          updateText("onTapUp");
        },
        onDoubleTapCancel: () {
          debugPrint('onDoubleTapCancel');
          updateText("onDoubleTapCancel");
        },
        onDoubleTapDown: (details) {
          debugPrint('onDoubleTapDown');
          updateText("onDoubleTapDown");
        },
        onLongPressCancel: () {
          debugPrint('onLongPressCancel');
          updateText("onLongPressCancel");
        },
        onLongPressDown: (details) {
          debugPrint('onLongPressDown');
          updateText("onLongPressDown");
        },
        onLongPressEnd: (details) {
          debugPrint('onLongPressEnd');
          updateText("onLongPressEnd");
        },
        onLongPressMoveUpdate: (details) {
          debugPrint('onLongPressMoveUpdate');
          updateText("onLongPressMoveUpdate");
        },
        onLongPressStart: (details) {
          debugPrint('onLongPressStart');
          updateText("onLongPressStart");
        },
        onLongPressUp: () {
          debugPrint('onLongPressUp');
          updateText("onLongPressUp");
        },
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
