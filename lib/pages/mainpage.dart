import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Image.network(
            "src",
            fit: BoxFit.cover,
            width: ScreenUtil().setWidth(10),
            height: ScreenUtil().setHeight(10),
          ),
          title: Text("全部"),
        ),
        body: Column(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  leading: Image.network("src"),
                  title: Text("user name"),
                  subtitle: Text("time and phonedevice"),
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
