import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

class ValueListenableDemoPage extends BasePage {
  ValueListenableDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<ValueListenableDemoPage> createState() =>
      _ValueListenableDemoPageState();
}

class _ValueTest {
  _ValueTest({
    this.name = '张三',
    this.age = 20,
    this.height = 175,
    this.weight = 70,
  });
  _ValueTest copyWith({
    int? age,
    String? name,
    double? height,
    double? weight,
  }) {
    return _ValueTest(
        name: name ?? this.name,
        age: age ?? this.age,
        height: height ?? this.height,
        weight: weight ?? this.weight);
  }

  int age;
  String name;
  double height;
  double weight;
}

class _ValueListenableDemoPageState
    extends BasePageState<ValueListenableDemoPage> {
  // 定义一个ValueNotifier，当数字变化时会通知ValueListenableBuilder
  // final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<_ValueTest> _counter =
      ValueNotifier<_ValueTest>(_ValueTest());
  static const double textScaleFactor = 1.5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    // 添加+按钮不会触发整个ValueListenableDemoPage组件的build
    debugPrint('build');
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              //builder 方法只会在 _counter 变化时被调用
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  child!,
                  Text(
                    '${value.name} ${value.age} ${value.height} ${value.weight}',
                    // '$value 次',
                    textScaler: const TextScaler.linear(textScaleFactor),
                  )
                ],
              );
            },
            // 当子组件不依赖变化的数据，且子组件收件开销比较大时，指定 child 属性来缓存子组件非常有用
            child: const Text(
              '点击了',
              textScaler: TextScaler.linear(textScaleFactor),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          IconButton(
              onPressed: () {
                // 点击后值 +1，触发 ValueListenableBuilder 重新构建
                // _counter.value += 1;
                // 只改变模型的内部值是不行的
                // _counter.value.name = '李四';
                _counter.value =
                    _counter.value.copyWith(age: _counter.value.age + 1);
              },
              icon: const Icon(
                Icons.add,
                size: 40,
              ))
        ],
      ),
    );
  }
}
