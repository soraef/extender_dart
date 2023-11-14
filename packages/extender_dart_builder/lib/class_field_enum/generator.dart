// lib/generators.dart
import 'package:extender_dart/extender_dart.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

class ClassFieldEnumGenerator extends GeneratorForAnnotation<ClassFieldEnum> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'Generator cannot target `${element.name}`.',
          todo: 'Remove the EnumGeneration annotation from `${element.name}`.',
          element: element);
    }

    final fields = element.fields
        .where((field) => !field.isStatic && !field.isSynthetic)
        .map((field) => field.name)
        .toList();

    // enumの文字列を生成
    final enumName = '${element.name}Enum';
    final enumContent = fields.map((name) => '  $name').join(',\n');

    // enum定義を返す
    return 'enum $enumName {\n$enumContent\n}';
  }
}
