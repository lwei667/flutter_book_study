import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
如果addAutomaticKeepAlives 为 true，则 ListView 会为每一个列表项添加一个 AutomaticKeepAlive 父组件

----------------------------------------------------------

AutomaticKeepAlive 的组件的主要作用是将列表项的根 RenderObject 的 keepAlive 按需自动标记 为 true 或 false。
* 当 keepAlive 标记为 false 时，如果列表项滑出加载区域时，列表组件将会被销毁。
* 当 keepAlive 标记为 true 时，当列表项滑出加载区域后，Viewport 会将列表组件缓存起来；当列表项进入加载区域时，Viewport 从先从缓存中查找是否已经缓存，如果有则直接复用，如果没有则重新创建列表项。


----------------------------------------------------------

AutomaticKeepAliveClientMixin

我们只需要提供一个 wantKeepAlive，它会表示 AutomaticKeepAlive 是否需要缓存当前列表项；另外我们必须在 build 方法中调用一下 super.build(context)，该方法实现在 AutomaticKeepAliveClientMixin 中，功能就是根据当前 wantKeepAlive 的值给 AutomaticKeepAlive 发送消息，AutomaticKeepAlive 收到消息后就会开始工作


----------------------------------------------------------

KeepAliveWrapper

封装的工具

*/

class AutomaticKeepAlivePage extends BasePage {
  AutomaticKeepAlivePage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<AutomaticKeepAlivePage> createState() => _AutomaticKeepAlivePageState();
}

class _AutomaticKeepAlivePageState
    extends BasePageState<AutomaticKeepAlivePage> {
  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(itemBuilder: (_, index) {
      return KeepAliveWrapper(
        // 为 true 后会缓存所有的列表项，列表项将不会销毁。
        // 为 false 时，列表项滑出预加载区域后将会别销毁。
        // 使用时一定要注意是否必要，因为对所有列表项都缓存的会导致更多的内存消耗
        keepAlive: true,
        child: _ListItem(index: index),
      );
    });
  }
}

class _ListItem extends StatefulWidget {
  const _ListItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<_ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text('${widget.index}'));
  }

  @override
  void dispose() {
    print('dispose ${widget.index}');
    super.dispose();
  }
}

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
