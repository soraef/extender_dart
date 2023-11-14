import 'package:build/build.dart';
import 'package:extender_dart_builder/class_field_enum/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder extenderDartBuilder(BuilderOptions options) =>
    SharedPartBuilder([ClassFieldEnumGenerator()], 'extender_dart');
