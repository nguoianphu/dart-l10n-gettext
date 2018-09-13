library l10n;

import "dart:collection";
import 'dart:convert';
import 'package:intl/intl.dart';

import "package:validate/validate.dart";

export 'package:intl/intl.dart';

part "interfaces.dart";

part 'l10n/L10NImpl.dart';

/// Shortcut to get a L10N object
///
/// All \n, \r and more than one spaces will be stripped.
String l10n(final String msgid, [final Map<String, dynamic> vars = const {} ]) {
    return L10N(msgid,vars).message;
}

/// Shortcut to get a L10N object
String gettext(final String msgid, [final Map<String, dynamic> vars = const {} ]) {
    return l10n(msgid,vars);
}

/// Shortcut to get a L10N object
String tr(final String msgid, [final Map<String, dynamic> vars = const {} ]) {
    return l10n(msgid,vars);
}
