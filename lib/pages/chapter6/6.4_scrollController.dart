import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
滚动监听  ScrollController    animateTo() 和 jumpTo()
controller.addListener(()=>print(controller.offset))

----------------------------------------------------------

滚动位置恢复，显示指定PageStorageKey，常用在tabbarView切换时，每个tab页中的可滚动组件的
state就会销毁，这时候想恢复滚动位置就需要显示指定PageStorageKey
ListView(key: PageStorageKey(1), ... );
...
ListView(key: PageStorageKey(2), ... );

----------------------------------------------------------

ScrollPosition:用来保存可滚动组件的滚动位置
一个ScrollController可以同时被多个可滚动组件使用，每个都会创建一个ScrollPosition对象，
存在positions属性中，可以通过controller.positions.length来确定controller被几个
可滚动组件使用。
double get offset => position.pixels;

...
controller.positions.elementAt(0).pixels
controller.positions.elementAt(1).pixels
...   

ScrollController的animateTo() 和 jumpTo()实际都是调用
ScrollPosition的animateTo() 和 jumpTo()


----------------------------------------------------------

滚动监听还可以使用NotificationListener，只要在可滚动组件的父级使用即可；
在接收到滚动事件时，参数类型为ScrollNotification，它包括一个metrics属性，
它的类型是ScrollMetrics，该属性包含当前ViewPort及滚动位置等信息：

pixels：当前滚动位置。
maxScrollExtent：最大可滚动长度。
extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。

*/

class ScrollControllerPage extends BasePage {
  ScrollControllerPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<ScrollControllerPage> createState() => _ScrollControllerViewPageState();
}

class _ScrollControllerViewPageState
    extends BasePageState<ScrollControllerPage> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget buildBody(BuildContext context) {
    return Scrollbar(
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          ScrollMetrics metrics = notification.metrics;
          var pixels = metrics.pixels;
          if (pixels < 0) {
            pixels = 0;
          }
          if (pixels > metrics.maxScrollExtent) {
            pixels = metrics.maxScrollExtent;
          }

          double progress = pixels / metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          // atEdge如果滑出边界就是false了，所以最好还是用其他方式判定
          print(
              "extentBefore: ${metrics.extentBefore} extentInside: ${metrics.extentInside}  extentAfter: ${metrics.extentAfter} atEdge: ${metrics.atEdge}");
          return false;
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) => ListTile(title: Text("$index")),
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              backgroundColor: Colors.black54,
              child: Text(_progress),
            )
          ],
        ),
      ),
    );
  }
}
