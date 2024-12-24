import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

import '6.8_AutomaticKeepAlive.dart';

/*
TabBarView 是 Material 组件库中提供的 Tab 布局组件，通常和 TabBar 配合使用。

----------------------------------------------------------

TabController 用于监听和控制 TabBarView 的页面切换，通常和 TabBar 联动。
如果没有指定，则会在组件树中向上查找并使用最近的一个 DefaultTabController 。

----------------------------------------------------------

TabBar
与 TabBarView 使用同一个 TabController。
TabBar 和 TabBarView 的孩子数量需要一致。
如果没有指定 controller，则会在组件树中向上查找并使用最近的一个 DefaultTabController。
tabs使用Tab组件，Tab组件中，text 和 child 是互斥的，不能同时制定

----------------------------------------------------------

页面缓存
因为TabBarView 内部封装了 PageView，如果要缓存页面，可以参考 PageView 一节中关于页面缓存的介绍。

*/

class TabBarViewPage extends BasePage {
  TabBarViewPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<TabBarViewPage> createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends BasePageState<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  // 简单的方式就是使用DefaultTabController将TabBar和TabBarView一起包裹
  late TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                    icon: const Icon(Icons.shape_line_rounded),
                  ))
              .toList(),
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        const Divider(),
        Expanded(
            child: TabBarView(
          //构建
          controller: _tabController,
          children: tabs.map((e) {
            return KeepAliveWrapper(
              child: Container(
                alignment: Alignment.center,
                child: Text(e, textScaleFactor: 5),
              ),
            );
          }).toList(),
        ))
      ],
    );
  }
}
