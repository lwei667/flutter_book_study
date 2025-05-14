import 'dart:async';
import 'dart:isolate' as ISO;

void main() {
  Future(
    () => print('22222'),
  );
  scheduleMicrotask(
    () => print('11111111'),
  );
  // Future.delayed(Duration(seconds: 1), () {
  //   print('完成');
  //   scheduleMicrotask(
  //     () => print('11111111'),
  //   );
  // }).then(
  //   (value) => print('222222222'),
  // );
}

void t1() {
  ISO.ReceivePort rPort = ISO.ReceivePort();
  ISO.Isolate.spawn(ttt, rPort.sendPort);
}

void ttt(ISO.SendPort port) {
  ISO.Isolate.exit(port, '');
}
