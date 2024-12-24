import 'package:flutter/material.dart';
import 'package:flutter_book_study/pages/chapter5/5.3_transform.dart';
import 'package:flutter_book_study/pages/chapter6/6.10_customScrollView.dart';
import 'package:flutter_book_study/pages/chapter6/6.11_custom_sliver.dart';
import 'package:flutter_book_study/pages/chapter6/6.1_scrollable_abstact.dart';
import 'package:flutter_book_study/pages/chapter6/6.2_signalChildScrollView.dart';
import 'package:flutter_book_study/pages/chapter6/6.3_listView.dart';
import 'package:flutter_book_study/pages/chapter6/6.4_scrollController.dart';
import 'package:flutter_book_study/pages/chapter6/6.5_animatedList.dart';
import 'package:flutter_book_study/pages/chapter6/6.6_gridView.dart';
import 'package:flutter_book_study/pages/chapter6/6.7_pageView.dart';
import 'package:flutter_book_study/pages/chapter6/6.8_AutomaticKeepAlive.dart';
import 'package:flutter_book_study/pages/chapter6/6.9_TabBarView.dart';
import 'package:flutter_book_study/pages/chapter7/7.1_willpopscope.dart';
import 'package:flutter_book_study/pages/chapter7/7.2_inheritedwidget.dart';
import 'package:flutter_book_study/pages/chapter7/7.3_custom_provider.dart';
import 'package:flutter_book_study/pages/chapter8/8.1_listener.dart';
import 'package:flutter_book_study/pages/chapter8/8.2_gesture.dart';

class AppRoutesTool {
  AppRoutesTool._();
  static final _chapters = [
    _AppChapterNames.chapter1,
    _AppChapterNames.chapter2,
    _AppChapterNames.chapter3,
    _AppChapterNames.chapter4,
    _AppChapterNames.chapter5,
    _AppChapterNames.chapter6,
    _AppChapterNames.chapter7,
    _AppChapterNames.chapter8,
    _AppChapterNames.chapter9,
    _AppChapterNames.chapter10,
    _AppChapterNames.chapter11,
    _AppChapterNames.chapter12,
    _AppChapterNames.chapter13,
    _AppChapterNames.chapter14,
    _AppChapterNames.chapter15,
  ];
  static int get chapterCount => _chapters.length;
  static String chapterName(int chapter) =>
      chapterCount > chapter ? _chapters[chapter] : '';
  static List<String> sections(int chapter) {
    switch (chapter) {
      case 0:
        return [
          AppSectionNames.section1_1,
          AppSectionNames.section1_2,
          AppSectionNames.section1_3,
          AppSectionNames.section1_4
        ];
      case 1:
        return [
          AppSectionNames.section2_1,
          AppSectionNames.section2_2,
          AppSectionNames.section2_3,
          AppSectionNames.section2_4,
          AppSectionNames.section2_5,
          AppSectionNames.section2_6,
          AppSectionNames.section2_7,
          AppSectionNames.section2_8,
        ];
      case 2:
        return [
          AppSectionNames.section3_1,
          AppSectionNames.section3_2,
          AppSectionNames.section3_3,
          AppSectionNames.section3_4,
          AppSectionNames.section3_5,
          AppSectionNames.section3_6,
        ];
      case 3:
        return [
          AppSectionNames.section4_1,
          AppSectionNames.section4_2,
          AppSectionNames.section4_3,
          AppSectionNames.section4_4,
          AppSectionNames.section4_5,
          AppSectionNames.section4_6,
          AppSectionNames.section4_7,
          AppSectionNames.section4_8,
        ];
      case 4:
        return [
          AppSectionNames.section5_1,
          AppSectionNames.section5_2,
          AppSectionNames.section5_3,
          AppSectionNames.section5_4,
          AppSectionNames.section5_5,
          AppSectionNames.section5_6,
          AppSectionNames.section5_7,
          AppSectionNames.section5_8,
        ];
      case 5:
        return [
          AppSectionNames.section6_1,
          AppSectionNames.section6_2,
          AppSectionNames.section6_3,
          AppSectionNames.section6_4,
          AppSectionNames.section6_5,
          AppSectionNames.section6_6,
          AppSectionNames.section6_7,
          AppSectionNames.section6_8,
          AppSectionNames.section6_9,
          AppSectionNames.section6_10,
          AppSectionNames.section6_11,
          AppSectionNames.section6_12,
        ];
      case 6:
        return [
          AppSectionNames.section7_1,
          AppSectionNames.section7_2,
          AppSectionNames.section7_3,
          AppSectionNames.section7_4,
          AppSectionNames.section7_5,
          AppSectionNames.section7_6,
          AppSectionNames.section7_7,
        ];
      case 7:
        return [
          AppSectionNames.section8_1,
          AppSectionNames.section8_2,
          AppSectionNames.section8_3,
          AppSectionNames.section8_4,
          AppSectionNames.section8_5,
          AppSectionNames.section8_6,
        ];
      case 8:
        return [
          AppSectionNames.section9_1,
          AppSectionNames.section9_2,
          AppSectionNames.section9_3,
          AppSectionNames.section9_4,
          AppSectionNames.section9_5,
          AppSectionNames.section9_6,
          AppSectionNames.section9_7,
        ];
      case 9:
        return [
          AppSectionNames.section10_1,
          AppSectionNames.section10_2,
          AppSectionNames.section10_3,
          AppSectionNames.section10_4,
          AppSectionNames.section10_5,
          AppSectionNames.section10_6,
          AppSectionNames.section10_7,
          AppSectionNames.section10_8,
        ];
      case 10:
        return [
          AppSectionNames.section11_1,
          AppSectionNames.section11_2,
          AppSectionNames.section11_3,
          AppSectionNames.section11_4,
          AppSectionNames.section11_5,
          AppSectionNames.section11_6,
          AppSectionNames.section11_7,
        ];
      case 11:
        return [
          AppSectionNames.section12_1,
          AppSectionNames.section12_2,
        ];
      case 12:
        return [
          AppSectionNames.section13_1,
          AppSectionNames.section13_2,
          AppSectionNames.section13_3,
          AppSectionNames.section13_4
        ];
      case 13:
        return [
          AppSectionNames.section14_1,
          AppSectionNames.section14_2,
          AppSectionNames.section14_3,
          AppSectionNames.section14_4,
          AppSectionNames.section14_5,
          AppSectionNames.section14_6,
          AppSectionNames.section14_7,
          AppSectionNames.section14_8,
        ];
      case 14:
        return [
          AppSectionNames.section15_1,
          AppSectionNames.section15_2,
          AppSectionNames.section15_3,
          AppSectionNames.section15_4,
          AppSectionNames.section15_5,
          AppSectionNames.section15_6,
          AppSectionNames.section15_7,
          AppSectionNames.section15_8,
        ];
      default:
        return [];
    }
  }

  static String sectionName(String section) =>
      _designSectionTitles[section] ?? section;
}

/// 章节名
class _AppChapterNames {
  const _AppChapterNames._();
  static const String chapter1 = '第一章：起步';
  static const String chapter2 = '第二章：第一个Flutter应用';
  static const String chapter3 = '第三章：基础组件';
  static const String chapter4 = '第四章：布局类组件';
  static const String chapter5 = '第五章：容器类组件';
  static const String chapter6 = '第六章：可滚动组件';
  static const String chapter7 = '第七章：功能型组件';
  static const String chapter8 = '第八章：事件处理与通知';
  static const String chapter9 = '第九章：动画';
  static const String chapter10 = '第十章：自定义组件';
  static const String chapter11 = '第十一章：文件操作与网络请求';
  static const String chapter12 = '第十二章：Flutter扩展';
  static const String chapter13 = '第十三章：国际化';
  static const String chapter14 = '第十四章：Flutter核心原理';
  static const String chapter15 = '第十五章：一个完整的Flutter应用';
}

///路由名
class AppSectionNames {
  AppSectionNames._();
  static const String section1_1 = 'section1_1';
  static const String section1_2 = 'section1_2';
  static const String section1_3 = 'section1_3';
  static const String section1_4 = 'section1_4';

  static const String section2_1 = 'section2_1';
  static const String section2_2 = 'section2_2';
  static const String section2_3 = 'section2_3';
  static const String section2_4 = 'section2_4';
  static const String section2_5 = 'section2_5';
  static const String section2_6 = 'section2_6';
  static const String section2_7 = 'section2_7';
  static const String section2_8 = 'section2_8';

  static const String section3_1 = 'section3_1';
  static const String section3_2 = 'section3_2';
  static const String section3_3 = 'section3_3';
  static const String section3_4 = 'section3_4';
  static const String section3_5 = 'section3_5';
  static const String section3_6 = 'section3_6';

  static const String section4_1 = 'section4_1';
  static const String section4_2 = 'section4_2';
  static const String section4_3 = 'section4_3';
  static const String section4_4 = 'section4_4';
  static const String section4_5 = 'section4_5';
  static const String section4_6 = 'section4_6';
  static const String section4_7 = 'section4_7';
  static const String section4_8 = 'section4_8';

  static const String section5_1 = 'section5_1';
  static const String section5_2 = 'section5_2';
  static const String section5_3 = 'section5_3';
  static const String section5_4 = 'section5_4';
  static const String section5_5 = 'section5_5';
  static const String section5_6 = 'section5_6';
  static const String section5_7 = 'section5_7';
  static const String section5_8 = 'section5_8';

  static const String section6_1 = 'section6_1';
  static const String section6_2 = 'section6_2';
  static const String section6_3 = 'section6_3';
  static const String section6_4 = 'section6_4';
  static const String section6_5 = 'section6_5';
  static const String section6_6 = 'section6_6';
  static const String section6_7 = 'section6_7';
  static const String section6_8 = 'section6_8';
  static const String section6_9 = 'section6_9';
  static const String section6_10 = 'section6_10';
  static const String section6_11 = 'section6_11';
  static const String section6_12 = 'section6_12';

  static const String section7_1 = 'section7_1';
  static const String section7_2 = 'section7_2';
  static const String section7_3 = 'section7_3';
  static const String section7_4 = 'section7_4';
  static const String section7_5 = 'section7_5';
  static const String section7_6 = 'section7_6';
  static const String section7_7 = 'section7_7';

  static const String section8_1 = 'section8_1';
  static const String section8_2 = 'section8_2';
  static const String section8_3 = 'section8_3';
  static const String section8_4 = 'section8_4';
  static const String section8_5 = 'section8_5';
  static const String section8_6 = 'section8_6';

  static const String section9_1 = 'section9_1';
  static const String section9_2 = 'section9_2';
  static const String section9_3 = 'section9_3';
  static const String section9_4 = 'section9_4';
  static const String section9_5 = 'section9_5';
  static const String section9_6 = 'section9_6';
  static const String section9_7 = 'section9_7';

  static const String section10_1 = 'section10_1';
  static const String section10_2 = 'section10_2';
  static const String section10_3 = 'section10_3';
  static const String section10_4 = 'section10_4';
  static const String section10_5 = 'section10_5';
  static const String section10_6 = 'section10_6';
  static const String section10_7 = 'section10_7';
  static const String section10_8 = 'section10_8';

  static const String section11_1 = 'section11_1';
  static const String section11_2 = 'section11_2';
  static const String section11_3 = 'section11_3';
  static const String section11_4 = 'section11_4';
  static const String section11_5 = 'section11_5';
  static const String section11_6 = 'section11_6';
  static const String section11_7 = 'section11_7';

  static const String section12_1 = 'section12_1';
  static const String section12_2 = 'section12_2';

  static const String section13_1 = 'section13_1';
  static const String section13_2 = 'section13_2';
  static const String section13_3 = 'section13_3';
  static const String section13_4 = 'section13_4';

  static const String section14_1 = 'section14_1';
  static const String section14_2 = 'section14_2';
  static const String section14_3 = 'section14_3';
  static const String section14_4 = 'section14_4';
  static const String section14_5 = 'section14_5';
  static const String section14_6 = 'section14_6';
  static const String section14_7 = 'section14_7';
  static const String section14_8 = 'section14_8';

  static const String section15_1 = 'section15_1';
  static const String section15_2 = 'section15_2';
  static const String section15_3 = 'section15_3';
  static const String section15_4 = 'section15_4';
  static const String section15_5 = 'section15_5';
  static const String section15_6 = 'section15_6';
  static const String section15_7 = 'section15_7';
  static const String section15_8 = 'section15_8';
}

/// 路由对应页面名
final _designSectionTitles = {
  // 第一章
  AppSectionNames.section1_1: '1.1 移动开发技术简介',
  AppSectionNames.section1_2: '1.2 初识Flutter',
  AppSectionNames.section1_3: '1.3 搭建Flutter开发环境',
  AppSectionNames.section1_4: '1.4 Dart语言简介',

  //第二章
  AppSectionNames.section2_1: '2.1 计数器应用示例',
  AppSectionNames.section2_2: '2.2 Widget简介',
  AppSectionNames.section2_3: '2.3 状态管理',
  AppSectionNames.section2_4: '2.4 路由管理',
  AppSectionNames.section2_5: '2.5 包管理',
  AppSectionNames.section2_6: '2.6 资源管理',
  AppSectionNames.section2_7: '2.7 调试Flutter应用',
  AppSectionNames.section2_8: '2.8 Flutter异常捕获',

  // 第三章
  // AppSectionNames.section3_1: '',

  // 第六章
  AppSectionNames.section6_1: '6.1 可滚动组件简介',
  AppSectionNames.section6_2: '6.2 SingleChildScrollView',
  AppSectionNames.section6_3: '6.3 ListView',
  AppSectionNames.section6_4: '6.4 滚动监听及控制',
  AppSectionNames.section6_5: '6.5 AnimatedList',
  AppSectionNames.section6_6: '6.6 GridView',
  AppSectionNames.section6_7: '6.7 PageView与页面缓存',
  AppSectionNames.section6_8: '6.8 可滚动组件子项缓存',
  AppSectionNames.section6_9: '6.9 TabBarView',
  AppSectionNames.section6_10: '6.10 CustomScrollView 和 Slivers',
  AppSectionNames.section6_11: '6.11 自定义 Sliver',
  AppSectionNames.section6_12: '6.12 嵌套可滚动组件 NestedScrollView',

  // 第七章
  AppSectionNames.section7_1: '7.1 导航返回拦截（WillPopScope）',
  AppSectionNames.section7_2: '7.2 数据共享（InheritedWidget）',
  AppSectionNames.section7_3: '7.3 跨组件状态共享',
  AppSectionNames.section7_4: '7.4 颜色和主题',
  AppSectionNames.section7_5: '7.5 按需rebuild（ValueListenableBuilder）',
  AppSectionNames.section7_6: '7.6 异步UI更新（FutureBuilder、StreamBuilder）',
  AppSectionNames.section7_7: '7.7 对话框详解',

  // 第八章
  AppSectionNames.section8_1: '8.1 原始指针事件处理',
  AppSectionNames.section8_2: '8.2 手势识别',
  AppSectionNames.section8_3: '8.3 Flutter事件机制',
  AppSectionNames.section8_4: '8.4 手势原理与手势冲突',
  AppSectionNames.section8_5: '8.5 事件总线',
  AppSectionNames.section8_6: '8.6 通知 Notification',
};

/// 路由对应的页面
final designRoutes = {
  AppSectionNames.section2_1: (context, title, route, args) => TransformDemo(),
  AppSectionNames.section6_1: (context, title, route, args) =>
      ScrollableAbstactPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_2: (context, title, route, args) =>
      SignalChildScrollViewPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_3: (context, title, route, args) => ListViewPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_4: (context, title, route, args) =>
      ScrollControllerPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_5: (context, title, route, args) => AnimatedListPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_6: (context, title, route, args) => GridViewPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_7: (context, title, route, args) => PageViewPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_8: (context, title, route, args) =>
      AutomaticKeepAlivePage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_9: (context, title, route, args) => TabBarViewPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_10: (context, title, route, args) =>
      CustomScrollViewPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section6_11: (context, title, route, args) =>
      CustomSliverViewPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section7_1: (context, title, route, args) =>
      WillPopscopeDemoPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section7_2: (context, title, route, args) =>
      InheritedWidgetDemo(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section7_3: (context, title, route, args) =>
      CustomProviderDemoPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section8_1: (context, title, route, args) => ListenerPage(
        titleName: title,
        route: route,
        args: args,
      ),
  AppSectionNames.section8_2: (context, title, route, args) => GesturePage(
        titleName: title,
        route: route,
        args: args,
      ),
};

var onGenerateDesignDraftRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final String? title = _designSectionTitles[name];
  var pageContentBuilder = designRoutes[name];
  debugPrint('name:$name,title:$title');
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, title, name, settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context, title, name, {}));
      return route;
    }
  }

  return null;
};
