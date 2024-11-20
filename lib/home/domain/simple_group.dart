import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_group.freezed.dart';

@freezed
class SimpleGroup with _$SimpleGroup {
  const factory SimpleGroup({
  required  int id,
  required String name
  })=_SimpleGroup;
}