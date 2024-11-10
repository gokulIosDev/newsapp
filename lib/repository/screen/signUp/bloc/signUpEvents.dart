abstract class SignUpEvents {}

class SignUpUserEvents extends SignUpEvents {
  String email;
  String password;
  String userName;

  SignUpUserEvents(
      {required this.email, required this.password, required this.userName});
}