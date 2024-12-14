// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_beneficiaries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseBeneficiariesImpl _$$ExpenseBeneficiariesImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseBeneficiariesImpl(
      beneficiary:
          GroupMember.fromJson(json['beneficiary'] as Map<String, dynamic>),
      share: (json['share'] as num).toDouble(),
    );

Map<String, dynamic> _$$ExpenseBeneficiariesImplToJson(
        _$ExpenseBeneficiariesImpl instance) =>
    <String, dynamic>{
      'beneficiary': instance.beneficiary,
      'share': instance.share,
    };
