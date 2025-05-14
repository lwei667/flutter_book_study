import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';

class CustomPaintDemo1 extends BasePage {
  CustomPaintDemo1({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<CustomPaintDemo1> createState() => _CustomPaintDemo1State();
}

class _CustomPaintDemo1State extends BasePageState<CustomPaintDemo1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RepaintBoundary(
            child: SizedBox(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: ChessBoardPainter(),
                child: RepaintBoundary(
                    child: CustomPaint(
                  painter: ChessPiecesPainter(),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //添加一个刷新button
          ElevatedButton(onPressed: () {}, child: Text("刷新"))
        ],
      ),
    );
  }
}

class ChessBoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('paint board');
    var rect = Offset.zero & size;
    drawChessboard(canvas, rect);
  }

  @override
  bool shouldRepaint(ChessBoardPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ChessBoardPainter oldDelegate) => false;

  //棋盘绘制
  drawChessboard(Canvas canvas, Rect rect) {
    //棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = const Color(0xffdcc48c);
    canvas.drawRect(rect, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black38
      ..strokeWidth = 1.0;

    //画横线
    for (var i = 0; i < 16; i++) {
      var dy = rect.top + rect.height / 15 * i;
      canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
    }

    //画竖线
    for (var i = 0; i < 16; i++) {
      double dx = rect.left + rect.width / 15 * i;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
    }
  }
}

class ChessPiecesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('paint pieces');
    var rect = Offset.zero & size;
    drawPieces(canvas, rect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  //棋子绘制
  drawPieces(Canvas canvas, Rect rect) {
    double eWidth = rect.width / 15;
    double eHeight = rect.height / 15;
    //画一个黑子
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset(rect.center.dx - eWidth / 2, rect.center.dy - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(rect.center.dx + eWidth / 2, rect.center.dy - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
  }
}
