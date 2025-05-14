import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

class LayerPaint3Demo extends BasePage {
  LayerPaint3Demo({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });

  @override
  State<LayerPaint3Demo> createState() => _LayerPaint3DemoState();
}

class _LayerPaint3DemoState extends BasePageState<LayerPaint3Demo> {
  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChessWidget2(),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('setState'))
        ],
      ),
    );
  }
}

class ChessWidget2 extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return ChessRenderClass2();
  }
}

class ChessRenderClass2 extends RenderBox {
  @override
  void performLayout() {
    //确定widget的大小
    size = constraints.constrain(
      constraints.isTight ? Size.infinite : Size(150, 150),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    var rect = offset & size;
    //检查棋盘大小是否需要变换，如果变换，则需要重新绘制棋盘并缓存
    _checkIfChessboardNeedsUpdate(rect);
    //将缓存棋盘的layer添加到context中，每次重绘都要调用
    context.addLayer(_layer);

    drawPieces(context.canvas, rect);
  }

  //绘制棋盘
  void drawChessboard(Canvas canvas, Rect rect) {}
  //绘制棋子
  void drawPieces(Canvas canvas, Rect rect) {}

  //保存之前的棋盘大小
  Rect _rect = Rect.zero;
  PictureLayer _layer = PictureLayer(Rect.zero);
  _checkIfChessboardNeedsUpdate(Rect rect) {
    //如果绘制区域大小没发生变化，则无需重绘棋牌
    if (_rect == rect) return;

    //绘制区域发生了变换，需要重新绘制并缓存棋盘
    _rect = rect;
    print('paint chessboard');

    //新建一个PictureLayer,用于缓存棋盘的绘制结果，并添加到layer中
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    drawChessboard(canvas, rect);
    //将绘制产物保存在pictureLayer中
    _layer = PictureLayer(Rect.zero)..picture = recorder.endRecording();
  }
}
