import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
Animation: 一个抽象类，它本身和UI渲染没有任何关系，而它主要的功能是保存动画的插值和状态
Curve: 在整个动画执行过程中输出的值可以是线性的、曲线的、一个步进函数或者任何其他曲线函数等等，这由Curve来决定
Controller: 动画可以正向运行（从起始状态开始，到终止状态结束），也可以反向运行，甚至可以在中间切换方向
Tween: 区间


动画通知:
1. addListener()：监听每一帧
2. ddStatusListener()：监听动画状态（动画开始、结束、正向或反向）


*/

class AnimationBasicDemoPage extends BasePage {
  AnimationBasicDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<AnimationBasicDemoPage> createState() => _AnimationBasicDemoPageState();
}

class _AnimationBasicDemoPageState extends BasePageState<AnimationBasicDemoPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container();
  }

  void curveDemo() {
    AnimationController controller = AnimationController(
        duration: Duration(seconds: 1), // 动画时长
        lowerBound: 1, // 插值下限 默认0.0
        upperBound: 100, // 插值上限，默认1.0
        vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);

    var animation = Tween<double>(begin: 1, end: 100).animate(curve);
    animation.addListener(
      () {
        print(animation.value);
      },
    );
    var times = 0;
    animation.addStatusListener(
      (status) {
        switch (status) {
          case AnimationStatus.dismissed:
            controller.forward();
            break;
          case AnimationStatus.completed:
            times++;
            if (times < 100) {
              controller.reverse();
            } else {
              controller.stop();
            }

            break;
          default:
        }
      },
    );
    controller.forward();
  }
}
