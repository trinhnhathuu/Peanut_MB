import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PSize {
  // constructor
  PSize() {
    init();
  }

  static Size _size = const Size(0, 0);
  static PDevice deviceType = PDevice.IPHONE;

  // static final SharedPreferences _sharedPreference;
  static Future<SharedPreferences> get _sharedPreference async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // shared pref instance
  static SharedPreferences? _prefsInstance;

  // call this method from init()
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _sharedPreference;
    return _prefsInstance!;
  }

  static Size get size {
    return Get.size;
    // return _size;
  }

  static void update({double? width, double? height}) {
    _prefsInstance!.setDouble('maxWidth', Get.size.width);
    _prefsInstance!.setDouble('maxHeight', Get.size.height);
    _size = Get.size; //Size(width, height);
  }

  static bool isScreen4_3({double? width, double? height}) {
    double _width = width ?? _size.width;
    double _height = height ?? _size.height;
    // Default screen portrait
    if (_width > _height) {
      // Screen landscape
      final double _temp = _height;
      _height = _width;
      _width = _temp;
    }
    final ratio = _height / _width;
    if (((4 / 3) - ratio).abs() < 0.1) {
      return true;
    }
    return false;
  }

  /*
  * DO NOT OVERIDE PARAM size
  * */
  static double getFontSize({double? width, double? height, double size = 1000}) {
    _size = Get.size;
    double _width = width ?? _size.width;
    double _height = height ?? _size.height;

    // Default screen portrait
    if (_width > _height) {
      // Screen landscape
      final double _temp = _height;
      _height = _width;
      _width = _temp;
    }
    final ratio = _height / _width;

    if (ratio >= 1.9) {
      return (_width * 1.675) / size;
    } else if (ratio >= 1.7) {
      return _height / size;
    } else if (ratio > 1.575) {
      return (_width * 1.575) / size;
    } else {
      return _width / size;
    }
  }

  // table
  static Future<PDevice> get device async {
    if (Platform.isIOS) {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return deviceType = iosInfo.model.toLowerCase() == "ipad" ? PDevice.TABLE : PDevice.IPHONE;
    }
    return PDevice.IPHONE;
  }

  static PDevice get deviceAndroid {
    final shortestSide = MediaQuery.of(Get.context!).size.shortestSide;

    if (shortestSide > 530) {
      // Determine if we should use mobile layout or not, 600 here is
      // a common breakpoint for a typical 7-inch tablet.
      return PDevice.TABLE;
    } else {
      return PDevice.IPHONE;
    }
  }

  static bool isSmallTable() {
    final shortestSide = MediaQuery.of(Get.context!).size.shortestSide;
    final isTable = (Platform.isIOS ? PSize.deviceType : PSize.deviceAndroid) == PDevice.TABLE;
    return isTable && shortestSide < 550;
  }

  static double getDevicePixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static double getHeightRatio(BuildContext context, double uiHeight) {
    return uiHeight / (size.height * getDevicePixelRatio(context));
  }

  static double getAspectRatio() {
    if (size.height <= 667 && size.width <= 375) {
      return 3.7;
    }
    if (size.height <= 812 && size.width <= 375) {
      return 3.7;
    }
    if (size.height <= 820 && size.width <= 375) {
      return 3.7;
    }
    if (size.height <= 852.0 && size.width <= 393.0) {
      return 3.6;
    }
    // if (size.height <= 853.0 && size.width <= 480.0) {
    //   return 3.7;
    // }
    if (size.height <= 960 && size.width <= 420) {
      return 3.6;
      // return 4.1;
    }
    if (size.height <= 960 && size.width <= 480) {
      return 3.6;
    }

    /// ffff
    if (size.height <= 1280 && size.width <= 850) {
      return 4.1;
    }
    if (size.height <= 1370 && size.width <= 1024) {
      return 3.3;
    }
    if (size.height <= 1350 && size.width <= 1024) {
      return 3.9;
    }
    if (size.height <= 1366 && size.width <= 1024) {
      return 3.5;
    }

    //1080 x 2400 XIAOMI K30.
    if (size.height <= 2400 && size.width <= 1080) {
      return 3.5;
    }

    return size.height < 800
        ? 3.8
        : ((Platform.isIOS ? PSize.deviceType : PSize.deviceAndroid) == PDevice.TABLE ? 4.1 : 3.6);
  }
}

enum PDevice {
  TABLE,
  IPHONE,
}
