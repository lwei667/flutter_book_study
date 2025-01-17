import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

class FutureStreamBuilderDemoPage extends BasePage {
  FutureStreamBuilderDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<FutureStreamBuilderDemoPage> createState() =>
      _FutureStreamBuilderDemoPageState();
}
/*
enum ConnectionState {
  /// 当前没有异步任务，比如[FutureBuilder]的[future]为null时
  none,

  /// 异步任务处于等待状态
  waiting,

  /// Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态。
  active,

  /// 异步任务已经终止.
  done,
}
*/

class _FutureStreamBuilderDemoPageState
    extends BasePageState<FutureStreamBuilderDemoPage> {
  Future<String> mockNetworkData() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return '这里是是互联网上获得的是数据';
    });
  }

  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) {
      return i;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    // return futureDemo();
    return streamDemo();
  }

  Widget futureDemo() {
    return Center(
      child: FutureBuilder(
        future: mockNetworkData(),
        initialData: '初始数据',
        builder: (context, snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text('Error: ${snapshot.error}');
            } else {
              // 请求成功，显示数据
              return Text('Contents; ${snapshot.data}');
            }
          } else {
            // 请求未结束，显示loading
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget streamDemo() {
    return Center(
        child: StreamBuilder(
      stream: counter(),
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('没有stream');
            case ConnectionState.waiting:
              return const Text('等待数据');
            case ConnectionState.active:
              return Text('active; ${snapshot.data}');
            case ConnectionState.done:
              return const Text('Stream 已关闭');
          }
        }
      },
    ));
  }
}
