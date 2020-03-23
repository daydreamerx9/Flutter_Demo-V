import 'dart:async';

import 'package:fake_weibo/fake_weibo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weibo/api/api.dart';
import 'package:flutter_weibo/helper/style/screen.dart';

class LoginMain extends StatefulWidget {
  LoginMain({Key key}) : super(key: key);

  @override
  _LoginMainState createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  static const String _WEIBO_APP_KEY = apiKey;
  static const List<String> _WEIBO_SCOPE = weiboScope;
  Weibo _weibo = Weibo()
    ..registerApp(
      appKey: _WEIBO_APP_KEY,
      scope: _WEIBO_SCOPE,
    );
  StreamSubscription<WeiboAuthResp> _auth;

  WeiboAuthResp _authResp;

  @override
  void initState() {
    super.initState();
    _auth = _weibo.authResp().listen(_listenAuth);
  }

  void _listenAuth(WeiboAuthResp resp) {
    _authResp = resp;
    String content = 'auth: ${resp.errorCode}';
    _showTips('登录', content);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,allowFontScaling:true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: new Border.all(width: 1, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(10.0, 20),
                      blurRadius: 10,
                      spreadRadius: 1.0),
                ],
              ),
              alignment: Alignment.center,
              width: 76,
              height: 76,
              child: Image.asset(
                "assets/images/Logo.png",
                width: 36,
                height: 48,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Flutter_weibo",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 15),
            Text(
              "by V",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              width: 295,
              //width: doSetWidth(295),
              height: 44,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  "Sign up Weibo",
                  style: TextStyle(fontSize: 16),
                ),
                textColor: Colors.white,
                onPressed: () {
                  //Navigator.pushNamed(context, '/LoginWeibo');
                  _weibo.auth(
                    appKey: _WEIBO_APP_KEY,
                    scope: _WEIBO_SCOPE,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTips(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );
  }
}
