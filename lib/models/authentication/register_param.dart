class RegisterParam {
  final String username;
  final String fullName;
  final int identityNumber;
  final String password;
  final int contactNumber;

  const RegisterParam({
    required this.username,
    required this.fullName,
    required this.identityNumber,
    required this.password,
    required this.contactNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'fullname': fullName,
      'identity_number': identityNumber,
      'password': password,
      'contact_number': contactNumber,
      'interests': '0',
    };
  }
}
