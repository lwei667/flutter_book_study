import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
具体布局过程：
*/

class SignalChildScrollViewPage extends BasePage {
  SignalChildScrollViewPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<SignalChildScrollViewPage> createState() =>
      _SignalChildScrollViewPageState();
}

class _SignalChildScrollViewPageState
    extends BasePageState<SignalChildScrollViewPage> {
  @override
  Widget buildBody(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      // 显示进度条
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str
                .split("")
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        c,
                        textScaleFactor: 2.0,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
