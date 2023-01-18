import 'package:sizer/sizer.dart';

class Dimensions {
  static double h5 = (SizerUtil.deviceType == DeviceType.mobile) ? 10.sp : 8.sp;
  static double h4 = (SizerUtil.deviceType == DeviceType.mobile) ? 11.sp : 9.sp;
  static double h3 = (SizerUtil.deviceType == DeviceType.mobile) ? 12.sp : 10.sp;
  static double h2 = (SizerUtil.deviceType == DeviceType.mobile) ? 15.sp : 13.sp;
  static double h1 = (SizerUtil.deviceType == DeviceType.mobile) ? 16.sp : 14.sp;
}