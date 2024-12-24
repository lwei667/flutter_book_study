import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

/*
Flutter中提供了两个SliverGridDelegate的子类
SliverGridDelegateWithFixedCrossAxisCount和SliverGridDelegateWithMaxCrossAxisExtent

----------------------------------------------------------

SliverGridDelegateWithFixedCrossAxisCount
该子类实现了一个横轴为固定数量子元素的layout算法，其构造函数为：
SliverGridDelegateWithFixedCrossAxisCount({
  @required double crossAxisCount, 
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})

----------------------------------------------------------

SliverGridDelegateWithMaxCrossAxisExtent
该子类实现了一个横轴子元素为固定最大长度的layout算法，其构造函数为：
SliverGridDelegateWithMaxCrossAxisExtent({
  double maxCrossAxisExtent,
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})
maxCrossAxisExtent为子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的
也就是说，用viewport的宽度减去适当的crossAxisSpacing，再除以maxCrossAxisExtent的商就是单行的个数

----------------------------------------------------------
GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount

GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent

GridView.builder需要单独指定布局的delegate

*/

class GridViewPage extends BasePage {
  GridViewPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends BasePageState<GridViewPage> {
  final List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scrollbar(
        thickness: 20,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0, //显示区域宽高相等
          ),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            //如果显示到最后一个并且Icon总数小于200时继续获取数据
            if (index == _icons.length - 1 && _icons.length < 200) {
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          },
        ));
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(const Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}
