import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
具体布局过程：

Scrollable 监听到用户滑动行为后，根据最新的滑动偏移构建 Viewport 。
Viewport 将当前视口信息和配置信息通过 SliverConstraints 传递给 Sliver。
Sliver 中对子组件（RenderBox）按需进行构建和布局，然后确认自身的位置、绘制等信息，保存在 geometry 中（一个 SliverGeometry 类型的对象）。



cacheExtent 的默认值是 250，在构建可滚动列表时我们可以指定这个值，这个值最终会传给 Viewport
*/

class ScrollableAbstactPage extends BasePage {
  ScrollableAbstactPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<ScrollableAbstactPage> createState() => _ScrollableAbstactPageState();
}

class _ScrollableAbstactPageState extends BasePageState<ScrollableAbstactPage> {
  @override
  Widget buildBody(BuildContext context) {
    return Scrollbar(
        child: Scrollable(
      viewportBuilder: (context, position) {
        return Viewport(
          offset: position,
          cacheExtentStyle: CacheExtentStyle.pixel,
          slivers: List.generate(
              100,
              (index) => SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('box转sliver $index'),
                    ),
                  )),
        );
      },
      axisDirection: AxisDirection.down,
    ));
  }

  testScrollable() {
    Scrollable(
      viewportBuilder: (context, position) {
        return Viewport(
          offset: position,
          cacheExtentStyle: CacheExtentStyle.pixel,
        );
      },
      axisDirection: AxisDirection.down,
    );
  }

  testListView() {
    ListView.builder(
      itemBuilder: (context, index) {
        return Container();
      },
    );
    PageView.builder(
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
