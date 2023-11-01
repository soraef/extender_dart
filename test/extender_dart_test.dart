import 'package:extender_dart/src/classes/console_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("hoge", () {
    print("\n");
    print("Success".styled.green); // 緑色のテキスト
    print("Warning".styled.bgRed.white); //白のテキスト、赤背景

    print("\n");
    print("Bold Text".styled.bold); // 太字
    print("Italic Text".styled.italic); // イタリック
    print("Underlined Text".styled.underline); // 下線付き
    print("\n");

    print("Bordered Text".styled.bordered()); // ボーダー付き
    print("Thick Border".styled.bordered(style: BorderStyle.thick())); // 太いボーダー
    print("Dotted Border"
        .styled
        .bordered(style: BorderStyle.dotted())); // 点線のボーダー
    print("\n");

    var user = {
      'name': 'Alice',
      'age': 28,
      'address': {'city': 'Tokyo', 'zip': '100-0001'}
    };
    print(
      "json".styled.bordered(style: BorderStyle.box(enableBottomBorder: false)),
    );
    print(user.styled.blue.bordered()); // 青色でボーダー付きのJSON表示
  });
}
