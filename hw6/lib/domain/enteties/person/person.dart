import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'person.freezed.dart';

part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    @Default(0) int counter,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json)
  => _$PersonFromJson(json);
}
