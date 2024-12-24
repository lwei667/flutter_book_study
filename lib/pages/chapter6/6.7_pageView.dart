import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
  PageView主要属性：
  //每次滑动是否强制切换整个页面，如果为false，则会根据实际的滑动距离显示页面
  this.pageSnapping = true,
  //如果true，会前后缓存一页；如果false，不会缓存
  this.allowImplicitScrolling = false,
  //后面解释
  this.padEnds = true,


  PageView 默认并没有缓存功能，一旦页面滑出屏幕它就会被销毁


*/

class PageViewPage extends BasePage {
  PageViewPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends BasePageState<PageViewPage> {
  @override
  Widget buildBody(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add(_Page(text: '$i'));
    }

    return PageView(
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      allowImplicitScrolling: true,
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: children,
    );
  }
}

// Tab 页面
class _Page extends StatefulWidget {
  const _Page({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }
}
