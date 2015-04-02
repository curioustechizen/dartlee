// Copyright (c) 2015, Kiran Rao. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:LeetTranslator/LeetTranslator.dart' as LeetTranslator;
import 'package:args/args.dart';
import 'dart:io';

const String ARG_INPUT = "input";
const String ARG_OUTPUT = "output";
const String ARG_SOURCE_LANGUAGE = "source-lang";
const String LANGUAGE_LEET = "leet";
const String LANGUAGE_ENGLISH = "eng";


ArgResults argResults;

void main(List<String> arguments){
  final argParser = new ArgParser()
      ..addOption(ARG_INPUT, abbr:'i', help: 'Input file')
      ..addOption(ARG_OUTPUT, abbr: 'o', help: 'Output file')
      ..addOption(ARG_SOURCE_LANGUAGE, abbr: 's', help: 'Source Language', allowed:[LANGUAGE_LEET, LANGUAGE_ENGLISH], defaultsTo: LANGUAGE_LEET);
  
  argResults = argParser.parse(arguments);
  translate(argResults[ARG_INPUT], argResults[ARG_OUTPUT], sourceLanguage: argResults[ARG_SOURCE_LANGUAGE]);
  
  
}

void translate(String inputPath, String outputPath, {String sourceLanguage}){
  var inputString = readFile(inputPath);
  var outputString = sourceLanguage == LANGUAGE_LEET ? LeetTranslator.fromLeet(inputString) : LeetTranslator.toLeet(inputString);
  writeFile(outputPath, outputString);
}

String readFile(String inputPath) {
  File inputFile = new File(inputPath);
  return inputFile.readAsStringSync();
}

void writeFile(String outputPath, String outputString){
  File outputFile = new File(outputPath);
  outputFile.writeAsStringSync(outputString, flush: true);
}