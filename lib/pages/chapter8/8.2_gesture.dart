import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

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
  @override
  Widget buildBody(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Center(
              child: scaleMotion(),
            ),
            Align(alignment: const Alignment(0, 1), child: basicOperation()),
            Positioned(
                top: _freeTop,
                left: _freeLeft,
                child: freePan(constraints.maxWidth, constraints.maxHeight)),
            Positioned(
                top: _verticalTop,
                left: (constraints.maxWidth - 20) / 2,
                child: verticalDragPan(constraints.maxHeight)),
          ],
        );
      },
    ));
  }

  double _scaleWidth = 200.0;

  Widget scaleMotion() {
    return GestureDetector(
      child: Image.asset(
        'assets/images/lake.jpg',
        width: _scaleWidth,
      ),
      onScaleUpdate: (details) {
        setState(() {
          _scaleWidth = 200 * details.scale.clamp(0.8, 10);
        });
      },
    );
  }

  // 垂直滑动距离顶部的距离
  double _verticalTop = 0.0;

  Widget verticalDragPan(double limitHeight) {
    return GestureDetector(
      child: const CircleAvatar(child: Text("B")),
      onVerticalDragStart: (details) {
        //打印手指按下的位置(相对于屏幕)
        print("用户手指按下：${details.globalPosition}");
      },
      onVerticalDragUpdate: (details) {
        //用户手指滑动时，更新偏移，重新构建
        setState(() {
          _verticalTop += details.delta.dy;
          if (_verticalTop < 0) {
            _verticalTop = 0;
          } else if (_verticalTop > limitHeight) {
            _verticalTop = limitHeight - 20;
          }
        });
      },
      onVerticalDragEnd: (details) {
        //打印滑动结束时在x、y轴上的速度
        print(details.velocity);
      },
    );
  }

  // 自由滑动距离顶部的距离
  double _freeTop = 0.0;
  // 自由滑动距离左边的距离
  double _freeLeft = 0.0;

  Widget freePan(double limitWidth, double limitHeight) {
    return GestureDetector(
      child: const CircleAvatar(child: Text("A")),
      onPanDown: (details) {
        //打印手指按下的位置(相对于屏幕)
        print("用户手指按下：${details.globalPosition}");
      },
      onPanUpdate: (details) {
        //用户手指滑动时，更新偏移，重新构建
        setState(() {
          _freeLeft += details.delta.dx;
          _freeTop += details.delta.dy;
          if (_freeLeft < 0) {
            _freeLeft = 0;
          } else if (_freeLeft > limitWidth) {
            _freeLeft = limitWidth - 20;
          }
          if (_freeTop < 0) {
            _freeTop = 0;
          } else if (_freeTop > limitHeight) {
            _freeTop = limitHeight - 20;
          }
        });
      },
      onPanEnd: (details) {
        //打印滑动结束时在x、y轴上的速度
        print(details.velocity);
      },
    );
  }

  String _operation = "No Gesture detected!"; //保存事件名

  Widget basicOperation() {
    return GestureDetector(
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
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
