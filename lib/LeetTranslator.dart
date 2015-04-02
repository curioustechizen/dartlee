// Copyright (c) 2015, Kiran Rao. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The LeetTranslator library.
library LeetTranslator;
import 'package:quiver/collection.dart';

BiMap mapping = new BiMap()..addAll({
  'a': '4',
  'e': '3',
  'g': '6',
  'i': '1',
  'o': '0',
  's': '5',
  't': '7'
});


BiMap inverse = mapping.inverse;


String toLeet(String english) {
  return english.replaceAllMapped(
      new RegExp(r'[aegiost]{1}',multiLine: true, caseSensitive: false), 
      (Match m) => "${mapping[m[0].toLowerCase()]}"
  );
}

String fromLeet(String leet) {
  return leet.replaceAllMapped(
      new RegExp(r'[4361057]{1}', multiLine: true, caseSensitive: false), 
      (Match m)=> "${inverse[m[0]]}");
}
