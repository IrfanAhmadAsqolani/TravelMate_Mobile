import '../../constants/constants.dart';
import '../../dependencies/dependencies.dart';
import '../../enums/enums.dart';
import '../../helpers/helpers.dart';

class UserMdl extends Equatable {
  final int? id;
  final String? username;
  final String? fullName;
  final int? identityNumber;
  final String? pending;
  final VerificationStatus? verificationStatus;
  final int? contactNumber;
  final String? pictUrl;
  final bool? rememberMe;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? identityPictUrl;
  final List<String>? interests;

  const UserMdl({
    this.id,
    this.username,
    this.fullName,
    this.identityNumber,
    this.pending,
    this.verificationStatus,
    this.contactNumber,
    this.pictUrl,
    this.rememberMe,
    this.createdAt,
    this.updatedAt,
    this.identityPictUrl,
    this.interests,
  });

  String get pictImageUrl {
    if (pictUrl == '-') {
      return '';
    }
    return '${CommonConstant.networkImageUrl}$pictUrl';
  }

  String get identityPictImageUrl {
    if (pictUrl == '-') {
      return '';
    }
    return '${CommonConstant.networkImageUrl}$identityPictUrl';
  }

  bool get isInterestEmpty =>
      interests?[0] == '0' || (interests?.isEmpty ?? true);

  UserMdl copyWith({
    int? id,
    String? username,
    String? fullName,
    int? identityNumber,
    String? pending,
    VerificationStatus? verificationStatus,
    int? contactNumber,
    String? pictUrl,
    bool? rememberMe,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? identityPictUrl,
    List<String>? interests,
  }) {
    return UserMdl(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      identityNumber: identityNumber ?? this.identityNumber,
      pending: pending ?? this.pending,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      contactNumber: contactNumber ?? this.contactNumber,
      pictUrl: pictUrl ?? this.pictUrl,
      rememberMe: rememberMe ?? this.rememberMe,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      identityPictUrl: identityPictUrl ?? this.identityPictUrl,
      interests: interests ?? this.interests,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'fullname': fullName,
      'identity_number': identityNumber,
      'pending': pending,
      'status': verificationStatus?.name,
      'contact_number': contactNumber,
      'pict_url': pictUrl,
      'remember_me': rememberMe,
      'created_at': DateHelper.getReadableDate(createdAt),
      'updated_at': DateHelper.getReadableDate(updatedAt),
      'identity_pict_url': identityPictUrl,
      'interests': interests?.join(',') ?? '0',
    };
  }

  factory UserMdl.fromMap(Map<String, dynamic> map) {
    return UserMdl(
      id: map['id'],
      username: map['username'],
      fullName: map['fullname'],
      identityNumber: map['identity_number'],
      pending: map['pending'],
      verificationStatus: VerificationStatus.values.firstWhere(
        (status) => status.name == map['status'],
        orElse: () => VerificationStatus.pending,
      ),
      contactNumber: map['contact_number'],
      pictUrl: map['pict_url'],
      rememberMe: map['remember_me'],
      createdAt: DateTime.tryParse(map['created_at']),
      updatedAt: DateTime.tryParse(map['updated_at']),
      identityPictUrl: map['identity_pict_url'],
      interests: (map['interests'] as String).split(','),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      username,
      fullName,
      identityNumber,
      pending,
      verificationStatus,
      contactNumber,
      pictUrl,
      rememberMe,
      createdAt,
      updatedAt,
      identityPictUrl,
      interests,
    ];
  }
}
