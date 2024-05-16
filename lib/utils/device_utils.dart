
import 'package:flutter/material.dart';

/// Helper class for device related operations.
///
mixin DeviceUtils {
  ///
  /// hides the keyboard if its already open
  ///
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static void unFocus(BuildContext context) {
    // FocusScope.of(context).requestFocus(FocusNode());
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static void unPrimaryFocus(){
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void nextFocus(){
    FocusManager.instance.primaryFocus?.nextFocus();
  }

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
  ///
  static double getScaledSize(BuildContext context, double scale) =>
      scale *
          (MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.height);

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// width
  ///
  static double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  ///
  /// accepts a double [scale] and returns scaled sized based on the screen
  /// height
  ///
  static double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;
}
