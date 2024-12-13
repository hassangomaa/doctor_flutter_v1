import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? avatar;
  final String? email;
  final String? phone;
  final String? countryCode;
  final String? lang;
  final DateTime? emailVerifiedAt;
  final dynamic emailVerificationToken;
  final int? status;
  final int? active;
  final dynamic apiToken;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? role;
  final dynamic address;
  final String? location;
  final dynamic fcmToken;
  final int? tall;
  final String? birthDate;
  final String? nationalId;
  final String? bloodType;
  final int? walkPlan;
  final String? weight;
  final String? bmi;

  const User({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.phone,
    this.countryCode,
    this.lang,
    this.emailVerifiedAt,
    this.emailVerificationToken,
    this.status,
    this.active,
    this.apiToken,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.address,
    this.location,
    this.fcmToken,
    this.tall,
    this.birthDate,
    this.nationalId,
    this.bloodType,
    this.walkPlan,
    this.weight,
    this.bmi,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        avatar: json['avatar'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        countryCode: json['country_code'] as String?,
        lang: json['lang'] as String?,
        emailVerifiedAt: json['email_verified_at'] == null
            ? null
            : DateTime.parse(json['email_verified_at'] as String),
        emailVerificationToken: json['email_verification_token'] as dynamic,
        status: json['status'] as int?,
        active: json['active'] as int?,
        apiToken: json['api_token'] as dynamic,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        role: json['role'] as String?,
        address: json['address'] as dynamic,
        location: json['location'] as String?,
        fcmToken: json['fcm_token'] as dynamic,
        tall: json['tall'] as int?,
        birthDate: json['birth_date'] as String?,
        nationalId: json['national_id'] as String?,
        bloodType: json['blood_type'] as String?,
        walkPlan: json['walk_plan'] as int?,
        weight: json['weight'] as String?,
        bmi: json['bmi'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'email': email,
        'phone': phone,
        'country_code': countryCode,
        'lang': lang,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'email_verification_token': emailVerificationToken,
        'status': status,
        'active': active,
        'api_token': apiToken,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'role': role,
        'address': address,
        'location': location,
        'fcm_token': fcmToken,
        'tall': tall,
        'birth_date': birthDate,
        'national_id': nationalId,
        'blood_type': bloodType,
        'walk_plan': walkPlan,
        'weight': weight,
        'bmi': bmi,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      avatar,
      email,
      phone,
      countryCode,
      lang,
      emailVerifiedAt,
      emailVerificationToken,
      status,
      active,
      apiToken,
      deletedAt,
      createdAt,
      updatedAt,
      role,
      address,
      location,
      fcmToken,
      tall,
      birthDate,
      nationalId,
      bloodType,
      walkPlan,
      weight,
      bmi,
    ];
  }
}
