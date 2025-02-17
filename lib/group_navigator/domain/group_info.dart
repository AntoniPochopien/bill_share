import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_info.freezed.dart';

@freezed
class GroupInfo with _$GroupInfo {
  const factory GroupInfo({
    required int id,
    required String name,
    required String accessCode,
    required bool locked,
    String? imageUrl,
  }) = _GroupInfo;
}
