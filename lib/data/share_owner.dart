import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'share_owner.g.dart';

@JsonSerializable()
@immutable
class ShareOwner {
  final int id;
  @JsonKey(name: "can_shop") //: true,
  final bool canShop;
  @JsonKey(name: "num_shares") //: 7,
  final int numShares;
  @JsonKey(name: "absolute_url") //: "/accounts/user/1005/",
  final String absoluteUrl;
  @JsonKey(name: "is_company") //: false,
  final bool isCompany;
  @JsonKey(name: "company_name") //: "",
  final String companyName;
  @JsonKey(name: "is_investing") //: false,
  final bool isInvesting;
  @JsonKey(name: "signed_sepa_mandate") //: false,
  final bool signedSepaMandate;
  @JsonKey(name: "sepa_account_holder") //: "",
  final String sepaAccountHolder;
  @JsonKey(name: "sepa_iban") //: "",
  final String sepaIban;
  final bool ratenzahlung;
  @JsonKey(name: "attended_welcome_session") //: true,
  final bool attendedWelcomeSession;
  @JsonKey(name: "paid_membership_fee") //: true,
  final bool paidMembershipFee;
  @JsonKey(name: "willing_to_gift_a_share") //: null,
  final String? willingToGiftAShare;
  @JsonKey(name: "external_id")
  final String externalId;

  final MemberStatus status;

  const ShareOwner({
    required this.id,
    required this.canShop,
    required this.numShares,
    required this.absoluteUrl,
    required this.isCompany,
    required this.companyName,
    required this.isInvesting,
    required this.signedSepaMandate,
    required this.sepaAccountHolder,
    required this.sepaIban,
    required this.ratenzahlung,
    required this.attendedWelcomeSession,
    required this.paidMembershipFee,
    required this.willingToGiftAShare,
    required this.externalId,
    required this.status,
  });

  factory ShareOwner.fromJson(Map<String, dynamic> json) =>
      _$ShareOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$ShareOwnerToJson(this);
}

enum MemberStatus { sold, investing, active }
