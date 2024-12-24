import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

class WillPopscopeDemoPage extends BasePage {
  WillPopscopeDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<WillPopscopeDemoPage> createState() => _WillPopscopeDemoPageState();
}

class _WillPopscopeDemoPageState extends BasePageState<WillPopscopeDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container();
  }
}
