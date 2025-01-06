import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';
import 'package:flutter_book_study/widgetLibrary/basic/button/lw_button.dart';

class ColorThemeDemoPage extends BasePage {
  ColorThemeDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<ColorThemeDemoPage> createState() => _ColorThemeDemoPageState();
}

class _ColorThemeDemoPageState extends BasePageState<ColorThemeDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return changeTheme(context);
  }

  // color的格式为argb  每个分量占8位，所以0xff1ac233 分别代表a、r、g、b

  // 将十六进制的颜色字符串转化为颜色
  Color parseColor({String colorString = '1ac233'}) {
    final colorInt = int.tryParse(colorString, radix: 16);
    //转化方式一 通过位运算符将Alpha设置为FF
    // return Color((colorInt ?? 0) | 0xff000000);
    //转化方式二 通过方法将Alpha设置为FF
    return Color(colorInt ?? 0).withAlpha(255);
  }

  // Color 类中提供了一个computeLuminance()方法，它可以返回一个[0-1]的一个值，数字越大颜色就越浅
  bool isDark(Color color) {
    // 小于0.5 表示是深色 否则是浅色
    return color.computeLuminance() < 0.5;
  }

  void materialColorDemo() {
    // 默认是shade500 数值越大颜色越深
    var color = Colors.yellow;
    var shadeColor = color.shade50;
    shadeColor = color.shade100;
    shadeColor = color.shade200;
    shadeColor = color.shade300;
    shadeColor = color.shade400;
    shadeColor = color.shade500;
    shadeColor = color.shade600;
    shadeColor = color.shade700;
    shadeColor = color.shade800;
    shadeColor = color.shade900;
  }

  /*
  ThemeData({
  Brightness? brightness, //深色还是浅色
  MaterialColor? primarySwatch, //主题颜色样本，见下面介绍
  Color? primaryColor, //主色，决定导航栏颜色
  Color? cardColor, //卡片颜色
  Color? dividerColor, //分割线颜色
  ButtonThemeData buttonTheme, //按钮主题
  Color dialogBackgroundColor,//对话框背景颜色
  String fontFamily, //文字字体
  TextTheme textTheme,// 字体主题，包括标题、body等文字样式
  IconThemeData iconTheme, // Icon的默认样式
  TargetPlatform platform, //指定平台，应用特定平台控件风格
  ColorScheme? colorScheme,
  ...
  })
  */
  void themeDemo() {
    //themeData中只包含了可自定义部分

    ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.brown,
      primaryColor: Colors.amberAccent,
      cardColor: Colors.yellow,
      dividerColor: Colors.grey,
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        minWidth: 100.0,
        height: 44.0,
        padding: EdgeInsets.zero,
        //   shape:
      ),
      dialogBackgroundColor: Colors.black.withAlpha(20),
      //   fontFamily:
      //   textTheme:
      // iconTheme:
      platform: TargetPlatform.iOS,
      //   colorScheme:
    );
  }

  var _themeColor = Colors.teal;
  // 路由换肤功能
  Widget changeTheme(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
            primarySwatch: _themeColor,
            iconTheme: IconThemeData(color: _themeColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //第一行Icon使用主题中的IconTheme
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text('颜色跟随主题')
              ],
            ),
            //第一行Icon自定义颜色(固定为黑色)
            Theme(
                data: themeData.copyWith(
                    iconTheme:
                        themeData.iconTheme.copyWith(color: Colors.black)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text('颜色固定黑色')
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            LWButton.text(
              text: '点击切换主题颜色',
              onPressed: () {
                setState(() {
                  _themeColor =
                      _themeColor == Colors.teal ? Colors.blue : Colors.teal;
                });
              },
            )
          ],
        ));
  }
}
