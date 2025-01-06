import 'package:flutter/material.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';
import 'package:flutter_book_study/widgetLibrary/basic/button/lw_button.dart';

class DialogDemoPage extends BasePage {
  DialogDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<DialogDemoPage> createState() => _DialogDemoPageState();
}

class _DialogDemoPageState extends BasePageState<DialogDemoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const Text(
                  'AlertDialog',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                showAlertDialog(context);
              },
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const Text(
                  'SimpleDialog',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                showSimpleDialog(context);
              },
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const Text(
                  'ListDialog',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                showListDialog(context);
              },
            ),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const Text(
                  '自定义缩放动画打开',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                _showCustomDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('提示'),
                      titleTextStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                      content: const Text('确定删除当前文件?'),
                      contentTextStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue.shade300),
                      elevation: 0.7,
                      actions: [
                        LWButton.text(
                          text: '取消',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        LWButton.text(
                          text: '确定',
                          onPressed: () => Navigator.of(context).pop(),
                        )
                      ],
                    );
                  },
                );
              },
            )
          ],
        ));
  }

  void showAlertDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: const Text('提示'),
          titleTextStyle: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellow),
          content: const Text('确定删除当前文件?'),
          contentTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.blue.shade300),
          elevation: 0.7,
          actions: [
            LWButton.text(
              text: '取消',
              onPressed: () => Navigator.of(ctx).pop(),
            ),
            LWButton.text(
              text: '确定',
              onPressed: () => Navigator.of(ctx).pop(),
            )
          ],
        );
      },
    );
  }

  void showSimpleDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          titleTextStyle: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.yellow),
          elevation: 0.7,
          children: [
            SimpleDialogOption(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text('中文简体'),
              ),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
            SimpleDialogOption(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text('英语'),
              ),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> showListDialog(BuildContext ctx) async {
    var index = await showDialog<int>(
      context: ctx,
      builder: (context) {
        var child = Column(
          children: [
            const ListTile(
              title: Text('请选择'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(index.toString()),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            )
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(
          child: child,
        );
      },
    );
    if (index != null) {
      print('点击了: $index');
    }
  }
}

Future<T?> _showCustomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
  ThemeData? theme,
}) {
  final ThemeData theme = Theme.of(context);

  return showGeneralDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87,
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
    pageBuilder: (context, animation, secondaryAnimation) {
      final pageChild = Builder(builder: builder);
      return SafeArea(child: Builder(
        builder: (context) {
          return Theme(data: theme, child: pageChild);
        },
      ));
    },
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  //使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
    child: child,
  );
}
