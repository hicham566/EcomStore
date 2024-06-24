
import 'dart:io';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils {

  ///  typically used in Flutter applications to dismiss the on-screen keyboard
  static void hideKeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// typically used in Flutter applications to change the color of the status bar.
  static Future<void> setStatusBarColor(Color color) async{
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color)
    );
  }

  /// for Orientation vertical or horizontal
  static bool isLandscopeOrientation(BuildContext context){
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  /// for Portrait Orientation
  static bool isPortraitOrientation(BuildContext context){
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  /// for Full Screen
  static void setFullScreen(bool enable){
   SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// for Screen Height
  static double getScreenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  /// for Screen Width
  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  ///
  static double getPixelRatio(){
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  ///
  static double getStatusBarHeight(){
    return MediaQuery.of(Get.context!).padding.top;
  }

  ///
  static double getBottomNavigationBarHeight(){
    return kBottomNavigationBarHeight;
  }

  ///
  static double getAppBarHeight(){
    return kToolbarHeight;
  }

  ///
  static double getKeyboardHeight(){
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  /// for Visibility of Keyboard
  static Future<bool> isKeyboardVisible() async{
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0 ;
  }
  
  ///
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }
  
  ///
  static void vibrate(Duration duration){
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  ///
  static Future<void> setPrerredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  ///
  static void hideStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  ///
  static Future<bool> hasInternetConnection() async{
    try{
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    }on SocketException catch(_){
      return false ;
    }
  }

  /// Check if Platform is IOS
  static bool isIOS(){
    return Platform.isIOS;
  }

  /// Check if Platform is Android
  static bool isAndroid(){
    return Platform.isAndroid;
  }

  ///
  static void launchUrl(String url) async{
    if(await canLaunchUrlString(url)){
      await launchUrlString(url);
    }else{
      throw 'Could not launch $url';
    }
  }
}
