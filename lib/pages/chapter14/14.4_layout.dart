import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

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

class CustomCenter extends SingleChildRenderObjectWidget {
  const CustomCenter({Key? key, required Widget child})
      : super(key: key, child: child);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCenter();
  }
}

class RenderCustomCenter extends RenderShiftedBox {
  RenderCustomCenter({RenderBox? child}) : super(child);

  @override
  Size computeDryLayout(covariant BoxConstraints constraints) {
    // TODO: implement computeDryLayout
    return super.computeDryLayout(constraints);
  }

  @override
  void performLayout() {
    //1. 先对子组件进行layout，随后获取它的size
    child?.layout(
      constraints.loosen(), //将约束传递给子节点
      parentUsesSize: true, // 因为我们接下来要使用child的size,所以不能为false
    );
    //2. 根据子组件的大小确定自身的大小
    size = constraints.constrain(Size(
        constraints.maxWidth == double.infinity
            ? child!.size.width
            : double.infinity,
        constraints.maxHeight == double.infinity
            ? child!.size.height
            : double.infinity));

    // 3. 根据父节点子节点的大小，算出子节点在父节点中居中之后的偏移，然后将这个偏移保存在
    // 子节点的parentData中，在后续的绘制阶段，会用到。
    BoxParentData parentData = child!.parentData as BoxParentData;
    parentData.offset = ((size - child!.size) as Offset) / 2;
  }
}

class LeftRightBox extends MultiChildRenderObjectWidget {
  LeftRightBox({
    Key? key,
    required List<Widget> children,
  })  : assert(children.length == 2, '只能传两个children'),
        super(key: key, children: children);
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    throw UnimplementedError();
  }
}

class LeftRightParentData extends ContainerBoxParentData<RenderBox> {}

class RenderLeftRight extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, LeftRightParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, LeftRightParentData> {
  // 初始化每一个child的parentData
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! LeftRightParentData) {
      child.parentData = LeftRightParentData();
    }
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    RenderBox leftChild = firstChild!;
    LeftRightParentData childParentData =
        leftChild.parentData! as LeftRightParentData;
    RenderBox rightChild = childParentData.nextSibling!;

    // 我们限制右孩子宽度不超过总宽度的一半
    rightChild.layout(
      constraints.copyWith(maxWidth: constraints.maxWidth / 2),
      parentUsesSize: true,
    );

    // 调整右子节点的offset
    childParentData = rightChild.parentData! as LeftRightParentData;
    childParentData.offset =
        Offset(constraints.maxWidth - rightChild.size.width, 0);

    // 布局左子节点
    // 左子节点的offset默认为（0，0），为了确保左子节点始终能显示，我们不修改它的offset
    leftChild.layout(
        constraints.copyWith(
            maxWidth: constraints.maxWidth - rightChild.size.width),
        parentUsesSize: true);

    //设置LeftRight自身的size
    size = Size(constraints.maxWidth,
        max(leftChild.size.height, rightChild.size.height));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // TODO: implement paint
    defaultPaint(context, offset);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    // TODO: implement hitTestChildren
    return defaultHitTestChildren(result, position: position);
  }
}
