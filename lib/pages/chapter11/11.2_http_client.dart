import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_book_study/pages/chapter6/6.2_signalChildScrollView_%E5%89%AF%E6%9C%AC10.dart';
import 'package:flutter_book_study/widgetLibrary/base/base_page.dart';
import 'package:flutter_book_study/widgetLibrary/utils/size_util.dart';

class HttpClientDemoPage extends BasePage {
  HttpClientDemoPage({
    super.key,
    super.titleName,
    super.route,
    super.args,
  });
  @override
  State<HttpClientDemoPage> createState() => _HttpClientDemoPageState();
}

class _HttpClientDemoPageState extends BasePageState<HttpClientDemoPage> {
  var loading = false;
  String text = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                loading ? null : request();
              },
              child: Text('获取百度首页')),
          Container(
              width: SizeUtil.screenWidth - 50,
              child: Text(text.replaceAll(RegExp(r"\s"), "")))
        ],
      ),
    );
  }

  request() async {
    setState(() {
      loading = true;
      text = "正在请求";
    });
    try {
      //创建一个HttpClient
      HttpClient httpClient = HttpClient();
      //打开Http链接
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse('https://www.baidu.com'));
      // 使用iPhone的UA
      request.headers.add("user-agent",
          'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');
      // 等待服务器返回
      HttpClientResponse response = await request.close();
      //读取内容
      text = await response.transform(utf8.decoder).join();
      // 打印header
      print(response.headers);

      // 关闭HttpClient，通过该client发起的所有请求都会终止
      httpClient.close();
    } catch (e) {
      text = '请求失败：$e';
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void tt1() async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.http('baidu.com'));
    Uri uri = Uri(
        scheme: 'https',
        host: 'flutterchina.club',
        queryParameters: {'aa': "aa", 'bb': 'bbb'});

    request.headers.add('user-agent', 'test');

    String payload = '...';
    request.add(utf8.encode(payload));
    // request.addStream(_inputStream);//可以直接添加输入流

    HttpClientResponse response = await request.close();

    String responseBody = await response.transform(utf8.decoder).join();

    httpClient.close();
  }

  //HttpClient配置
  void tt2() {
    HttpClient httpClient = HttpClient();
    /*
    对应请求头中的keep-alive字段值，为了避免频繁建立连接，httpClient在请求结束后会保持连接一段时间，超过这个阈值后才会关闭连接。
    */
    httpClient.idleTimeout = const Duration(seconds: 15);
    /*
    和服务器建立连接的超时，如果超过这个值则会抛出SocketException异常。
    */
    httpClient.connectionTimeout = const Duration(minutes: 3);
    /*
    同一个host，同时允许建立连接的最大数量。
    */
    httpClient.maxConnectionsPerHost = 10;
    /*
    autoUncompress	对应请求头中的Content-Encoding，如果设置为true，则请求头中Content-Encoding的值为当前HttpClient支持的压缩算法列表，目前只有"gzip"
    */
    httpClient.autoUncompress = true;
    /*
    对应请求头中的User-Agent字段。
    */
    httpClient.userAgent =
        'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1';
  }

  // HTTP请求认证
  void tt3() {
    HttpClient httpClient = HttpClient();

    var uri = Uri.https('baidu.com');
    //basic 认证
    httpClient.addCredentials(
        uri, 'admin', HttpClientBasicCredentials('username', 'password'));
    // digest认证
    httpClient.addCredentials(Uri.https('baidu.com'), 'admin',
        HttpClientDigestCredentials('username', 'password'));
    /*
    这是一个setter，类型是一个回调，当服务器需要用户凭据且该用户凭据未被添加时，httpClient会调用此回调，在这个回调当中，一般会调用addCredential()来动态添加用户凭证，例如：
    */
    httpClient.authenticate = (Uri url, String scheme, String? realm) async {
      if (url.host == 'xx.com' && realm == 'admin') {
        //basic 认证
        httpClient.addCredentials(
            uri, 'admin', HttpClientBasicCredentials('username', 'password'));
        return true;
      }
      return false;
    };
  }

  // 代理设置
  void tt4() {
    HttpClient httpClient = HttpClient();
    httpClient.findProxy = (uri) {
      // 如果需要过滤uri，可以手动判断
      return "PROXY 192.168.1.2:8888";
    };
    // 代理服务器也开启了身份认证
    httpClient.authenticateProxy =
        (String host, int port, String scheme, String? realm) async {
      if (host == 'xx.com' && realm == 'admin') {
        //basic 认证
        httpClient.addCredentials(Uri(path: "PROXY 192.168.1.2:8888"), 'admin',
            HttpClientBasicCredentials('username', 'password'));
        return true;
      }
      return false;
    };
  }

  // 证书校验
  void tt5() {
    HttpClient httpClient = HttpClient();
    String PEM = 'xxxxx';
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      if (cert.pem == PEM) {
        return true; //证书一致，则允许发送数据
      }
      return false;
    };

    //自签名证书，添加到本地证书信任链中,就不用再走到badCertificateCallback回调
    SecurityContext sc = SecurityContext();
    String file = 'xxx';
    //file为证书路径
    sc.setTrustedCertificates(file);
    //创建一个HttpClient
    // HttpClient httpClient = HttpClient(context: sc);
  }

  
}
