import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_group.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class SimpleGroup with _$SimpleGroup {
  const SimpleGroup._();
  const factory SimpleGroup({
    required int id,
    required String name,
    required bool isAdmin,
    required int membersCount,
  }) = _SimpleGroup;

  static SimpleGroup fromJson(Map<String, dynamic> data) {
    final group = data['groups'];
    return SimpleGroup(
        id: group['id'], name: group['name'], isAdmin: data['isAdmin'], membersCount: group['membersCount'][0]['count']);
  }
}
