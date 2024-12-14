// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseImpl _$$ExpenseImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseImpl(
      id: (json['id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      title: json['title'] as String,
      payer: GroupMember.fromJson(json['payer'] as Map<String, dynamic>),
      creator: GroupMember.fromJson(json['creator'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      beneficiaries: (json['beneficiaries'] as List<dynamic>)
          .map((e) => ExpenseBeneficiaries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExpenseImplToJson(_$ExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'title': instance.title,
      'payer': instance.payer,
      'creator': instance.creator,
      'amount': instance.amount,
      'created_at': instance.createdAt.toIso8601String(),
      'beneficiaries': instance.beneficiaries,
    };
