class changepasswordstates{}
class changepasswordsinitialState extends  changepasswordstates {}
class changepasswordLoadingState extends  changepasswordstates {}
class changepasswordSucsessStates extends  changepasswordstates{}
class changepasswordFailerStates extends  changepasswordstates{
  String errmassge;
  changepasswordFailerStates({required this.errmassge });
}


