import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
Sliver 的布局协议如下：

Viewport 将当前布局和配置信息通过 SliverConstraints 传递给 Sliver。
Sliver 确定自身的位置、绘制等信息，保存在 geometry 中（一个 SliverGeometry 类型的对象）。
Viewport 读取 geometry 中的信息来对 Sliver 进行布局和绘制。



*/

class ListenerPage extends BasePage {
  ListenerPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<ListenerPage> createState() => _ListenerPageState();
}

class _ListenerPageState extends BasePageState<ListenerPage> {
  PointerEvent? _event;
  @override
  Widget buildBody(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}
