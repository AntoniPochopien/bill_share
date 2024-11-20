import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_group.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class SimpleGroup with _$SimpleGroup {
  const SimpleGroup._();
  const factory SimpleGroup({
  required  int id,
  required String name
  })=_SimpleGroup;

  static SimpleGroup fromJson(Map<String,dynamic> data)=> SimpleGroup(id: data['id'], name: data['name']);
}