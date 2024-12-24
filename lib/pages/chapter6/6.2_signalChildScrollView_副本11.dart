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
    return super.buildBody(context);
  }
}
