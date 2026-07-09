class RegistrationRequest {
  String name;
  String email;
  String password;

  RegistrationRequest({
    required this.email,
    required this.name,
    required this.password,
  });
}