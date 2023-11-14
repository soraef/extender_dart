// lib/generators.dart
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:extender_dart/extender_dart.dart';

class FreezedFieldEnumGenerator
    extends GeneratorForAnnotation<FreezedFieldEnum> {
  @override
  generateForAnnotatedElement(
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

    Set<String> fields = {};

    for (var interface in (element).constructors) {
      for (final param in interface.parameters) {
        fields.add(param.name);
      }
    }

    if (fields.isEmpty) {
      throw InvalidGenerationSourceError(
        "There's no field in ${element.name}.",
      );
    }

    final enumName = '${element.name}Field';
    final enumContent = fields.map((name) => '  $name').join(',\n');

    // enum定義を返す
    return 'enum $enumName {\n$enumContent\n}';
  }
}
