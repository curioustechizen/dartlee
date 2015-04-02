// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library LeetTranslator_test;

import 'package:LeetTranslator/LeetTranslator.dart';
import 'package:unittest/unittest.dart';

void main() => defineTests();

void defineTests() {
  group('main tests', () {
    test('English to Leet', () {
      expect(toLeet("Hello World"), "H3ll0 W0rld");
    });
    test('Leet to English', (){
      expect(fromLeet("H3ll0 W0rld"), "Hello World");
    });
  });
}
