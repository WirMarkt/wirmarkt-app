// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareOwner _$ShareOwnerFromJson(Map<String, dynamic> json) => ShareOwner(
      id: json['id'] as int,
      canShop: json['can_shop'] as bool,
      numShares: json['num_shares'] as int,
      absoluteUrl: json['absolute_url'] as String,
      isCompany: json['is_company'] as bool,
      companyName: json['company_name'] as String,
      isInvesting: json['is_investing'] as bool,
      signedSepaMandate: json['signed_sepa_mandate'] as bool,
      sepaAccountHolder: json['sepa_account_holder'] as String,
      sepaIban: json['sepa_iban'] as String,
      ratenzahlung: json['ratenzahlung'] as bool,
      attendedWelcomeSession: json['attended_welcome_session'] as bool,
      paidMembershipFee: json['paid_membership_fee'] as bool,
      willingToGiftAShare: json['willing_to_gift_a_share'] as String?,
      externalId: json['external_id'] as String,
      status: $enumDecode(_$MemberStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ShareOwnerToJson(ShareOwner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'can_shop': instance.canShop,
      'num_shares': instance.numShares,
      'absolute_url': instance.absoluteUrl,
      'is_company': instance.isCompany,
      'company_name': instance.companyName,
      'is_investing': instance.isInvesting,
      'signed_sepa_mandate': instance.signedSepaMandate,
      'sepa_account_holder': instance.sepaAccountHolder,
      'sepa_iban': instance.sepaIban,
      'ratenzahlung': instance.ratenzahlung,
      'attended_welcome_session': instance.attendedWelcomeSession,
      'paid_membership_fee': instance.paidMembershipFee,
      'willing_to_gift_a_share': instance.willingToGiftAShare,
      'external_id': instance.externalId,
      'status': _$MemberStatusEnumMap[instance.status],
    };

const _$MemberStatusEnumMap = {
  MemberStatus.sold: 'sold',
  MemberStatus.investing: 'investing',
  MemberStatus.active: 'active',
};
