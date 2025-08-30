class LoginStates{}

class LogininitialState extends LoginStates{}
class  LoginLogding extends LoginStates{}
class LoginSucessSate extends LoginStates{}
class Loginfalierstate extends LoginStates{
  String errmassge;
  Loginfalierstate({required this.errmassge});

}