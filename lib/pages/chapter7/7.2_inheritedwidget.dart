import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';
import 'package:flutter_book_study/widgetLibrary/basic/button/lw_button.dart';

class _ShareDataWidget extends InheritedWidget {
  const _ShareDataWidget({Key? key, required this.data, required this.child})
      : super(key: key, child: child);

  final int data;

  @override
  final Widget child;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static _ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ShareDataWidget>();
  }

  //这种定义方法，子widget不会调用didChangeDependencies
//   static _ShareDataWidget of(BuildContext context) {
//     return context
//         .getElementForInheritedWidgetOfExactType<_ShareDataWidget>()!
//         .widget as _ShareDataWidget;
//   }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(_ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  // const _TestWidget({super.key});

  @override
  State<_TestWidget> createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(_ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

class InheritedWidgetDemo extends BasePage {
  InheritedWidgetDemo({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });

  @override
  State<InheritedWidgetDemo> createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends BasePageState<InheritedWidgetDemo> {
  int count = 0;

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: _ShareDataWidget(
          data: count,
          child: Row(
            children: [
              Expanded(child: StatefulBuilder(
                builder: (context, setState1) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _TestWidget(), //子widget中依赖ShareDataWidget
                      ),
                      LWButton.text(
                        text: '点击增加',
                        onPressed: () => setState1(() {
                          count++;
                        }),
                      )
                    ],
                  );
                },
              )),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _TestWidget(), //子widget中依赖ShareDataWidget
                  ),
                  LWButton.text(
                    text: '点击增加',
                    onPressed: () => setState(() {
                      count++;
                    }),
                  )
                ],
              ))
            ],
          )),
    );
  }
}

/*
注意，如果将上面示例中ShareDataWidget.of()方法实现改成调用getElementForInheritedWidgetOfExactType()，运行示例后，点击"Increment"按钮，会发现__TestWidgetState的didChangeDependencies()方法确实不会再被调用，但是其build()仍然会被调用！造成这个的原因其实是，点击"Increment"按钮后，会调用_InheritedWidgetTestRouteState的setState()方法，此时会重新构建整个页面，由于示例中，__TestWidget 并没有任何缓存，所以它也都会被重新构建，所以也会调用build()方法。

那么，现在就带来了一个问题：实际上，我们只想更新子树中依赖了ShareDataWidget的组件，而现在只要调用_InheritedWidgetTestRouteState的setState()方法，所有子节点都会被重新build，这很没必要，那么有什么办法可以避免呢？答案是缓存！一个简单的做法就是通过封装一个StatefulWidget，将子Widget树缓存起来，具体做法下一节我们将通过实现一个Provider Widget 来演示如何缓存，以及如何利用InheritedWidget 来实现 Flutter 全局状态共享。
*/