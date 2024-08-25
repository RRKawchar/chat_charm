import 'dart:math';

import 'package:flutter/cupertino.dart';

extension BuildContextExtensions on BuildContext{
 void  get unFocusKeyboard=>  FocusScope.of(this).unfocus();

 double get screenHeight=> MediaQuery.of(this).size.height;
 double get screenWidth=> MediaQuery.of(this).size.width;
 Size get screenSize=> MediaQuery.of(this).size;
 double get minScreenSize=> min(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);
 double get maxScreenSize=> min(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);


}