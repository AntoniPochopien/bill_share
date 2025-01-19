import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';


@freezed
class UserData with _$UserData {
  const factory UserData({
    String? username,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
