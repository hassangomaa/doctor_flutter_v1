import 'package:doctor_flutter_v1/model/doctor/doctor_patients.dart';
import 'package:doctor_flutter_v1/model/meta.dart';
import 'package:doctor_flutter_v1/model/patient/appointments.dart';
import 'package:doctor_flutter_v1/model/health_record/health_record_model_data.dart';
import 'package:doctor_flutter_v1/model/medical_history/medical_history_model_data.dart';
import 'package:equatable/equatable.dart';

class PatientModelData extends Equatable {
  int? id;
  String? name;
  String? avatar;
  String? email;
  String? phone;
  String? country_code;
  String? lang;
  int? status;
  int? active;
  String? address;
  String? location;
  String? role;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  List<HealthRecordModelData>? healthRecord;
  List<MedicalHistoryModelData>? medicalHistory;
  List<DoctorPatients>? doctorPatients;
  List<Appointments>? appointments;
  dynamic tall;
  dynamic birth_date;
  dynamic blood_type;
  dynamic walk_plan;
  dynamic weight;
  dynamic bmi;
  PatientModelData(
      {required this.id,
      required this.name,
      required this.avatar,
      required this.email,
      required this.phone,
      required this.country_code,
      required this.lang,
      required this.status,
      required this.active,
      required this.address,
      required this.medicalHistory,
      required this.location,
      required this.role,
      required this.created_at,
      required this.updated_at,
      required this.doctorPatients,
      required this.deleted_at,
      required this.healthRecord,
      required this.appointments,
      required this.tall,
      required this.birth_date,
      required this.blood_type,
      required this.walk_plan,
      required this.weight,
      required this.bmi});

  factory PatientModelData.fromJson(Map<String?, dynamic> json) {
    return PatientModelData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      country_code: json['country_code'] ?? '',
      lang: json['lang'] ?? '',
      doctorPatients: List<DoctorPatients>.from(
          json['doctorPatients'].map((x) => DoctorPatients.fromJson(x))),
      medicalHistory: List<MedicalHistoryModelData>.from(json['medical_history']
          .map((x) => MedicalHistoryModelData.fromJson(x))),
      status: json['status'] ?? 0,
      active: json['active'] ?? 0,
      address: json['address'] ?? '',
      location: json['location'] ?? '',
      role: json['role'] ?? '',
      created_at: json['created_at'] ?? '',
      updated_at: json['updated_at'] ?? '',
      deleted_at: json['deleted_at'] ?? '',
      appointments: List<Appointments>.from(
        json['appointments'].map((x) => Appointments.fromJson(x)),
      ),
      healthRecord: json['health_records'] == null
          ? []
          : List<HealthRecordModelData>.from(json['health_records']
              .map((x) => HealthRecordModelData.fromJson(x))),
      tall: json['tall'] ?? 0,
      birth_date: json['birth_date'] ?? 0,
      blood_type: json['blood_type'] ?? 0,
      walk_plan: json['walk_plan'] ?? 0,
      weight: json['weight'] ?? 0,
      bmi: json['bmi'] ?? 0,
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['email'] = email;
    data['phone'] = phone;
    data['country_code'] = country_code;
    data['lang'] = lang;
    data['status'] = status;
    data['active'] = active;
    data['address'] = address;
    data['location'] = location;

    data['role'] = role;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;

    data['appointments'] = appointments?.map((x) => x.toJson()).toList();
    data['healthRecord'] = healthRecord?.map((x) => x.toJson()).toList();
    data['medicalHistory'] = medicalHistory?.map((x) => x.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        avatar,
        email,
        phone,
        healthRecord,
        country_code,
        lang,
        status,
        active,
        address,
        doctorPatients,
        medicalHistory,
        location,
        role,
        created_at,
        updated_at,
        deleted_at
      ];
}
