import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';
import 'package:dio/dio.dart';

class HttpDioDemoPage extends BasePage {
  HttpDioDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<HttpDioDemoPage> createState() => _HttpDioDemoPageState();
}

class _HttpDioDemoPageState extends BasePageState<HttpDioDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container();
  }
}
