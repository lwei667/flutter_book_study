import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';
import 'package:flutter_book_study/widgetLibrary/basic/button/lw_button.dart';

class CustomProviderDemoPage extends BasePage {
  CustomProviderDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<CustomProviderDemoPage> createState() => _CustomProviderDemoPageState();
}

class _CustomProviderDemoPageState
    extends BasePageState<CustomProviderDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return originalBody();
  }

  Widget originalBody() {
    return Center(
      child: _ChangeNotifierProvider(
          data: _CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Builder(
                    builder: (context) {
                      var cart =
                          _ChangeNotifierProvider.of<_CartModel>(context);
                      return Text('总价：${cart?.totalPrice ?? 0}');
                    },
                  ),
                  Builder(
                    builder: (context) {
                      debugPrint('点击按钮build');
                      return LWButton.text(
                        text: '添加商品',
                        onPressed: () {
                          //给购物车中添加商品，添加后总价会更新
                          _ChangeNotifierProvider.of<_CartModel>(context)
                              ?.add(_CartItem(20, 1));
                        },
                      );
                    },
                  )
                ],
              );
            },
          )),
    );
  }
}

// 商品信息类
class _CartItem {
  _CartItem(this.price, this.count);
  double price;
  int count;
}

class _CartModel with ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<_CartItem> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<_CartItem> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(_CartItem item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

// 一个通用的InheritedWidget，保存需要跨组件共享的状态
class _InheritedProvider<T extends ChangeNotifier> extends InheritedWidget {
  const _InheritedProvider({Key? key, required this.data, required this.child})
      : super(key: key, child: child);

  @override
  final Widget child;

  final T data;

  static _InheritedProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedProvider>();
  }

  @override
  bool updateShouldNotify(_InheritedProvider oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

class _ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const _ChangeNotifierProvider(
      {super.key, required this.data, required this.child});

  final Widget child;

  final T data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T? of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<_InheritedProvider>()
        : context
            .getElementForInheritedWidgetOfExactType<_InheritedProvider>()!
            .widget as _InheritedProvider;
    
    return provider?.data as T?;
  }

  @override
  State<_ChangeNotifierProvider> createState() =>
      _ChangeNotifierProviderState();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<_ChangeNotifierProvider> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() {});
  }

  @override
  void didUpdateWidget(_ChangeNotifierProvider oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  /*
  注意，在_ChangeNotifierProviderState类中调用setState()方法，widget.child始终是同一个，所以执行build时，InheritedProvider的child引用的始终是同一个子widget，所以widget.child并不会重新build，这也就相当于对child进行了缓存！当然如果ChangeNotifierProvider父级Widget重新build时，则其传入的child便有可能会发生变化。
  */
  @override
  Widget build(BuildContext context) {
    return _InheritedProvider<T>(data: widget.data as T, child: widget.child);
  }
}
