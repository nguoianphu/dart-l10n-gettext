/*
 * Copyright (c) 2017, Michael Mitterer (office@mikemitterer.at),
 * IT-Consulting and Development Limited.
 *
 * All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Parses .dart and HTML-Files for l10n translatable strings and comments
 * to generate a POT-File
 *
 * More on POT Files:
 *      https://www.crossdart.info/p/angular/1.1.2+2/application.dart.html
 */
library l10n.parser;

import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:validate/validate.dart';

part 'parser/Lexer.dart';
part 'parser/Parser.dart';
part 'parser/Statement.dart';
part 'parser/Token.dart';

part 'parser/pot.dart';
part 'parser/tools.dart';
