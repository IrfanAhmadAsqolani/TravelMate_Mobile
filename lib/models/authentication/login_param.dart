import '../../dependencies/dependencies.dart';

class LoginParam extends Equatable {
  final String username;
  final String password;

  const LoginParam({
    required this.username,
    required this.password,
  });

  LoginParam copyWith({String? username, String? password}) {
    return LoginParam(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [username, password];
}
