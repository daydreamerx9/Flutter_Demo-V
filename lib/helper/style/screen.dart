import 'package:flutter_screenutil/flutter_screenutil.dart';

double doSetWidth(double width){
  return ScreenUtil().setWidth(width);
}

double doSetHeight(double height){
  return ScreenUtil().setHeight(height);
}

double doSetFont(double fontSize){
  ScreenUtil().setSp(fontSize);
}