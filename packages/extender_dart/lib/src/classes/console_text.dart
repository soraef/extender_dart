import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:developer' as developer;

import 'package:extender_dart/extender_dart.dart';

class ConsoleStyle {
  static const String escape = '\x1B[';
  static const String clear = '${escape}0m';

  static String backgroundColor(String text, ConsoleColor code) =>
      _applyStyleToEachLine(text, '${escape}4${code.index}m', clear);

  static String foregroundColor(String text, ConsoleColor code) =>
      _applyStyleToEachLine(text, '${escape}3${code.index}m', clear);

  static String bold(String text) =>
      _applyStyleToEachLine(text, '${escape}1m', clear);

  static String italic(String text) =>
      _applyStyleToEachLine(text, '${escape}3m', clear);

  static String underline(String text) =>
      _applyStyleToEachLine(text, '${escape}4m', clear);

  static String blink(String text) =>
      _applyStyleToEachLine(text, '${escape}5m', clear);

  static String reverse(String text) =>
      _applyStyleToEachLine(text, '${escape}7m', clear);

  static String hidden(String text) =>
      _applyStyleToEachLine(text, '${escape}8m', clear);

  static String moveCursorUp(int lines) => '$escape${lines}A';
  static String moveCursorDown(int lines) => '$escape${lines}B';
  static String moveCursorRight(int columns) => '$escape${columns}C';
  static String moveCursorLeft(int columns) => '$escape${columns}D';
  static String setCursorPosition(int row, int col) => '$escape$row;${col}H';
  static String saveCursorPosition() => '${escape}s';
  static String restoreCursorPosition() => '${escape}u';
  static String hideCursor() => '$escape?25l';
  static String showCursor() => '$escape?25h';

  static String clearScreen() => '${escape}2J';
  static String clearLine() => '${escape}2K';
  static String clearFromCursorToEnd() => '${escape}0J';
  static String clearFromCursorToBeginning() => '${escape}1J';

  static String removeEscapeSequences(String text) {
    return text.replaceAll(RegExp('\x1B\\[[0-9;]*[a-zA-Z]'), '');
  }

  static String color(
    String text, {
    ConsoleColor? fg,
    ConsoleColor? bg,
  }) {
    String result = text;
    if (fg != null) result = foregroundColor(result, fg);
    if (bg != null) result = backgroundColor(result, bg);
    return result;
  }

  static String _applyStyleToEachLine(
      String text, String prefix, String suffix) {
    if (!text.contains('\n')) {
      return prefix + text + suffix;
    }

    return text.split('\n').map((line) => prefix + line + suffix).join('\n');
  }
}

class ConsoleText {
  final String _text;

  ConsoleText._(this._text);

  factory ConsoleText.create(String originalText) {
    return ConsoleText._(originalText);
  }

  factory ConsoleText.prettyPrintJson(Map<String, dynamic> json) {
    var encoder = const JsonEncoder.withIndent('  ');
    var prettyPrintedJson = encoder.convert(json);
    return ConsoleText._(prettyPrintedJson);
  }

  ConsoleText _copy(String text) {
    return ConsoleText._(text);
  }

  // Foreground Colors
  ConsoleText get black =>
      _copy(ConsoleStyle.foregroundColor(_text, ConsoleColor.black));
  ConsoleText get red =>
      _copy(ConsoleStyle.foregroundColor(_text, ConsoleColor.red));
  ConsoleText get green =>
      _copy(ConsoleStyle.foregroundColor(_text, ConsoleColor.green));
  ConsoleText get yellow =>
      _copy(ConsoleStyle.foregroundColor(_text, ConsoleColor.yellow));
  ConsoleText get blue =>
      _copy(ConsoleStyle.foregroundColor(_text, ConsoleColor.blue));
  ConsoleText get magenta =>
      _copy(ConsoleStyle.foregroundColor(_text, ConsoleColor.magenta));
  ConsoleText get cyan =>
      _copy(ConsoleStyle.foregroundColor(_text, ConsoleColor.cyan));
  ConsoleText get white =>
      _copy(ConsoleStyle.foregroundColor(_text, ConsoleColor.white));

  // Background Colors
  ConsoleText get bgBlack =>
      _copy(ConsoleStyle.backgroundColor(_text, ConsoleColor.black));
  ConsoleText get bgRed =>
      _copy(ConsoleStyle.backgroundColor(_text, ConsoleColor.red));
  ConsoleText get bgGreen =>
      _copy(ConsoleStyle.backgroundColor(_text, ConsoleColor.green));
  ConsoleText get bgYellow =>
      _copy(ConsoleStyle.backgroundColor(_text, ConsoleColor.yellow));
  ConsoleText get bgBlue =>
      _copy(ConsoleStyle.backgroundColor(_text, ConsoleColor.blue));
  ConsoleText get bgMagenta =>
      _copy(ConsoleStyle.backgroundColor(_text, ConsoleColor.magenta));
  ConsoleText get bgCyan =>
      _copy(ConsoleStyle.backgroundColor(_text, ConsoleColor.cyan));
  ConsoleText get bgWhite =>
      _copy(ConsoleStyle.backgroundColor(_text, ConsoleColor.white));

  ConsoleText fg(ConsoleColor code) =>
      _copy(ConsoleStyle.foregroundColor(_text, code));

  ConsoleText bg(ConsoleColor code) =>
      _copy(ConsoleStyle.backgroundColor(_text, code));

  ConsoleText get bold => _copy(ConsoleStyle.bold(_text));

  ConsoleText get italic => _copy(ConsoleStyle.italic(_text));

  ConsoleText get underline => _copy(ConsoleStyle.underline(_text));

  ConsoleText get blink => _copy(ConsoleStyle.blink(_text));

  ConsoleText get reverse => _copy(ConsoleStyle.reverse(_text));

  ConsoleText get hidden => _copy(ConsoleStyle.hidden(_text));

  ConsoleText get newline => _copy('$_text\n');

  ConsoleText color({ConsoleColor? fg, ConsoleColor? bg}) =>
      _copy(ConsoleStyle.color(_text, fg: fg, bg: bg));

  ConsoleText reset() => _copy(ConsoleStyle.clear + _text);

  // カーソル操作
  ConsoleText moveCursorUp(int lines) =>
      _copy(_text + ConsoleStyle.moveCursorUp(lines));

  ConsoleText moveCursorDown(int lines) =>
      _copy(_text + ConsoleStyle.moveCursorDown(lines));

  ConsoleText moveCursorRight(int columns) =>
      _copy(_text + ConsoleStyle.moveCursorRight(columns));

  ConsoleText moveCursorLeft(int columns) =>
      _copy(_text + ConsoleStyle.moveCursorLeft(columns));

  ConsoleText setCursorPosition(int row, int col) =>
      _copy(_text + ConsoleStyle.setCursorPosition(row, col));

  ConsoleText saveCursorPosition() =>
      _copy(_text + ConsoleStyle.saveCursorPosition());

  ConsoleText restoreCursorPosition() =>
      _copy(_text + ConsoleStyle.restoreCursorPosition());

  ConsoleText hideCursor() => _copy(_text + ConsoleStyle.hideCursor());

  ConsoleText showCursor() => _copy(_text + ConsoleStyle.showCursor());

  // 画面操作
  ConsoleText clearScreen() => _copy(_text + ConsoleStyle.clearScreen());

  ConsoleText clearLine() => _copy(_text + ConsoleStyle.clearLine());

  ConsoleText clearFromCursorToEnd() =>
      _copy(_text + ConsoleStyle.clearFromCursorToEnd());

  ConsoleText clearFromCursorToBeginning() =>
      _copy(_text + ConsoleStyle.clearFromCursorToBeginning());

  ConsoleText bordered({
    BorderStyle style = const BorderStyle(),
  }) {
    var borderedText = style.createBorderedText(_text);
    return _copy(borderedText);
  }

  ConsoleText log({
    DateTime? time,
    int? sequenceNumber,
    int level = 0,
    String name = '',
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      _text,
      time: time,
      sequenceNumber: sequenceNumber,
      level: level,
      name: name,
      zone: zone,
      error: error,
      stackTrace: stackTrace,
    );
    return this;
  }

  @override
  String toString() => _text;

  ConsoleText operator +(ConsoleText other) {
    var combinedText = _text + other._text;

    return ConsoleText._(combinedText);
  }

  String get originalText => ConsoleStyle.removeEscapeSequences(_text);
}

class BorderStyle {
  final ConsoleColor? borderColor;
  final String horizontalBorderCharacter;
  final String topLeftCornerCharacter;
  final String topRightCornerCharacter;
  final String bottomLeftCornerCharacter;
  final String bottomRightCornerCharacter;
  final String verticalBorderCharacter;

  final bool enableTopBorder;
  final bool enableBottomBorder;
  final bool enableLeftBorder;
  final bool enableRightBorder;

  const BorderStyle({
    this.borderColor,
    this.horizontalBorderCharacter = '─',
    this.topLeftCornerCharacter = "┌",
    this.topRightCornerCharacter = "┐",
    this.bottomLeftCornerCharacter = "└",
    this.bottomRightCornerCharacter = "┘",
    this.verticalBorderCharacter = '│',
    this.enableTopBorder = true,
    this.enableBottomBorder = true,
    this.enableLeftBorder = true,
    this.enableRightBorder = true,
  });

  /// Creates a bordered text based on the current border style.
  String createBorderedText(String text) {
    // 各行を分割
    var lines = text.split('\n');

    // 最も長い行の実際の表示上の長さを取得
    var maxLength = lines.fold(
        0,
        (length, line) =>
            max(length, ConsoleStyle.removeEscapeSequences(line).length));

    // 上部境界を作成
    var topBorder =
        '$topLeftCornerCharacter${horizontalBorderCharacter * (maxLength + 2)}$topRightCornerCharacter';
    topBorder = applyToText(topBorder);

    // 下部境界を作成
    var bottomBorder =
        '$bottomLeftCornerCharacter${horizontalBorderCharacter * (maxLength + 2)}$bottomRightCornerCharacter';
    bottomBorder = applyToText(bottomBorder);

    // 各行を囲む
    var borderedLines = lines.map((line) {
      var verticalBar = verticalBorderCharacter;
      verticalBar = applyToText(verticalBar);
      var paddedLength = maxLength +
          line.length -
          ConsoleStyle.removeEscapeSequences(line).length;
      var paddedLine =
          '${enableLeftBorder.map(() => verticalBar, () => "")} ${line.padRight(paddedLength)} ${enableRightBorder.map(() => verticalBar, () => "")}';
      return paddedLine;
    }).join('\n');

    return '${enableTopBorder.map(() => "$topBorder\n", () => "")}$borderedLines${enableBottomBorder.map(() => "\n$bottomBorder", () => "")}';
  }

  String applyToText(String text) {
    if (borderColor != null) {
      text = ConsoleStyle.foregroundColor(text, borderColor!);
    }

    return text;
  }

  factory BorderStyle.dotted({
    ConsoleColor? borderColor,
    bool? enableTopBorder,
    bool? enableBottomBorder,
    bool? enableLeftBorder,
    bool? enableRightBorder,
  }) =>
      BorderStyle(
        borderColor: borderColor,
        enableBottomBorder: enableBottomBorder ?? true,
        enableLeftBorder: enableLeftBorder ?? true,
        enableRightBorder: enableRightBorder ?? true,
        enableTopBorder: enableTopBorder ?? true,
        horizontalBorderCharacter: '.',
        topLeftCornerCharacter: "o",
        topRightCornerCharacter: "o",
        bottomLeftCornerCharacter: "o",
        bottomRightCornerCharacter: "o",
        verticalBorderCharacter: ':',
      );

  factory BorderStyle.thick({
    ConsoleColor? borderColor,
    bool? enableTopBorder,
    bool? enableBottomBorder,
    bool? enableLeftBorder,
    bool? enableRightBorder,
  }) =>
      BorderStyle(
        borderColor: borderColor,
        enableBottomBorder: enableBottomBorder ?? true,
        enableLeftBorder: enableLeftBorder ?? true,
        enableRightBorder: enableRightBorder ?? true,
        enableTopBorder: enableTopBorder ?? true,
        horizontalBorderCharacter: '=',
        topLeftCornerCharacter: "**",
        topRightCornerCharacter: "**",
        bottomLeftCornerCharacter: "**",
        bottomRightCornerCharacter: "**",
        verticalBorderCharacter: '||',
      );

  /// Unicode box-drawing characters
  factory BorderStyle.box({
    ConsoleColor? borderColor,
    bool? enableTopBorder,
    bool? enableBottomBorder,
    bool? enableLeftBorder,
    bool? enableRightBorder,
  }) =>
      BorderStyle(
        borderColor: borderColor,
        enableBottomBorder: enableBottomBorder ?? true,
        enableLeftBorder: enableLeftBorder ?? true,
        enableRightBorder: enableRightBorder ?? true,
        enableTopBorder: enableTopBorder ?? true,
        horizontalBorderCharacter: '─',
        topLeftCornerCharacter: "┌",
        topRightCornerCharacter: "┐",
        bottomLeftCornerCharacter: "└",
        bottomRightCornerCharacter: "┘",
        verticalBorderCharacter: '│',
      );

  factory BorderStyle.solid({
    ConsoleColor? borderColor,
    bool? enableTopBorder,
    bool? enableBottomBorder,
    bool? enableLeftBorder,
    bool? enableRightBorder,
  }) =>
      BorderStyle(
        borderColor: borderColor,
        enableBottomBorder: enableBottomBorder ?? true,
        enableLeftBorder: enableLeftBorder ?? true,
        enableRightBorder: enableRightBorder ?? true,
        enableTopBorder: enableTopBorder ?? true,
        topLeftCornerCharacter: "+",
        topRightCornerCharacter: "+",
        bottomLeftCornerCharacter: "+",
        bottomRightCornerCharacter: "+",
        horizontalBorderCharacter: '-',
        verticalBorderCharacter: '|',
      );
}

extension ConsoleTextExtension on String {
  ConsoleText get styled => ConsoleText.create(this);
}

extension ConsoleTextListExtension on Map<String, dynamic> {
  ConsoleText get styled => ConsoleText.prettyPrintJson(this);
}

enum ConsoleColor {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
}
