// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroupData {
  GroupInfo get groupInfo => throw _privateConstructorUsedError;
  List<GroupMember> get members => throw _privateConstructorUsedError;
  List<Expense> get expenses => throw _privateConstructorUsedError;
  DashboardData get dashboardData => throw _privateConstructorUsedError;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupDataCopyWith<GroupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDataCopyWith<$Res> {
  factory $GroupDataCopyWith(GroupData value, $Res Function(GroupData) then) =
      _$GroupDataCopyWithImpl<$Res, GroupData>;
  @useResult
  $Res call(
      {GroupInfo groupInfo,
      List<GroupMember> members,
      List<Expense> expenses,
      DashboardData dashboardData});

  $GroupInfoCopyWith<$Res> get groupInfo;
  $DashboardDataCopyWith<$Res> get dashboardData;
}

/// @nodoc
class _$GroupDataCopyWithImpl<$Res, $Val extends GroupData>
    implements $GroupDataCopyWith<$Res> {
  _$GroupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupInfo = null,
    Object? members = null,
    Object? expenses = null,
    Object? dashboardData = null,
  }) {
    return _then(_value.copyWith(
      groupInfo: null == groupInfo
          ? _value.groupInfo
          : groupInfo // ignore: cast_nullable_to_non_nullable
              as GroupInfo,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      dashboardData: null == dashboardData
          ? _value.dashboardData
          : dashboardData // ignore: cast_nullable_to_non_nullable
              as DashboardData,
    ) as $Val);
  }

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupInfoCopyWith<$Res> get groupInfo {
    return $GroupInfoCopyWith<$Res>(_value.groupInfo, (value) {
      return _then(_value.copyWith(groupInfo: value) as $Val);
    });
  }

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardDataCopyWith<$Res> get dashboardData {
    return $DashboardDataCopyWith<$Res>(_value.dashboardData, (value) {
      return _then(_value.copyWith(dashboardData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupDataImplCopyWith<$Res>
    implements $GroupDataCopyWith<$Res> {
  factory _$$GroupDataImplCopyWith(
          _$GroupDataImpl value, $Res Function(_$GroupDataImpl) then) =
      __$$GroupDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GroupInfo groupInfo,
      List<GroupMember> members,
      List<Expense> expenses,
      DashboardData dashboardData});

  @override
  $GroupInfoCopyWith<$Res> get groupInfo;
  @override
  $DashboardDataCopyWith<$Res> get dashboardData;
}

/// @nodoc
class __$$GroupDataImplCopyWithImpl<$Res>
    extends _$GroupDataCopyWithImpl<$Res, _$GroupDataImpl>
    implements _$$GroupDataImplCopyWith<$Res> {
  __$$GroupDataImplCopyWithImpl(
      _$GroupDataImpl _value, $Res Function(_$GroupDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupInfo = null,
    Object? members = null,
    Object? expenses = null,
    Object? dashboardData = null,
  }) {
    return _then(_$GroupDataImpl(
      groupInfo: null == groupInfo
          ? _value.groupInfo
          : groupInfo // ignore: cast_nullable_to_non_nullable
              as GroupInfo,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<GroupMember>,
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      dashboardData: null == dashboardData
          ? _value.dashboardData
          : dashboardData // ignore: cast_nullable_to_non_nullable
              as DashboardData,
    ));
  }
}

/// @nodoc

class _$GroupDataImpl implements _GroupData {
  const _$GroupDataImpl(
      {required this.groupInfo,
      required final List<GroupMember> members,
      required final List<Expense> expenses,
      required this.dashboardData})
      : _members = members,
        _expenses = expenses;

  @override
  final GroupInfo groupInfo;
  final List<GroupMember> _members;
  @override
  List<GroupMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<Expense> _expenses;
  @override
  List<Expense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  @override
  final DashboardData dashboardData;

  @override
  String toString() {
    return 'GroupData(groupInfo: $groupInfo, members: $members, expenses: $expenses, dashboardData: $dashboardData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupDataImpl &&
            (identical(other.groupInfo, groupInfo) ||
                other.groupInfo == groupInfo) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            (identical(other.dashboardData, dashboardData) ||
                other.dashboardData == dashboardData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      groupInfo,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_expenses),
      dashboardData);

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupDataImplCopyWith<_$GroupDataImpl> get copyWith =>
      __$$GroupDataImplCopyWithImpl<_$GroupDataImpl>(this, _$identity);
}

abstract class _GroupData implements GroupData {
  const factory _GroupData(
      {required final GroupInfo groupInfo,
      required final List<GroupMember> members,
      required final List<Expense> expenses,
      required final DashboardData dashboardData}) = _$GroupDataImpl;

  @override
  GroupInfo get groupInfo;
  @override
  List<GroupMember> get members;
  @override
  List<Expense> get expenses;
  @override
  DashboardData get dashboardData;

  /// Create a copy of GroupData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupDataImplCopyWith<_$GroupDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
