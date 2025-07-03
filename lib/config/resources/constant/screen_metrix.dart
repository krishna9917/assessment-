import 'package:flutter_screenutil/flutter_screenutil.dart';

double hpx(px) {
  int result = px;
  return result.h;
}

double wpx(px) {
  int result = px;
  return result.w;
}

double fpx(px) {
  return px.sp;
}

double rpx(px) {
  int result = px;
  return result.r;
}